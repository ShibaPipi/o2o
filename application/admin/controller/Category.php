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
        /**
         * 验证请求类型是否为 post
         */
        if (!request()->isPost()) {
            $this->error('请求错误！');
        }
        $data = input('post.');
        $validate = validate('Category');
        if (!$validate->scene('add')->check($data)) {
            $this->error($validate->getError());
        }
        if (!empty($data['id'])) {
            return $this->update($data);
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

    public function update($data)
    {
        $res = $this->obj->save($data, ['id' => intval($data['id'])]);
        if ($res) {
            $this->success('编辑成功');
        } else {
            $this->error('编辑失败');
        }
    }

    public function listOrder($id, $list_order)
    {
        $res = $this->obj->save(['list_order' => $list_order], ['id' => $id]);
        if ($res) {
            $this->result($_SERVER['HTTP_REFERER'], 1, 'success');
        } else {
            $this->result($_SERVER['HTTP_REFERER'], 0, '失败');
        }
    }

    public function status()
    {
        $data = input('get.');
        $validate = validate('Category');
        if (!$validate->scene('status')->check($data)) {
            $this->error($validate->getError());
        }
        $res = $this->obj->save(['status' => $data['status']], ['id' => $data['id']]);
        if ($res) {
            $this->success('状态更新成功');
        } else {
            $this->error('状态更新失败');
        }
    }
}