<?php

namespace App;

use Illuminate\Database\Eloquent\Builder;
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

    //属于某个作者的文章
    public function scopeAuthorBy(Builder $query,$user_id)
    {
        return $query->where('user_id',$user_id);
    }

    public function postTopics()
    {
        return $this->hasMany(\App\PostTopic::class,'post_id','id');
    }

    //不属于某个专题的文章
    public function scopeTopicNotBy(Builder $query,$topic_id)
    {
        return $this->doesntHave('postTopics','and',function ($q) use ($topic_id){
            $q->where('topic_id',$topic_id);
        });
    }
    /*
         * 一篇文章有哪些主题
         */
//    public function topics()
//    {
//        return $this->belongsToMany(\App\Topic::class, 'post_topics', 'post_id', 'topic_id')->withPivot(['topic_id', 'post_id']);
//    }
//
//    public function postTopics()
//    {
//        return $this->hasMany(\App\PostTopic::class, 'post_id');
//    }
//
//    public function scopeTopicNotBy(Builder $query, $topic_id)
//    {
//        return $query->doesntHave('postTopics', 'and', function($q) use ($topic_id) {
//            $q->where("topic_id", $topic_id);
//        });
//    }
//
//
//    public function scopeAuthorBy($query, $user_id)
//    {
//        return $query->where('user_id', $user_id);
//    }

}
