<?php

namespace app\index\controller;

class Lists extends BaseController
{
    public function index()
    {
        $firstCatIds = [];
        $data = [];
        $orders = [];
        // 获取一级栏目
        $category = model('Category')->getNormalCategoryByParentId();

        foreach ($category as $cat) {
            $firstCatIds[] = $cat->id;
        }

        $id = input('get.id', 0, 'intval');
        // 判断 $id 是否为一级分类
        if (in_array($id, $firstCatIds)) { // 一级分类
            $firstCatId = $id;
            $data['category_id'] = $id;
        } elseif ($id) { // 二级分类
            // 获取二级分类数据
            $subCategory = model('Category')->get($id);

            if (!$subCategory || $subCategory->status !== 1) {
                $this->error('数据不合法');
            }

            $firstCatId = $subCategory->parent_id;
            $data['se_category_id'] = $id;
        } else { // $id = 0
            $firstCatId = 0;
        }

        $subCats = [];
        // 获取父类下面的所有子分类
        if ($firstCatId) {
            $subCats = model('Category')->getNormalCategoryByParentId($firstCatId);
        }
        // 获取排序数据
        $orderSales = input('get.order_sales', '');
        $orderPrice = input('get.order_price', '');
        $orderTime = input('get.order_time', '');

        if (!empty($orderSales)) {
            $orderFlag = 'order_sales';
            $orders['order_sales'] = $orderSales;
        } elseif (!empty($orderPrice)) {
            $orderFlag = 'order_price';
            $orders['order_price'] = $orderPrice;
        } elseif (!empty($orderTime)) {
            $orderFlag = 'order_time';
            $orders['order_time'] = $orderTime;
        } else {
            $orderFlag = '';
        }

        $data['city_id'] = $this->city->id;
        // 根据条件和排序查询商品列表
        $deals = model('Deal')->getDealByConditions($data, $orders);
//        print_r(json_encode($cats,true));exit;
        return $this->fetch('', compact('category', 'subCats', 'id', 'firstCatId', 'orderFlag', 'deals'));
    }
}