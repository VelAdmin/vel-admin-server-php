<?php

namespace app\controller;

use app\BaseController;
use app\model\Node as NodeModel;
use app\validate\NodeValidate;
use app\service\Log;
use think\Facade\View;

class Node extends BaseController
{
    // 节点列表
    public function index()
    {
        $node = new NodeModel();
        $list = $node->getNodesList();

        View::assign([
            'tree' => makeTree($list['data'])
        ]);

        return View::fetch();
    }

    // 添加节点
    public function add()
    {
        if (request()->isAjax()) {
            $param = input('post.');
            $validate = new NodeValidate();
            if (!$validate->check($param)) {
                return ['code' => -1, 'data' => '', 'msg' => $validate->getError()];
            }
            $nodeModel = new NodeModel();
            $res = $nodeModel->addNode($param);
            Log::write("添加节点：" . $param['node_name']);
            return json($res);
        }

        View::assign([
            'pname' => input('param.pname'),
            'pid' => input('param.pid')
        ]);

        return View::fetch();
    }

    // 编辑节点
    public function edit()
    {
        if (request()->isAjax()) {
            $param = input('post.');
            $validate = new NodeValidate();
            if (!$validate->check($param)) {
                return ['code' => -1, 'data' => '', 'msg' => $validate->getError()];
            }
            $nodeModel = new NodeModel();
            $res = $nodeModel->editNode($param);
            Log::write("编辑节点：" . $param['node_name']);
            return json($res);
        }

        $id = input('param.id');
        $pid = input('param.pid');
        $nodeModel = new NodeModel();
        if (0 == $pid) {
            $pNode = '顶级节点';
        } else {
            $pNode = $nodeModel->getNodeInfoById($pid)['data']['node_name'];
        }
        View::assign([
            'node_info' => $nodeModel->getNodeInfoById($id)['data'],
            'p_node' => $pNode
        ]);

        return View::fetch();
    }

    // 删除节点
    public function delete()
    {
        if (request()->isAjax()) {
            $id = input('param.id');
            $nodeModel = new NodeModel();
            $res = $nodeModel->deleteNodeById($id);
            Log::write("删除节点：" . $id);
            return json($res);
        }
    }
}