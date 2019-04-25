<?php

namespace app\bis\controller;

use think\Controller;

class Register extends Controller
{
    public function index()
    {
        $cities = model('city')->getNormalCityByParentId();
        $category = model('Category')->getNormalCategoryByParentId();
        return $this->fetch('', compact('cities', 'category'));
    }

    public function add()
    {
        if (!request()->isPost()) $this->error('请求错误');
        $data = input('post.', [], 'htmlentities');
        // 检验数据
        $validate = validate('Bis');
        if (!$validate->scene('add')->check($data)) $this->error($validate->getError());
        // 获取经纬度
        $lngLat = \Map::getLngLat($data['address']);
        if (empty($lngLat) || $lngLat['status'] !== 0 || $lngLat['result']['precise'] !== 1) $this->error('无法获取数据或者匹配不精确！');
        // 判断提交的用户信息是否存在
        $accountInfo = model('BisAccount')->get(['username' => $data['username']]);
        if ($accountInfo) $this->error('该用户已经注册，请重新分配');
        // 商户基本信息入库
        $bisData = [
            'name' => $data['name'],
            'email' => $data['email'],
            'city_id' => $data['city_id'],
            'city_path' => empty($data['se_city_id']) ? $data['city_id'] : $data['city_id'] . ',' . $data['se_city_id'],
            'logo' => $data['logo'],
            'license_logo' => $data['license_logo'],
            'description' => empty($data['description']) ? '' : $data['description'],
            'bank_info' => $data['bank_info'],
            'bank_user' => $data['bank_user'],
            'bank_name' => $data['bank_name'],
            'faren' => $data['faren'],
            'faren_tel' => $data['faren_tel'],
        ];
        $bisId = model('Bis')->add($bisData);

        // 总店信息检验
        $data['cat'] = '';
        if (!empty($data['se_category_id'])) $data['cat'] = implode('|', $data['se_category_id']);
        // 总店信息入库
        $locationData = [
            'bis_id' => $bisId,
            'name' => $data['name'],
            'logo' => $data['logo'],
            'tel' => $data['tel'],
            'contact' => $data['contact'],
            'category_id' => $data['category_id'],
            'category_path' => $data['category_id'] . ',' . $data['cat'],
            'city_id' => $data['city_id'],
            'city_path' => empty($data['se_city_id']) ? $data['city_id'] : $data['city_id'] . ',' . $data['se_city_id'],
            'address' => $data['address'],
            'api_address' => $data['address'],
            'open_time' => $data['open_time'],
            'content' => empty($data['content']) ? '' : $data['content'],
            'is_main' => 1, // 代表总店信息
            'xpoint' => empty($lngLat['result']['location']['lng']) ? '' : $lngLat['result']['location']['lng'],
            'ypoint' => empty($lngLat['result']['location']['lat']) ? '' : $lngLat['result']['location']['lat'],
        ];
        $locationId = model('BisLocation')->add($locationData);

        // 自动生成密码校验字符串
        $data['code'] = mt_rand(100, 10000);
        // 账户基本信息入库
        $accountData = [
            'bis_id' => $bisId,
            'username' => $data['username'],
            'code' => $data['code'],
            'password' => md5($data['password'] . $data['code']),
            'is_main' => 1, // 代表总管理员
        ];
        $accountId = model('BisAccount')->add($accountData);
        if (!$accountId) $this->error('申请失败');
        // 发送邮件
        $url = request()->domain() . url('bis/register/waiting', ['id' => $bisId]);
        $title = 'o2o入驻申请通知';
        $content = "您提交的入驻申请需等待平台方审核，您可以通过点击链接<a href='{$url}' target='_blank'>查看链接</a>查看审核状态。";
        \phpmailer\Mail::send($data['email'], $title, $content);

        $this->success('申请成功', url('register/waiting', ['id' => $bisId]));
    }

    public function waiting($id)
    {
        if (empty($id)) $this->error('error');
        $detail = model('Bis')->get($id);
        return $this->fetch('', compact('detail'));
    }
}