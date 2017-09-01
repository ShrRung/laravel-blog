<?php

namespace App\Http\Controllers;

use App\Comment;
use App\Post;
use App\Zan;
use Illuminate\Http\Request;

class PostController extends Controller
{
    public function index()
    {
        /*
         * 预加载
         */
        //第一种，with
        $posts = Post::orderBy('created_at','desc')->withCount(['comments','zans'])->with('user')->paginate(6);
        //第二种，load
//        $posts = Post::orderBy('created_at','desc')->withCount(['comments','zans'])->paginate(6);
//        $posts->load('user');

        return view("post/index",compact("posts"));
    }

    //列表
    public function show(Post $post)
    {
        //两种预加载模式,虽然利用关联模式，可以直接做到，但违背了MVC模式，并且那么实现会再去查一遍数据库，后期难优化
        $post->load('comments');
        return view("post/show",compact('post'));
    }

    //创建页面
    public function create()
    {
        return view("post/create");
    }

    //创建逻辑
    public function store()
    {
        $this->validate(request(),[
            'title' => 'required|string|max:100|min:5',
            'content' => 'required|string|min:10'
        ]);

        $user_id = \Auth::id();
        $params = array_merge(request(['title','content']),compact('user_id'));

        $post = Post::create($params);
        return redirect('/posts');
    }

    //编辑页面
    public function edit(Post $post)
    {
        return view('post/edit', compact('post'));
    }

    //编辑逻辑
    public function update(Post $post)
    {
        $this->validate(request(),[
            'title' => 'required|string|max:100|min:5',
            'content' => 'required|string|min:10'
        ]);

        $this->authorize('update',$post);
//        $post->title = request("title");
//        $post->content = request("content");
//        $post->save();
        $post->update(request(['title','content']));
        return redirect("posts/{$post->id}");
    }

    //删除逻辑
    public function delete(Post $post)
    {
        //用户权限认证
        $this->authorize('delete',$post);
        $post->delete();
        return redirect('/posts');
    }

    //图片上传方法
    public function imageUpload(Request $request)
    {
        $path = $request->file('wangEditorH5File')->storePublicly(md5(time()));
        return asset('storage/'. $path);
    }

    //评论
    public function comment(Post $post)
    {
        $this->validate(request(),[
            'content' => 'required|min:3'
        ]);

        //因为定义了模型关联，所以可以直接使用$post这个实例化对象
        $comment = new Comment();
        $comment->user_id = \Auth::id();
        $comment->content = request('content');
        $comment->post_id = $post->id;
        $comment->save();

        return back();
    }

    //赞
    public function zan(Post $post)
    {
        $param = [
            'user_id' => \Auth::id(),
            'post_id' => $post->id
        ];
        \App\Zan::firstOrCreate($param);
//        $zan = new \App\Zan;
//        $zan->user_id = \Auth::id();
//        $zan->post_id = $post->id;
//        $post->zans()->save($zan);
        return back();
    }

    //取消赞
    public function unzan(Post $post)
    {
        $post->zan(\Auth::id())->delete();
        return back();
    }

    //搜索结果页
    public function search()
    {
        $this->validate(request(),[
            'query' => 'required'
        ]);
        $query = request('query');

        $posts = \App\Post::search($query)->paginate(2);

        return view('post/search',compact('posts'));
    }
}
