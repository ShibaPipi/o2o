<?php

namespace app\admin\controller;

use think\Controller;

class Category extends Controller
{
    public function index()
    {
        return $this->fetch();
    }

    public function add()
    {
        return $this->fetch();
    }

    public function save()
    {
//        print_r($_POST);
//        print_r(input('post.'));
//        print_r(request()->post());
        $data = input('post.');
        $data['status'] = 10;
        $validate = validate('category');
        if (!$validate->scene('add')->check($data)) {
            $this->error($validate->getError());
        }
        // 把 $data 数据提交给 Model 层
    }
}