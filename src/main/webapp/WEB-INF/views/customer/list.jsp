<%--
  Created by IntelliJ IDEA.
  User: FENG
  Date: 2019/1/4
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../css/font.css" />
    <link rel="stylesheet" href="../css/xadmin.css" />
    <script type="text/javascript" src="../js/jquery_3.3.1_jquery.min.js"></script>
    <script type="text/javascript" src="../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>
    <script type="text/javascript" src="../js/xcity.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="layui-anim layui-anim-up">
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">用户管理</a>
        <a><cite>用户列表</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i>
    </a>
</div>
<div class="x-body">
    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加用户','add',450,600)"><i class="layui-icon"></i>添加</button>
        <%--<span class="x-right" style="line-height:40px">共有数据：88 条</span>--%>
    </xblock>
    <table class="lay-hide" lay-filter="customer" id="customerTable"></table>
</div>

<script id="toolbar" type="text/html">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="resetPW">重置密码</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script type="text/html" id="statusTpl">
    {{#  if(d.status == 1){ }}
    <input type="checkbox" lay-skin="switch" lay-text="启用|禁用" checked disabled/>
    {{#  } else { }}
    <input type="checkbox" lay-skin="switch" lay-text="启用|禁用" disabled/>
    {{#  } }}
</script>

<script>
    //表格开始
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#customerTable',
            url: 'getCustomersForPage',
            method: 'post',
            page: true,
            response: {
                statusName: 'code',
                statusCode: 200,
                msgName: 'msg',
                countName: 'count',
                dataName: 'data'
            },
            cols: [[
                {type: 'checkbox'},
                {field: 'cid', sort: true, align: 'center', title: '用户ID'},
                {field: 'cname', align: 'center', title: '用户昵称'},
                {field: 'realname', align: 'center', title: '真实姓名'},
                {field: 'tel', align: 'center', title: '手机号码'},
                {field: 'email', align: 'center', title: '邮箱地址'},
                {field: 'address', align: 'center', title: '用户地址'},
                {field: 'status', align: 'center', title: '用户状态', templet: '#statusTpl'},
                {width: 185, align: 'center', toolbar: '#toolbar'}
            ]]
        });
        //监听表格复选框选择
        table.on('checkbox(customer)', function (obj) {
            console.log(obj);
        });
        //监听工具条
        table.on('tool(customer)', function (obj) {
            var data = obj.data;
            var address = data.address.split('@');
            if (obj.event === 'detail') {
                layer.msg('ID：' + data.cid + ' 的查看操作');
            } else if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        type: 'post',
                        url: 'deleteCustomer',
                        data: {
                            'cid': data.cid
                        },
                        dataType: 'json',
                        success: function (result) {
                            if (result.code === 200) {
                                layer.alert('删除成功', {icon: 6}, function () {
                                    //关闭当前frame
                                    table.reload('customerTable');
                                    layer.closeAll();
                                });
                            } else {
                                layer.alert('删除失败', {icon: 5}, function () {
                                    layer.closeAll();
                                });
                            }
                        }
                    });
                });
            } else if (obj.event === 'edit') {
                layer.open({
                    type: 1,
                    title: data.cid,
                    area: '400px',
                    id: 'editCustomer',
                    resize: false,
                    moveType: 1,
                    content: ''
                        + '<form id="updateForm" class="layui-form layui-form-pane" style="margin:30px;">'
                        + '<div class="layui-form-item"><label class="layui-form-label">昵称</label><div class="layui-input-block">'
                        + '<input type="text" name="cname" value="' + data.cname + '" required="" lay-verify="nikename" autocomplete="off" class="layui-input"></div></div>'
                        + '<div class="layui-form-item"><label class="layui-form-label">邮箱</label><div class="layui-input-block">'
                        + '<input type="text" name="email" value="' + data.email + '" required="" lay-verify="email" autocomplete="off" class="layui-input"></div></div>'
                        + '<div class="layui-form-item"><label class="layui-form-label">手机号码</label><div class="layui-input-block">'
                        + '<input type="text" name="tel" value="' + data.tel + '" required="" lay-verify="phone" autocomplete="off" class="layui-input"></div></div>'
                        + '<div class="layui-form-item"><label class="layui-form-label">真实姓名</label><div class="layui-input-block">'
                        + '<input type="text" name="realname" value="' + data.realname + '" required="" lay-verify="realname" autocomplete="off" class="layui-input"></div></div>'
                        + '<div class="layui-form-item" id="x-city"><label class="layui-form-label" style="height: 114px;line-height: 100px">收货地址</label><div class="layui-input-block">'
                        + '<select name="province" lay-filter="province"><option value="">请选择省</option></select>'
                        + '<select name="city" lay-filter="city"><option value="">请选择市</option></select>'
                        + '<select name="area" lay-filter="area"><option value="">请选择县/区</option></select></div></div>'
                        + '<div class="layui-form-item layui-form-text"><label class="layui-form-label">详细地址</label><div class="layui-input-block">'
                        + '<textarea id="addressDetail" class="layui-input" name="addressDetail" type="layui-textarea" placeholder="请输入详细地址" autocomplete="off" style="height:100px"></textarea></div></div>'
                        + '<div class="layui-form-item" pane=""><label class="layui-form-label">状态</label><div class="layui-input-block">'
                        + '<input type="checkbox" id="status" lay-skin="switch" lay-text="启用|禁用" ' + (data.status === '1' ? 'checked' : '') + '/></div></div>'
                        + '<div class="layui-form-item"><label class="layui-form-label" style="background-color:#FFFFFF;border:none;"></label>'
                        + '<button  class="layui-btn" lay-filter="update" lay-submit="">修改</button></div>'
                        + '</form>',
                    success: function () {
                        layui.use('form', function () {
                            var form = layui.form;
                            //重新渲染表格
                            form.render();
                            //设置地址默认值
                            $('#x-city').xcity(address[0], address[1], address[2], form);
                            $('#addressDetail').text(address[3]);
                            //自定义验证规则
                            form.verify({
                                nikename: function (value) {
                                    if (value.length < 3) {
                                        return '昵称至少得3个字符啊';
                                    }
                                }
                            });
                            //监听提交
                            form.on('submit(update)', function (updateData) {
                                var postData = updateData.field;
                                var status = $('#status')[0].checked === true ? 1 : 0;
                                postData.cid = data.cid;
                                postData.address = postData.province+'@'+postData.city+'@'+postData.area+'@'+postData.addressDetail;
                                postData.status = status;
                                console.log(postData);
                                //发异步，把数据提交给php
                                $.ajax({
                                    type: 'post',
                                    url: 'updateCustomer',
                                    data: JSON.stringify(postData),
                                    dataType: 'json',
                                    contentType: 'application/json; charset=utf-8',
                                    success: function (result) {
                                        console.log(result);
                                        if (result.code === 200) {
                                            layer.alert('修改成功', {icon: 6}, function () {
                                                table.reload('customerTable');
                                                layer.closeAll();
                                            });
                                        } else {
                                            layer.alert('修改失败', {icon: 5}, function () {
                                            });
                                        }
                                    }
                                });
                                return false;
                            });
                        });
                    }
                });
            } else if (obj.event === 'resetPW') {
                layer.open({
                    type: 1,
                    title: data.cid,
                    area: '400px',
                    id: 'resetPassword',
                    resize: false,
                    moveType: 1,
                    content: ''
                        + '<form id="resetPassForm" class="layui-form layui-form-pane" style="margin:30px;">'
                        + '<div class="layui-form-item"><label class="layui-form-label">昵称</label><div class="layui-input-block">'
                        + '<input type="text" id="cname" name="cname" disabled="" value="' + data.cname + '" class="layui-input"></div></div>'
                        + '<div class="layui-form-item"><label class="layui-form-label"><span class="x-red">*</span>旧密码</label><div class="layui-input-block">'
                        + '<input type="password" id="old_pass" name="old_pass" required="" lay-verify="required" autocomplete="off" class="layui-input"></div></div>'
                        + '<div class="layui-form-item"><label class="layui-form-label"><span class="x-red">*</span>新密码</label><div class="layui-input-block">'
                        + '<input type="password" id="new_pass" name="new_pass" required="" lay-verify="pass" autocomplete="off" class="layui-input"></div>'
                        + '<div class="layui-form-mid layui-word-aux">6到16个字符</div></div>'
                        + '<div class="layui-form-item"><label class="layui-form-label"><span class="x-red">*</span>确认密码</label><div class="layui-input-block">'
                        + '<input type="password" id="check_pass" required="" lay-verify="repass" autocomplete="off" class="layui-input"></div></div>'
                        + '<div class="layui-form-item"><label class="layui-form-label" style="background-color:#FFFFFF;border:none;"></label>'
                        + '<button  class="layui-btn" lay-filter="reset" lay-submit="">重置密码</button></div>'
                        + '</form>',
                    success: function () {
                        layui.use('form', function () {
                            var form = layui.form;
                            //自定义验证规则
                            form.verify({
                                pass: [/(.+){6,12}$/, '密码必须6到12位'],
                                repass: function () {
                                    if ($('#new_pass').val() !== $('#check_pass').val()) {
                                        return '两次密码不一致';
                                    }
                                }
                            });
                            //重新渲染表格
                            form.render();
                            //监听提交
                            form.on('submit(reset)', function (passData) {
                                //发异步，把数据提交给后端
                                $.ajax({
                                    type: 'post',
                                    url: 'resetPassword',
                                    data: {
                                        'cid': data.cid,
                                        'oldPass': passData.field.old_pass,
                                        'newPass': passData.field.new_pass
                                    },
                                    dataType: 'json',
                                    success: function (result) {
                                        console.log(result);
                                        if (result.code === 200) {
                                            layer.alert(result.msg, {icon: 6}, function () {
                                                layer.closeAll();
                                            });
                                        } else {
                                            layer.alert(result.msg, {icon: 5}, function () {
                                            });
                                        }
                                    }
                                });
                                return false;
                            });
                        });
                    }
                });
            }
        });
    });
    //删除全部
    function delAll(argument) {
        var data = tableCheck.getData();
        layer.confirm('确认要删除吗？' + data, function (index) {
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>
</body>
</html>
