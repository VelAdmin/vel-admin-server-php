<?php

namespace app\validate;

use think\Validate;

class NodeValidate extends Validate
{
    protected $rule =   [
        'node_name'  => 'require',
        'node_path'   => 'require'
    ];

    protected $message  =   [
        'node_name.require' => '节点名称不能为空',
        'node_path.require'   => '节点路径不能为空'
    ];
}