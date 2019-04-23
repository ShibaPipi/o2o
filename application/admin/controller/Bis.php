<?php

namespace app\admin\controller;

use think\Controller;

class Bis extends Controller
{
    private $obj;

    public function _initialize()
    {
        $this->obj = model('Bis');
    }

    /**
     * 入驻商户列表
     * @return mixed
     */
    public function index()
    {
        $bis = $this->obj->getBisByStatus(1);
        return $this->fetch('', compact('bis'));
    }

    /**
     * 入驻申请列表
     * @return mixed
     */
    public function apply()
    {
        $bis = $this->obj->getBisByStatus();
        return $this->fetch('', compact('bis'));
    }

    public function detail()
    {
        $id = input('get.id');
        if (empty($id)) $this->error('id 获取错误');
        $cities = model('City')->getNormalCityByParentId();
        $category = model('Category')->getNormalCategoryByParentId();
        // 获取商户数据
        $bisData = model('Bis')->get($id);
        $locationData = model('BisLocation')->get(['bis_id' => $id, 'is_main' => 1]);
        $accountData = model('BisAccount')->get(['bis_id' => $id, 'is_main' => 1]);
        return $this->fetch('', compact('cities', 'category', 'bisData', 'locationData', 'accountData'));
    }

    public function status()
    {
        $data = input('get.');
//        $validate = validate('Category');
//        if (!$validate->scene('status')->check($data)) {
//            $this->error($validate->getError());
//        }
        $res = $this->obj->save(['status' => $data['status']], ['id' => $data['id']]);
        $location = model('BisLocation')->save(['status' => $data['status']], ['bis_id' => $data['id'], 'is_main' => 1]);
        $account = model('BisAccount')->save(['status' => $data['status']], ['bis_id' => $data['id'], 'is_main' => 1]);
        if ($res && $location && $account) {
            // 发送邮件
            $this->success('状态更新成功');
        } else $this->error('状态更新失败');
    }
}