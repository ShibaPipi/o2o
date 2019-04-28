<?php

namespace app\index\controller;

class Detail extends BaseController
{
    public function index($id)
    {
        if (!intval($id)) {
            $this->error('id 不合法');
        }
        // 根据 id 查询商品数据
        $deal = model('Deal')->get($id);

        if (!$deal || $deal->status !== 1) {
            $this->error('该商品不存在');
        }

        $title = $deal->name;
        // 获取分类信息
        $category = model('Category')->get($deal->category_id);
        // 获取分店信息
        $locations = model('BisLocation')->getNormalLocationsInId($deal->location_ids);
        // 优惠剩余数量
        $overPlus = $deal->total_count - $deal->buy_count;
        // 开团剩余时间
        $flag = 0;

        if ($deal->start_time > time()) {
            $flag = 1;
            $dTime = $deal->start_time - time();
            $timeData = '';
            $day = floor($dTime / (3600 * 24));

            if ($day) {
                $timeData .= $day . '天 ';
            }

            $hour = floor($dTime % (3600 * 24) / 3600);

            if ($hour) {
                $timeData .= $hour . '小时 ';
            }

            $minute = floor($dTime % (3600 * 24) % 3600 / 60);

            if ($minute) {
                $timeData .= $minute . '分钟 ';
            }
        }
        // 经纬度
        $mapStr = $locations[0]['xpoint'] . ',' . $locations[0]['ypoint'];
//        print_r($deal);exit;
        // 商户信息
        $bis = model('Bis')->get($deal->bis_id);

        return $this->fetch('', compact('title', 'deal', 'category', 'locations', 'overPlus', 'flag', 'timeData', 'mapStr', 'bis'));
    }
}