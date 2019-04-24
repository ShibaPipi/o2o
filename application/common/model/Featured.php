<?php

namespace app\common\model;

class Featured extends BaseModel
{
    public function getFeaturedByType($type = 0)
    {
        $data = [
            'type' => $type,
            'status' => ['neq', -1],
        ];
        $order = [
            'id' => 'desc',
        ];
        $result = $this->where($data)->order($order)->paginate();
        return $result;
    }
}