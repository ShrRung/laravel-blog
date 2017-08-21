<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// 文章：列表、详情、创建文章、编辑文章
Route::get('/posts', '\App\Http\Controllers\PostController@index');
Route::get('/posts/create', '\App\Http\Controllers\PostController@create');
Route::post('/posts', '\App\Http\Controllers\PostController@store');
Route::get('/posts/search', '\App\Http\Controllers\PostController@search');
Route::get('/posts/{post}', '\App\Http\Controllers\PostController@show');
Route::get('/posts/{post}/edit', '\App\Http\Controllers\PostController@edit');
Route::put('/posts/{post}', '\App\Http\Controllers\PostController@update');
Route::get('/posts/{post}/delete','\App\Controllers\PostController@delete');
Route::post('/posts/img/upload', '\App\Http\Controllers\PostController@imageUpload');
Route::post('/posts/comment', '\App\Http\Controllers\PostController@comment');
Route::get('/posts/{post}/zan', '\App\Http\Controllers\PostController@zan');
Route::get('/posts/{post}/unzan', '\App\Http\Controllers\PostController@unzan');


