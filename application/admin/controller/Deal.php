<?php

namespace app\admin\controller;

use think\Controller;

class Deal extends Controller
{
    private $obj;

    public function _initialize()
    {
        $this->obj = model('Deal');
    }

    public function index()
    {
        // 接受搜索条件数据
        $data = input('get.');
        $sData = [];
        $start_time = '';
        $end_time = '';
        if (!empty($data['start_time']) && !empty($data['end_time']) && strtotime($data['start_time']) < strtotime($data['end_time'])) {
            $sData['create_time'] = [
                ['gt', strtotime($data['start_time'])],
                ['lt', strtotime($data['end_time'])],
            ];
            $start_time = $data['start_time'];
            $end_time = $data['end_time'];
        }
        $category_id = '';
        if (!empty($data['category_id'])) {
            $sData['category_id'] = $data['category_id'];
            $category_id = $data['category_id'];
        }
        $city_id = '';
        if (!empty($data['city_id'])) {
            $sData['city_id'] = $data['city_id'];
            $city_id = $data['city_id'];
        }
        $name = '';
        if (!empty($data['name'])) {
            $sData['name'] = ['like', '%' . $data['name'] . '%'];
            $name = $data['name'];
        }
        $deals = $this->obj->getNormalDeals($sData);

        $cityArr = $categoryArr = [];
        $cities = model('City')->getNormalCity();
        foreach ($cities as $city) {
            $cityArr[$city->id] = $city->name;
        }
        $category = model('Category')->getNormalCategoryByParentId();
        foreach ($category as $cat) {
            $categoryArr[$cat->id] = $cat->name;
        }
        return $this->fetch('', compact('cities', 'category', 'deals', 'category_id', 'city_id', 'start_time', 'end_time', 'name', 'cityArr', 'categoryArr'));
    }
}