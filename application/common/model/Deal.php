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
//        $result->select();
//        print_r($this->getLastSql());exit;
        return $result->select();
    }
}