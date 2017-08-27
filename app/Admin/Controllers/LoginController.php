<?php
/**
 * Created by PhpStorm.
 * User: ThinkPad
 * Date: 2017/8/27
 * Time: 16:46
 */
namespace App\Admin\Controllers;



class  LoginController extends Controller
{
    public function index()
    {
        return view('admin.login.index');
    }

    public function login()
    {
        $this->validate(request(), [
            'name' => 'required|min:2',
            'password' => 'required|min:6|max:30',
        ]);

        $user = request(['name', 'password']);
        if (true == \Auth::guard('admin')->attempt($user)) {
            return redirect('/admin/home');
        }

        return \Redirect::back()->withErrors("用户名密码错误");
    }

    /*
     * 登出操作
     */
    public function logout()
    {
        \Auth::guard('admin')->logout();
        return redirect('/admin/login');
    }

}