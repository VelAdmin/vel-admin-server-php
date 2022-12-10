<?php

namespace app\validate;

use think\Validate;

class AdminValidate extends Validate
{
    protected $rule =   [
        'admin_name'  => 'require',
        'admin_password'   => 'require',
        'role_id' => 'require',
        'status' => 'require'
    ];

    protected $message  =   [
        'admin_name.require' => '管理员名称不能为空',
        'admin_password.require'   => '管理员密码不能为空',
        'role_id.require'   => '所属角色不能为空',
        'status.require'   => '状态不能为空'
    ];

    protected $scene = [
        'edit'  =>  ['admin_name', 'role_id', 'status']
    ];
}