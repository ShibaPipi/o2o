<?php

namespace app\index\controller;

use think\Controller;

class BaseController extends Controller
{
    public $city = '';
    public $account = '';

    public function _initialize()
    {
        // 获取城市数据
        $cities = model('City')->getNormalCity();
        // 获取分类数据
        $cats = $this->getRecommendCats();
        $this->getCities($cities);
        $this->assign('city', $this->city);
        $this->assign('cities', $cities);
//        print_r($cats);exit;
        $this->assign('cats', $cats);
        // 获取 controller
        $this->assign('controller', strtolower(request()->controller()));
        // HTML 默认 title 名
        $this->assign('title', 'o2o 团购网');
        // 获取用户数据
        $this->assign('user', $this->getLoginUser());
    }

    public function getCities($cities)
    {
        foreach ($cities as $city) {
            $city = $city->toArray();

            if ($city['is_default'] === 1) {
                $defaultUName = $city['uname'];
                break;
            }
        }

        $defaultUName = $defaultUName ? $defaultUName : 'beijing';

        if (session('cityuname', '', 'o2o') && !input('get.city')) {
            $cityUName = session('cityuname', '', 'o2o');
        } else {
            $cityUName = input('get.city', $defaultUName, 'trim');
            session('cityuname', $cityUName, 'o2o');
        }

        $this->city = model('City')->where(['uname' => $cityUName])->find();
    }

    /**
     * 获取登录用户
     */
    public function getLoginUser()
    {
        return $this->account ? $this->account : session('o2o_user', '', 'o2o');
    }

    /**
     * 获取首页分类信息数据
     */
    public function getRecommendCats()
    {
        $cats = model('Category')->getNormalRecommendCatsByParentId(0, 5);

        $parentIds = $subCatArr = $recomCats = [];

        foreach ($cats as $cat) {
            $parentIds[] = $cat->id;
        }
        // 获取二级分类数据
        $subCats = model('Category')->getNormalCatsByParentId($parentIds);
//        print_r($subCats);exit;

        foreach ($subCats as $subCat) {
            $subCatArr[$subCat->parent_id][] = [
                'id' => $subCat->id,
                'name' => $subCat->name,
            ];
        }

        foreach ($cats as $cat) {
            // $recomCats 代表的是整个的一级数据和二级数据，第一个参数是一级分类，第二个参数是此一级分类下面的所有的二级分类
            $recomCats[$cat->id] = [$cat->name, empty($subCatArr[$cat->id]) ? [] : $subCatArr[$cat->id]];
        }

        return $recomCats;
    }
}