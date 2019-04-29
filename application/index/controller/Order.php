<?php

namespace app\index\controller;

class Order extends BaseController
{
    public function index()
    {
//        dump(input('get.'));
        $user = $this->getLoginUser();

        if (!$user) {
            $this->error('请登录', 'user/login');
        }

        $id = input('get.id', 0, 'intval');

        if (!$id) {
            $this->error('参数不合法');
        }

        $dealCount = input('get.count', 1, 'intval');
        $totalPrice = input('get.total_price', 1);
        $deal = model('Deal')->find($id);

        if (!$deal || $deal->status !== 1) {
            $this->error('商品不存在');
        }

        if (empty($_SERVER['HTTP_REFERER'])) {
            $this->error('请求不合法');
        }
        // 数据入库
        $orderNo = setOrderSn();
        $data = [
            'out_trade_no' => $orderNo,
            'user_id' => $user->id,
            'username' => $user->username,
            'deal_id' => $id,
            'deal_count' => $dealCount,
            'total_price' => $totalPrice,
            'referer' => $_SERVER['HTTP_REFERER'],
        ];

        try {
            $orderId = model('Order')->add($data);
        } catch (\Exception $e) {
            $this->error('订单处理失败');
//            $this->error($e->getMessage());
        }

        $this->redirect(url('pay/index', ['id' => $orderId]));
    }

    public function confirm()
    {
        $controller = 'pay';

        if (!$this->getLoginUser()) {
            $this->error('请登录', 'user/login');
        }
        //
        $id = input('get.id', 0, 'intval');

        if (!$id) {
            $this->error('参数不合法');
        }

        $count = input('get.count', 1, 'intval');
        $deal = model('Deal')->find($id);

        if (!$deal || $deal->status !== 1) {
            $this->error('商品不存在');
        }

        $deal = $deal->toArray();
//dump($deal);exit;
        return $this->fetch('', compact('controller', 'count', 'deal'));
    }
}