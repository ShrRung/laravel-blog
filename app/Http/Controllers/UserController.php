<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function setting(){
        return view('user.setting');
    }

    public function settingStore(){

    }

    public function show(User $user)
    {
        //这个人信息：self-info,粉丝，关注，文章数
        $user = User::withCount(['stars','fans','posts'])->find($user->id);
        //个人文章列表，只取前10条
        $posts = $user->posts()->orderBy('created_at','desc')->take(10)->get();
        //个人关注的用户详细信息
        $stars = $user->stars;

        $susers = User::whereIn('id',$stars->pluck('star_id'))->withCount(['stars','fans','posts'])->get();
        //关注个人的用户详细信息
        $fans = $user->fans;
        $fusers = User::whereIn('id',$fans->pluck('fan_id'))->withCount(['stars','fans','posts'])->get();
//dd($fusers);
        return view('user.show',compact('user','posts','susers','fusers'));
    }

    //关注用户
    public function fan(User $user)
    {
        //当前用户
        $me = \Auth::user();
        $me->doFan($user->id);
        return [
            'error' => 0,
            'msg' => 0
        ];
    }

    //取消关注
    public function unfan(User $user)
    {
//当前用户
        $me = \Auth::user();
        $me->doUnFan($user->id);
        return [
            'error' => 0,
            'msg' => 0
        ];
    }
}
