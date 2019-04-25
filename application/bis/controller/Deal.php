<?php

namespace app\bis\controller;

use app\common\model\BisLocation;

class Deal extends BaseController
{
    public function index()
    {
        return $this->fetch();
    }

    public function add()
    {
        if (request()->isPost()) {
            $bisId = $this->getLoginUser()->bis_id;
            $data = input('post.');
            // 数据校验，略
//            print_r($data);exit;
            $location = model('BisLocation')->get($data['location_ids'][0]);
            $deals = [
                'bis_id' => $bisId,
                'name' => $data['name'],
                'image' => $data['image'],
                'category_id' => $data['category_id'],
                'se_category_id' => empty($data['se_category_id']) ? '' : implode(',', $data['se_category_id']),
                'city_id' => $data['city_id'],
                'city_path' => empty($data['se_city_id']) ? $data['city_id'] : $data['city_id'] . ',' . $data['se_city_id'],
                'location_ids' => empty($data['location_ids']) ? '' : implode(',', $data['location_ids']),
                'start_time' => strtotime($data['start_time']),
                'end_time' => strtotime($data['end_time']),
                'total_count' => $data['total_count'],
                'origin_price' => $data['origin_price'],
                'current_price' => $data['current_price'],
                'coupons_begin_time' => strtotime($data['coupons_begin_time']),
                'coupons_end_time' => strtotime($data['coupons_end_time']),
                'notes' => $data['notes'],
                'description' => $data['description'],
                'bis_account_id' => $this->getLoginUser()->id,
                'xpoint' => $location->xpoint,
                'ypoint' => $location->ypoint,
            ];

            $dealId = model('Deal')->add($deals);
            if ($dealId) $this->success('添加成功', url('deal/index'));
            else $this->error('添加失败');
        } else {
            $bisId = $this->getLoginUser()->bis_id;
            $cities = model('city')->getNormalCityByParentId();
            $category = model('Category')->getNormalCategoryByParentId();
            $bisLocations = model('BisLocation')->getNormalLocationByBisId($bisId);
            return $this->fetch('', compact('cities', 'category', 'bisLocations'));
        }
    }
}