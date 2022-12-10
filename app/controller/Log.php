<?php

namespace app\controller;

use app\BaseController;
use app\model\OperateLog;
use app\model\LoginLog;
use think\facade\View;

class Log extends BaseController
{
    // 登录日志
    public function login()
    {
        if (request()->isAjax()) {
            $limit = input('param.limit');
            $log = new LoginLog();
            $list = $log->loginLogList($limit);
            if ($list['code'] == 0) {
                return json(['code' => 0, 'msg' => 'ok', 'count' => $list['data']->total(), 'data' => $list['data']->all()]);
            }
            return json(['code' => 0, 'msg' => 'ok', 'count' => 0, 'data' => []]);
        }
        return View::fetch();
    }

    // 操作日志
    public function operate()
    {
        if (request()->isAjax()) {
            $limit = input('param.limit');
            $operateTime = input('param.operate_time');
            $where = [];
            if (!empty($operateTime)) {
                $where[] = ['operate_time', 'between', [$operateTime, $operateTime . ' 23:59:59']];
            }
            $operateModel = new OperateLog();
            $list = $operateModel->getOperateLogList($limit, $where);
            if (0 == $list['code']) {
                return json(['code' => 0, 'msg' => 'ok', 'count' => $list['data']->total(), 'data' => $list['data']->all()]);
            }
            return json(['code' => 0, 'msg' => 'ok', 'count' => 0, 'data' => []]);
        }
        return View::fetch();
    }
}