<?php
/**
 * Created by PhpStorm.
 * User: ThinkPad
 * Date: 2017/8/27
 * Time: 16:46
 */
namespace App\Admin\Controllers;

class  PermissionController extends Controller
{
    public function index()
    {
        $permissions = \App\AdminPermission::paginate(10);
        return view('admin.permission.index',compact('permissions'));
    }

    public function create()
    {
        return view('admin.permission.add');
    }

    public function store()
    {
        $this->validate(request(), [
            'name' => 'required|min:3',
            'description' => 'required'
        ]);

        \App\AdminPermission::create(request(['name', 'description']));
        return redirect('/admin/permissions');
    }
}