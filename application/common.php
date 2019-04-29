<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

function status($status)
{
    if ($status === 1) {
        $str = "<span class='label label-success radius'>正常</span>";
    } elseif ($status === 0) {
        $str = "<span class='label label-danger radius'>待审</span>";
    } else {
        $str = "<span class='label label-danger radius'>删除</span>";
    }

    return $str;
}

/**
 * @param $url
 * @param int $type 0 get, 1 post
 * @param array $data
 */
function doCurl($url, $type = 0, $data = [])
{
    // 初始化
    $ch = curl_init();
    // 设置选项
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_HEADER, 0);

    if ($type === 1) {
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    }

    // 执行并获取内容
    $output = curl_exec($ch);
    // 释放 curl 句柄
    curl_close($ch);

    return $output;
}

// 商户入驻申请文案
function bisRegister($status)
{
    switch ($status) {
        case 1:
            $str = '入驻申请成功！';
            break;
        case 0:
            $str = '待审核，成功后会发送邮件通知！';
            break;
        case 2:
            $str = '抱歉，您提交的材料不符合条件！';
            break;
        default:
            $str = '该申请已被删除！';
            break;
    }
    return $str;
}

/**
 * 分页通用样式
 * @param $obj
 */
function pagination($obj)
{
    if (!$obj) return '';
    // 优化方案：将 url 的参数加入但分页跳转链接中
    $params = request()->param();

    return '<div class="cl pd-5 bg-1 bk-gray mt-20 tp5-o2o">' . $obj->appends($params)->render() . '</div>';
}

function getSeCityName($path)
{
    if (empty($path)) return '';
    if (preg_match('/,/', $path)) {
        $cityPath = explode(',', $path);
        $cityId = $cityPath[1];
    } else $cityId = $path;
    $city = model('City')->get($cityId);
    return $city->name;
}

function countLocation($ids)
{
    if (preg_match('/,/', $ids)) {
        $arr = explode(',', $ids);

        return count($arr);
    }

    return 1;
}

// 设置订单号
function setOrderSn()
{
    list($t1, $t2) = explode(' ', microtime());
    $t3 = explode('.', $t1 * 10000);

    return $t2 . $t3[0] . rand(10000, 99999);
}