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

    public function role(AdminUser $user)
    {
        $roles = \App\AdminRole::all();
        $myRoles = $user->roles;
        return view('/admin/user/role',compact('roles','myRoles','user'));
    }

    public function storeRole(AdminUser $user)
    {
        $this->validate(request(),[
            'roles' => 'required|array'
        ]);

        $roles = \App\AdminRole::findMany(request('roles')); //现在需要存的角色
        $myRoles = $user->roles;  //个人在编辑操作之前所拥有的角色
        //要增加的角色
        $addRoles = $roles->diff($myRoles);
        foreach ($addRoles as $role){
            $user->assignRole($role);
        }
        //要删除的角色
        $deleteRoles = $myRoles->diff($roles);
        foreach ($deleteRoles as $role){
            $user->deleteRole($role);
        }

        return back();
    }

}