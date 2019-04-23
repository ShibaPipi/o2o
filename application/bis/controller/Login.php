<?php

namespace app\bis\controller;

use think\Controller;

class Login extends Controller
{
    public function index()
    {
        if (request()->isPost()) {
            // 登录逻辑
            $data = input('post.');

            // 通过用户名获取用户信息
            $ret = model('BisAccount')->get(['username' => $data['username']]);

            if (!$ret || $ret->status !== 1) {
                $this->error('该用户不存在或审核未通过');
            }
            // 验证密码
            if ($ret->password !== md5($data['password'] . $ret['code'])) {
                $this->error('密码不正确');
            }
            // 更新上次登录时间
            model('BisAccount')->updateById(['last_login_time' => time()], $ret->id);
            // 保存用户信息，第三个参数 'bis' 是作用域
            session('bisAccount', $ret, 'bis');
            return $this->success('登录成功', url('index/index'));
        } else {
            // 获取 session 值
            $account = session('bisAccount', '', 'bis');
            if ($account && $account->id) return $this->redirect(url('index/index'));
            return $this->fetch();
        }
    }

    public function logout()
    {
        // 清除 session
        session(null, 'bis');
        $this->redirect(url('login/index'));
    }
}