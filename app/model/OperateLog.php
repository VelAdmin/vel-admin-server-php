<?php

namespace app\model;

use think\Model;

class OperateLog extends Model
{
    /**
     * 写操作日志
     * @param $param
     * @return array
     */
    public function writeLog($param)
    {
        try {
            $this->insert($param);
        } catch (\Exception $e) {
            return modelReMsg(-1, '', $e->getMessage());
        }

        return modelReMsg(0, '', '写入成功');
    }

    /**
     * 获取角色列表
     * @param $limit
     * @param $where
     * @return array
     */
    public function getOperateLogList($limit, $where)
    {
        try {
            $res = $this->where($where)->order('log_id', 'desc')->paginate($limit);
        }catch (\Exception $e) {
            return modelReMsg(-1, '', $e->getMessage());
        }
        return modelReMsg(0, $res, 'ok');
    }
}