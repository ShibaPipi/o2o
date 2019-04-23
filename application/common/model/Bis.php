<?php

namespace app\common\model;

class Bis extends BaseModel
{
    /**
     * 通过状态获取商家数据
     * @param $status
     */
    public function getBisByStatus($status = 0)
    {
        $order = [
            'id' => 'desc',
        ];

        $data = [
            'status' => $status,
        ];

        return $this->where($data)->order($order)->paginate();
    }
}