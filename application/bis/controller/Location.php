<?php

namespace app\bis\controller;

class Location extends BaseController
{
    public function index()
    {
        return $this->fetch();
    }

    public function add()
    {
        if (request()->isPost()) {
            // 门店入库操作
            $data = input('post.');
            $bisId = $this->getLoginUser()->bis_id;
            // 总店信息检验
            // 获取经纬度
            $lngLat = \Map::getLngLat($data['address']);
            if (empty($lngLat) || $lngLat['status'] !== 0 || $lngLat['result']['precise'] !== 1) $this->error('无法获取数据或者匹配不精确！');
            $data['cat'] = '';
            if (!empty($data['se_category_id'])) $data['cat'] = implode('|', $data['se_category_id']);
            // 总店信息入库
            $locationData = [
                'bis_id' => $bisId,
                'name' => $data['name'],
                'logo' => $data['logo'],
                'tel' => $data['tel'],
                'contact' => $data['contact'],
                'category_id' => $data['category_id'],
                'category_path' => $data['category_id'] . ',' . $data['cat'],
                'city_id' => $data['city_id'],
                'city_path' => empty($data['se_city_id']) ? $data['city_id'] : $data['city_id'] . ',' . $data['se_city_id'],
                'address' => $data['address'],
                'api_address' => $data['address'],
                'open_time' => $data['open_time'],
                'content' => empty($data['content']) ? '' : $data['content'],
                'is_main' => 0, // 代表总店信息
                'xpoint' => empty($lngLat['result']['location']['lng']) ? '' : $lngLat['result']['location']['lng'],
                'ypoint' => empty($lngLat['result']['location']['lat']) ? '' : $lngLat['result']['location']['lat'],
            ];
            $locationId = model('BisLocation')->add($locationData);

            if ($locationId) $this->success('门店申请成功');
            else $this->error('申请失败');
        } else {
            $cities = model('city')->getNormalCityByParentId();
            $category = model('Category')->getNormalCategoryByParentId();
            return $this->fetch('', compact('cities', 'category'));
        }
    }
}