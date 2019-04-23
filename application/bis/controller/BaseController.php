<?php

namespace app\bis\controller;

use think\Controller;

class BaseController extends Controller
{
    public $account;

    protected function _initialize()
    {
        // 判断用户是否登录
        $isLogin = $this->isLogin();
        if (!$isLogin) return $this->redirect(url('login/index'));
    }

    /**
     * 判断是否登录
     */
    public function isLogin()
    {
        // 获取 session 值
        $user = $this->getLoginUser();
        return $user && $user->id;
    }

    /**
     * 获取登录用户
     */
    public function getLoginUser()
    {
        return $this->account ? $this->account : session('bisAccount', '', 'bis');
    }
}