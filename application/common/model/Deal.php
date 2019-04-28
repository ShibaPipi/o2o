<?php

namespace app\common\model;

class Deal extends BaseModel
{
    public function getNormalDeals($data = [])
    {
        $data['status'] = 1;
        $order = ['id' => 'desc'];
        $result = $this->where($data)->order($order)->paginate();
//        echo $this->getLastSql();
//        exit;
        return $result;
    }

    /**
     * @param $id 分类 id
     * @param $cityId 城市 id
     * @param int $limit 显示条数
     */
    public function getNormalDealByCatCityId($id, $cityId, $limit = 10)
    {
        $data = [
            'end_time' => ['gt', time()],
            'category_id' => $id,
            'city_id' => $cityId,
            'status' => 1,
        ];

        $order = [
            'list_order' => 'desc',
            'id' => 'desc',
        ];

        $result = $this->where($data)->order($order);

        if ($limit) {
            $result = $result->limit($limit);
        }
//        print_r($result->select());exit;
//        print_r($this->getLastSql());exit;
        return $result->select();
    }

    public function getDealByConditions($data = [], $orders = [])
    {
        if (!empty($order['order_sales'])) {
            $order['buy_count'] = 'desc';
        }
        if (!empty($order['order_price'])) {
            $order['current_price'] = 'desc';
        }
        if (!empty($order['order_time'])) {
            $order['create_time'] = 'desc';
        }
        // mysql find_in_set()
        $order['id'] = 'desc';
        $datas[] = 'end_time > ' . time();

        if (!empty($data['se_category_id'])) {
            $datas[] = ' find_in_set(' . $data['se_category_id'] . ', se_category_id)';
        }

        if (!empty($data['category_id'])) {
            $datas[] = ' category_id = ' . $data['category_id'];
        }

        if (!empty($data['city_id'])) {
            $datas[] = ' city_id = ' . $data['city_id'];
        }

        $datas[] = 'status = 1';

        $res = $this->where(implode(' AND ', $datas))->order($order)->paginate();
//echo $this->getLastSql();exit;
        return $res;
    }
}