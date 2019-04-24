<?php

namespace app\admin\controller;

use think\Controller;

class BaseController extends Controller
{
    public function status()
    {
        // 获取请求数据
        $data = input('get.');
        // 验证数据
        if (empty($data['id']) || !is_numeric($data['id'])) $this->error('id 不合法');
        if (!is_numeric($data['status'])) $this->error('状态不合法！');
        // 获取控制器
        $model = request()->controller();
        $res = model($model)->save(['status' => $data['status']], ['id' => $data['id']]);
        if ($res) $this->success('更新成功');
        else $this->error('更新失败');
    }
}