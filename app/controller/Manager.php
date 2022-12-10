<?php

namespace app\controller;

use app\BaseController;
use app\service\Log;
use app\validate\AdminValidate;
use think\Facade\View;
use app\model\Admin;
use app\model\Role;

class Manager extends BaseController
{
    // 管理员列表
    public function index()
    {
        if (request()->isAjax()) {
            $limit = input('param.limit');
            $adminName = input('param.admin_name');
            $where = [];
            if (!empty($adminName)) {
                $where[] = ['admin_name', 'like', '%' . $adminName . '%'];
            }
            $admin = new Admin();
            $list = $admin->getAdmins($limit, $where);

            if ($list['code'] == 0) {
                return json(['code' => 0, 'msg' => 'ok', 'count' => $list['data']->total(), 'data' => $list['data']->all()]);
            }
            return json(['code' => 0, 'msg' => 'ok', 'count' => 0, 'data' => []]);
        }
        return View::fetch();
    }

    // 添加管理员
    public function addAdmin()
    {
        if(request()->isPost()) {
            $param = input('post.');
            $validate = new AdminValidate();
            if(!$validate->check($param)) {
                return ['code' => -1, 'data' => '', 'msg' => $validate->getError()];
            }
            $param['admin_password'] = makePassword($param['admin_password']);
            $admin = new admin();
            $res = $admin->addAdmin($param);
            Log::write("添加管理员：" . $param['admin_name']);
            return json($res);
        }
        View::assign([
            'roles' => (new Role())->getAllRoles()['data']
        ]);
        return View::fetch('add');
    }

    // 编辑管理员
    public function editAdmin()
    {
        if(request()->isPost()) {
            $param = input('post.');
            $validate = new AdminValidate();
            if(!$validate->scene('edit')->check($param)) {
                return ['code' => -1, 'data' => '', 'msg' => $validate->getError()];
            }
            if(isset($param['admin_password'])) {
                $param['admin_password'] = makePassword($param['admin_password']);
            }
            $admin = new admin();
            $res = $admin->editAdmin($param);
            Log::write("编辑管理员：" . $param['admin_name']);
            return json($res);
        }

        $adminId = input('param.admin_id');
        $admin = new admin();
        View::assign([
            'admin' => $admin->getAdminById($adminId)['data'],
            'roles' => (new Role())->getAllRoles()['data']
        ]);
        return View::fetch('edit');
    }

    /**
     * 删除管理员
     * @return \think\response\Json
     */
    public function delAdmin()
    {
        if(request()->isAjax()) {
            $adminId = input('param.id');
            $admin = new admin();
            $res = $admin->delAdmin($adminId);
            Log::write("删除管理员：" . $adminId);
            return json($res);
        }
    }
}