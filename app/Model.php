<?php

namespace App;

use Illuminate\Database\Eloquent\Model as BaseModel;

class Model extends BaseModel
{
//    protected $guarded;    //注入数据
    protected $guarded = [];
}
