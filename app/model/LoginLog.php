<?php

namespace app\model;

use think\facade\Log;
use think\facade\Request;
use think\Model;

class LoginLog extends Model
{

    /**
     * 写登录日志
     * @param $user
     * @param $status
     */
    public function writeLoginLog($user, $status)
    {
        try {
            $this->insert([
                'login_user' => $user,
                'login_ip' => request()->ip(),
                'login_area' => getLocationByIp(request()->ip()),
                'login_user_agent' => Request::header('user-agent'),
                'login_time' => date('Y-m-d H:i:s'),
                'login_status' => $status
            ]);
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }

    /**
     * 登录日志明细
     * @param $limit
     * @return array
     */
    public function loginLogList($limit)
    {
        try {
            $log = $this->order('log_id', 'desc')->paginate($limit);
        } catch (\Exception $e) {
            Log::error($e->getMessage());
            return ['code' => -1, 'data' => '', 'msg' => $e->getMessage()];
        }
        return ['code' => 0, 'data' => $log, 'msg' => 'ok'];
    }

}