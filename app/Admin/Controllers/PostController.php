<?php
/**
 * Created by PhpStorm.
 * User: ThinkPad
 * Date: 2017/8/27
 * Time: 16:46
 */
namespace App\Admin\Controllers;

use App\Post;

class  PostController extends Controller
{
    public function index()
    {
        $posts = Post::withoutGlobalScope('avaiable')->where('status',0)->orderBy('created_at','desc')->paginate(10);
        return view('admin.post.index',compact('posts'));
    }

    public function status(Post $post)
    {
        $this->validate(request(),[
            'status' => 'required|in:-1,1'
        ]);

        $post->status = request('status');
        $post->save();

        return [
            'error' => 0,
            'msg' => ''
        ];
    }
}