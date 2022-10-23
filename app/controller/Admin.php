<?php

namespace app\controller;

use app\BaseController;
use think\App;
use think\facade\View;
use app\service\Auth;

class Admin extends BaseController
{
    public function index()
    {
        $authModel = new Auth();
        $menu = $authModel->getAuthMenu(session('admin_role_id'));

        View::assign([
            'menu' => $menu
        ]);
        return View::fetch('index');
    }


    public function home()
    {
        View::assign([
            'tp_version' => App::VERSION
        ]);

        return View::fetch('home');
    }
}