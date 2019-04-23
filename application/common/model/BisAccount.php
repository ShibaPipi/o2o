<?php

namespace app\common\model;

class BisAccount extends BaseModel
{
    public function updateById($data, $id)
    {
        // allowField 过滤数组 $data 非数据表中的数据
        return $this->allowField(true)->save($data, ['id' => $id]);
    }
}