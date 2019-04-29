<?php

namespace app\index\controller;

use think\Controller;
use wxpay\database\WxPayResults;
use wxpay\database\WxPayUnifiedOrder;
use wxpay\NativePay;
use wxpay\WxPayConfig;

class Wxpay extends Controller
{
    public function notify()
    {
        $wxData = file_get_contents('php://input');
        file_put_contents('/tmp/2.txt', $wxData, FILE_APPEND);

        try {
            $result = new WxPayResults();
            $result->Init($wxData);
        } catch (\Exception $e) {
            $result->setData('return_code', 'FAIL');
            $result->setData('return_msg', $e->getMessage());
            return $result->toXml();
        }

        if ($wxData['return_code'] === 'FAIL' || $wxData['result_code'] !== 'SUCCESS') {
            $result->setData('return_code', 'FAIL');
            $result->setData('return_msg', 'error');
            return $result->toXml();
        }
        // 查询订单数据
        $outTradeNo = $wxData['out_trade_no'];
        $order = model('Order')->get(['out_trade_no' => $outTradeNo]);

        if (!$order || $order->pay_status === 1) {
            $result->setData('return_code', 'SUCCESS');
            $result->setData('return_msg', 'OK');
            return $result->toXml();
        }
        // 更新订单表、商品表数据
        try {
            $orderRes = model('Order')->updateByOutTradeNo($outTradeNo, $wxData);
            model('Deal')->updateBuyCountById($order->deal_id, $order->deal_count);
            // 消费券生成
            $coupons = [
                'sn' => $outTradeNo,
                'password' => rand(10000, 99999),
                'user_id' => $order->user_id,
                'deal_id' => $order->deal_id,
                'order_id' => $order->id,
            ];
            model('Coupons')->add($coupons);
            // 发送邮件

        } catch (\Exception $e) {
            // 数据更新失败，通知微信继续进行回调
            return false;
        }

        $result->setData('return_code', 'SUCCESS');
        $result->setData('return_msg', 'OK');
        return $result->toXml();
    }

    public function wxpayQCode($id)
    {
        $input = new WxPayUnifiedOrder();
        $input->setBody("支付 0.01 元");
        $input->setAttach("支付 0.01 元");
        $input->setOutTradeNo(WxPayConfig::MCHID . date("YmdHis"));
        $input->setTotalFee("1");
        $input->setTimeStart(date("YmdHis"));
        $input->setTimeExpire(date("YmdHis", time() + 600));
        $input->setGoodsTag("QRCODE");
        $input->setNotifyUrl("index.php/index/wxpay/notify");
        $input->setTradeType("NATIVE");
        $input->setProductId($id);

        $notify = new NativePay();
        $result = $notify->GetPayUrl($input);
        $url2 = empty($result["code_url"]) ? '' : $result["code_url"];

        return '<img alt="扫码支付" src="/weixin/example/qrcode.php?data=' . urlencode($url2) . '" style="width:300px;height:300px;"/>
';
    }
}