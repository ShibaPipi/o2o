<?php

namespace app\admin\controller;

class Featured extends BaseController
{
    private $obj;

    public function _initialize()
    {
        $this->obj = model('Featured');
    }

    public function index()
    {
        $types = config('featured.featured_type');
        $type = input('get.type', 0, 'intval');
        $featured = model('Featured')->getFeaturedByType($type);
        return $this->fetch('', compact('types', 'featured', 'type'));
    }

    public function add()
    {
        if (request()->isPost()) {
            $data = input('post.');
//            unset($data['file']);
//            print_r($data);exit;
            $id = model('Featured')->allowField(true)->add($data);
            if ($id) $this->success('添加成功');
            else $this->error('添加失败');
        } else {
            // 获取推荐位类别
            $types = config('featured.featured_type');
            return $this->fetch('', compact('types'));
        }
    }
}