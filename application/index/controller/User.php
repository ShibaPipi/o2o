<?php

namespace app\index\controller;

use think\Controller;

class User extends Controller
{
    public function login()
    {
        return $this->fetch();
    }

    public function register()
    {
        if (request()->isPost()) {
            $data = input('post.');

            if (!captcha_check($data['verifyCode'])) {
                // 校验失败
                $this->error('验证码不正确');
            }
        }
        return $this->fetch();
    }
}