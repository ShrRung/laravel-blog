<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PostController extends Controller
{
    public function index(){
        $posts = [
            [
                'title' => 'this is title1'
            ],
            [
                'title' => 'this is title2'
            ],
            [
                'title' => 'this is title3'
            ],
            [
                'title' => 'this is title4'
            ]
        ];
        return view("post/index",compact("posts"));
    }

    //列表
    public function show(){
        return view("post/show",['title'=>'this is title','isShow'=>false]);
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
