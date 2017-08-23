<?php

namespace App\Http\Controllers;

use App\Post;
use Illuminate\Http\Request;

class PostController extends Controller
{
    public function index(){
        $posts = Post::orderBy('created_at','desc')->paginate(6);
        return view("post/index",compact("posts"));
    }

    //列表
    public function show(Post $post){
        return view("post/show",compact('post'));
    }

    //创建页面
    public function create(){
        return view("post/create");
    }

    //创建逻辑
    public function store(){
        $this->validate(request(),[
            'title' => 'required|string|max:100|min:5',
            'content' => 'required|string|min:10'
        ]);

        $user_id = \Auth::id();
        $params = array_merge(request('title','content'),compact('user_id'));

        $post = Post::create($params);
        return redirect('/posts');
    }

    //编辑页面
    public function edit(Post $post){
        return view('post/edit', compact('post'));
    }

    //编辑逻辑
    public function update(Post $post){
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
    public function delete(Post $post){
        //用户权限认证
        $this->authorize('delete',$post);
        $post->delete();
        return redirect('/posts');
    }

    //图片上传方法
    public function imageUpload(Request $request){
        $path = $request->file('wangEditorH5File')->storePublicly(md5(time()));
        return asset('storage/'. $path);
    }
}
