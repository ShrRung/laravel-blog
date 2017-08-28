<?php
/**
 * Created by PhpStorm.
 * User: ThinkPad
 * Date: 2017/8/27
 * Time: 16:46
 */
namespace App\Admin\Controllers;

use App\AdminRole;

class  RoleController extends Controller
{
    public function index()
    {
        $roles = \App\AdminRole::paginate(10);
        return view('admin.role.index',compact('roles'));
    }

    public function create()
    {
        return view('admin.role.add');
    }

    public function store()
    {
        $this->validate(request(),[
            'name' => 'required|min:3',
            'description' => 'required'
        ]);

        \App\AdminRole::create(request(['name', 'description']));

        return redirect('/admin/roles');
    }

    public function permission(AdminRole $role)
    {
        //获取所有权限
        $permissions = \App\AdminPermission::all();
        //获取当前用户的权限
        $myPermissions = $role->permission;

        return view('admin.role.permission',compact('permissions','myPermissions','role'));
    }

    public function storePermission(AdminRole $role)
    {
        $this->validate(request(),[
            'permissions' => 'required|array'
        ]);

        $permissions = \App\AdminPermission::findMany(request('permissions')); //现在需要存的权限
        $myPermissions = $role->permissions;  //个人在编辑操作之前所拥有的权限
        //要增加的权限
        $addPermissions = $permissions->diff($myPermissions);
        foreach ($addPermissions as $permission){
            $role->grantPermission($permission);
        }
        //要删除的权限
        $deletePermissions = $myPermissions->diff($permissions);
        foreach ($deletePermissions as $permission){
            $role->deletePermission($permission);
        }

        return back();
    }


}