<?php

namespace app\controller;

use app\model\Admin;
use app\model\LoginLog;
use app\BaseController;
use think\facade\View;

class Login extends BaseController
{

    /**
     * 登录页面
     * @return string
     */
    public function index()
    {
        return View::fetch('index');
    }

    /**
     * 登录接口
     * @return \think\response\Json|void
     */
    public function doLogin()
    {
        if (request()->isPost()) {
            $param = input('post.');
            if (!captcha_check($param['code'])) {
                return reMsg(-1, '', '验证码错误');
            }

            $log = new LoginLog();
            $admin = new Admin();
            $adminInfo = $admin->getAdminByName($param['username']);

            if (0 != $adminInfo['code'] || empty($adminInfo['data'])) {
                $log->writeLoginLog($param['username'], 2);
                return reMsg(-2, '', '用户名密码错误');
            }

            if (!checkPassword($param['password'], $adminInfo['data']['admin_password'])) {
                $log->writeLoginLog($param['username'], 2);
                return reMsg(-3, '', '用户名密码错误');
            }

            // 设置session标识状态
            session('admin_user_name', $adminInfo['data']['admin_name']);
            session('admin_user_id', $adminInfo['data']['admin_id']);
            session('admin_role_id', $adminInfo['data']['role_id']);

            // 维护上次登录时间
            $admin->updateAdminInfoById($adminInfo['data']['admin_id'], ['last_login_time' => date('Y-m-d H:i:s')]);

            $log->writeLoginLog($param['username'], 1);

            return reMsg(0, url('admin/index'), '登录成功');
        }

    }

    /**
     * 退出登录
     * @return \think\response\Json
     */
    public function loginOut()
    {
        session('admin_user_name', null);
        session('admin_user_id', null);
        return reMsg(0, url('login/index'), '登录成功');
    }
}