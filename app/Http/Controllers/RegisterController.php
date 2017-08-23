<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;

class RegisterController extends Controller
{
    //注册页面
    public function index(){
        return view('register.index');
    }

    //注册逻辑
    public function register(){
        $this->validate(request(),[
            'name' => 'required|string|min:3|unique:users,name',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:5|max:10|confirmed'
        ]);
        $name = request('name');
        $email = request('email');
        $password = bcrypt(request('password'));
        $user = User::create(array('name'=>$name,'email'=>$email,'password'=>$password));

        return redirect('/login');
    }
}
