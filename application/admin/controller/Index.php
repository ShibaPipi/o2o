<?php

namespace app\admin\controller;

use think\Controller;

class Index extends Controller
{
    public function index()
    {
        return $this->fetch();
    }

    public function map()
    {
        return \Map::staticImage('北京市海淀区上地十街10号');
    }

    public function welcome()
    {
        \phpmailer\Email::send('patricksun1993@outlook.com', 'tp5-mail', 'success');
        return 'success';
//        \Map::getLngLat('北京市海淀区上地十街10号');
    }
}