<?php
/**
 * Created by PhpStorm.
 * User: ThinkPad
 * Date: 2017/8/27
 * Time: 16:10
 */
namespace App\Admin\Controllers;

use App\AdminUser;

class UserController extends Controller
{
    public function index()
    {
        $users = AdminUser::paginate(10);
        return view('admin.user.index',compact('users'));
    }

    public function create()
    {
        return view('admin.user.add');
    }

    public function store()
    {
        $this->validate(request(), [
            'name' => 'required|min:3',
            'password' => 'required'
        ]);

        $name = request('name');
        $password = bcrypt(request('password'));

        AdminUser::create(compact('name', 'password'));

        return redirect('/admin/users');
    }


}