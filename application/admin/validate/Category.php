<?php

namespace app\admin\validate;

use think\Validate;

class Category extends Validate
{
    protected $rule = [
        ['name', 'require|max:10', '分类名必须传递|分类名不能超过10个字符'],
        ['parent_id', 'require|number'],
        ['id', 'number'],
        ['status', 'number|in:-1,0,1', '状态必须是数字|状态范围不合法'],
        ['list_order', 'number'],
    ];

    /** 场景设置 **/
    protected $scene = [
        'add' => ['name', 'parent_id', 'id'],
        'list_order' => ['id', 'list_order'],
        'status' => ['id', 'status'],
    ];
}