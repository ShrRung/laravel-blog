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
        return view("post/store");
    }

    //编辑页面
    public function edit(){
        return view("post/edit");
    }

    //编辑逻辑
    public function update(){
        return view("post/update");
    }

    //删除逻辑
    public function delete(){
        return view("post/delete");
    }
}
