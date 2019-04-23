<?php

namespace app\api\controller;

use think\Controller;

class City extends Controller
{
    private $obj;

    public function _initialize()
    {
        $this->obj = model('City');
    }

    public function getCitiesByParentId()
    {
        $id = input('post.id');

        if (!intval($id)) $this->error('id 不合法');

        $cities = $this->obj->getNormalCityByParentId($id);

        if (!$cities) return show(0, 'error');
        return show(1, 'success', $cities);
    }
}