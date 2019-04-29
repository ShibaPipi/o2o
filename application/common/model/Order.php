<?php

namespace app\common\model;

class Order extends BaseModel
{
    protected $autoWriteTimestamp = true;

    public function add($data)
    {
        $data['status'] = 1;
//        $data['create_time'] = time();
        $this->save($data);

        return $this->id;
    }

    public function updateByOutTradeNo($outTradeNo, $wxData)
    {
        if (!empty($wxData['transaction_id'])) {
            $data['transaction_id'] = $wxData['transaction_id'];
        }

        if (!empty($wxData['total_fee'])) {
            $data['pay_amount'] = $wxData['total_fee'] / 100;
            $data['pay_status'] = 1;
        }

        if (!empty($wxData['time_end'])) {
            $data['pay_time'] = $wxData['time_end'];
        }

        return $this->allowField(true)->save($data, ['out_reade_no' => $outTradeNo]);
    }
}