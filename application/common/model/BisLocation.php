<?php

namespace app\common\model;

class BisLocation extends BaseModel
{
    public function getNormalLocationByBisId($bisId)
    {
        $data = [
            'bis_id' => $bisId,
            'status' => 1,
        ];
        $result = $this->where($data)->order('id', 'desc')->select();
        return $result;
    }
}