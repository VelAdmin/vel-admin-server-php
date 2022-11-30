<?php

namespace app\controller;

use app\BaseController;
use think\App;
use think\facade\View;
use app\service\Auth;
use app\model\Admin as AdminModel;

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

    // 修改密码
    public function editPwd()
    {
        if (request()->isPost()) {

            $param = input('post.');

            if ($param['new_password'] != $param['rep_password']) {
                return json(['code' => -1, 'data' => '', 'msg' => '两次密码输入不一致']);
            }

            // 检测旧密码
            $admin = new AdminModel();
            $adminInfo = $admin->getAdminInfo(session('admin_user_id'));

            if(0 != $adminInfo['code'] || empty($adminInfo['data'])){
                return json(['code' => -2, 'data' => '', 'msg' => '管理员不存在']);
            }

            if(!checkPassword($param['password'], $adminInfo['data']['admin_password'])){
                return json(['code' => -3, 'data' => '', 'msg' => '旧密码错误']);
            }

            $admin->updateAdminInfoById(session('admin_user_id'), [
                'admin_password' => makePassword($param['new_password'])
            ]);

            return json(['code' => 0, 'data' => '', 'msg' => '修改密码成功']);
        }

        return View::fetch('pwd');
    }
}