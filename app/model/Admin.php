<?php

namespace app\model;

use think\Model;

class Admin extends Model
{
    /**
     * 获取管理员信息
     * @param $name
     * @return array
     */
    public function getAdminByName($name)
    {
        try {
            $info = $this->where('admin_name', $name)->findOrEmpty()->toArray();
        } catch (\Exception $e) {
            return modelReMsg(-1, '', $e->getMessage());
        }
        return modelReMsg(0, $info, 'ok');
    }

    /**
     * 更新登录时间
     * @param $id
     * @param $param
     */
    public function updateAdminInfoById($id, $param)
    {
        try {
            $this->where('admin_id', $id)->update($param);
        } catch (\Exception $e) {}
    }

    /**
     * 获取管理员信息
     * @param $id
     * @return array
     */
    public function getAdminInfo($id)
    {
        try {

            $info = $this->where('admin_id', $id)->findOrEmpty()->toArray();
        } catch (\Exception $e) {

            return modelReMsg(-1, '', $e->getMessage());
        }

        return modelReMsg(0, $info, 'ok');
    }

}