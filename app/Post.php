<?php

namespace App;

use App\Model;

class Post extends Model
{
    //关联用户
    public function user()
    {
//        return $this->belongsTo('App\User','user_id','id');
        return $this->belongsTo('App\User');
    }

    // 一对多 评论模型（评论是多，所有加复数）
    public function comments()
    {
        return $this->hasMany('App\Comment')->orderBy('created_at','desc');
    }

    //赞和关联
    public function zan($user_id)
    {
        return $this->hasOne(\App\Zan::class)->where('user_id',$user_id);
    }

    public function zans()
    {
        return $this->hasMany(\App\Zan::class);
    }
}
