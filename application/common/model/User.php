<?php

namespace app\common\model;

class User extends BaseModel
{
    public function add($data = [])
    {
        // 验证提交的数据是不是数组
        if (!is_array($data)) {
            exception('传递的数据不是数组');
        }

        $username = $this->getUserByUsername($data['username']);

        if (!empty($username)) {
            exception('用户名已被注册');
        }

        $email = $this->where(['email' => $data['email']])->find();

        if (!empty($email)) {
            exception('邮箱已被注册');
        }

        $data['status'] = 1;

        return $this->allowField(true)->save($data);
    }

    /**
     * 根据用户名获取用户信息
     * @param $username
     */
    public function getUserByUsername($username)
    {
        if (!$username) {
            exception('用户名不合法');
        }

        $data = ['username' => $username];

        return $this->where($data)->find();
    }
}