<?php

namespace app\admin\controller;

use think\Controller;

class Category extends Controller
{
    private $obj;

    public function _initialize()
    {
        $this->obj = model('category');
    }

    public function index()
    {
        $parentId = input('get.parent_id', 0, 'intval');
        $categories = $this->obj->getFirstCategory($parentId);
        return $this->fetch('', compact('categories'));
    }

    public function add()
    {
        $categories = $this->obj->getNormalFirstCategory();
        return $this->fetch('', compact('categories'));
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
        $res = $this->obj->add($data);
        if ($res) {
            $this->success('新增成功');
        } else {
            $this->error('新增失败');
        }
    }

    public function edit($id = 0)
    {
        if (intval($id) < 1) {
            $this->error('参数不合法');
        }
        $category = $this->obj->get($id);
        $categories = $this->obj->getNormalFirstCategory();
        return $this->fetch('', compact('categories', 'category'));
    }
}