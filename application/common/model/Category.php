<?php

namespace app\common\model;

use think\Model;

class Category extends Model
{
    protected $autoWriteTimestamp = true;

    public function add($data)
    {
        $data['status'] = 1;
//        $data['create_time'] = time();
        return $this->save($data);
    }

    public function getNormalFirstCategory()
    {
        $data = [
            'status' => 1,
            'parent_id' => 0
        ];

        $order = [
            'list_order' => 'desc',
            'id' => 'desc'
        ];

        return self::where($data)->order($order)->select();
    }

    public function getFirstCategory($parentId = 0)
    {
        $data = [
            'parent_id' => $parentId,
            'status' => ['neq', -1]
        ];

        $order = [
            'list_order' => 'desc',
            'id' => 'desc'
        ];

        $result = self::where($data)->order($order)->paginate();
//        echo $this->getLastSql();
        return $result;
    }

    public function getNormalCategoryByParentId($parentId = 0)
    {
        $data = [
            'status' => 1,
            'parent_id' => $parentId
        ];

        $order = [
            'id' => ''
        ];

        return self::where($data)->order($order)->select();
    }
}