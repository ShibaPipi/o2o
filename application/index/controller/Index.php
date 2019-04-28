<?php

namespace app\index\controller;

class Index extends BaseController
{
    public function index()
    {
        // 获取首页大图

        // 获取广告位

        // 获取推荐商品数据 美食
        $deals = model('Deal')->getNormalDealByCatCityId(1, $this->city->id);
        // 获取四个子分类
        $subCats = model('Category')->getNormalRecommendCatsByParentId(1, 4);
//print_r($deals);exit;
        return $this->fetch('', compact('deals', 'subCats'));
    }

    public function test()
    {
        return 'test';
    }
}
