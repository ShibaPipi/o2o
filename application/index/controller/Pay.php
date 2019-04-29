<?php

namespace app\index\controller;

use wxpay\database\WxPayUnifiedOrder;
use wxpay\NativePay;

class Pay extends BaseController
{
    public function index()
    {
        $user = $this->getLoginUser();

        if (!$user) {
            $this->error('请登录', 'user/login');
        }

        $orderId = input('get.id', 0, 'intval');

        if (empty($orderId)) {
            $this->error('请求不合法');
        }

        $order = model('Order')->get($orderId);

        if (empty($order) || $order->status !== 1 || $order->pay_status !== 0) {
            $this->error('无法进行该项操作');
        }
        // 严格判断订单是否为本人创建
        if ($order->username !== $user->username) {
            $this->error('不是本人下单');
        }

        $deal = model('Deal')->get($order->deal_id);
        // 生成二维码
        $input = new WxPayUnifiedOrder();
        $input->setBody($deal->name);
        $input->setAttach($deal->name);
        $input->setOutTradeNo($order->out_trade_no);
        $input->setTotalFee($order->total_price * 100);
        $input->setTimeStart(date("YmdHis"));
        $input->setTimeExpire(date("YmdHis", time() + 600));
        $input->setGoodsTag("QRCODE");
        $input->setNotifyUrl("index.php/index/wxpay/notify");
        $input->setTradeType("NATIVE");
        $input->setProductId($order->deal_id);

        $notify = new NativePay();
        $result = $notify->GetPayUrl($input);
        $url = empty($result["code_url"]) ? '' : $result["code_url"];

        return $this->fetch('', compact('deal', 'order', 'url'));
    }

    public function paySuccess()
    {
        if (!$this->getLoginUser()) {
            $this->error('请登录');
        }

        return $this->fetch();
    }
}