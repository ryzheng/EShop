<%--
  Created by IntelliJ IDEA.
  User: FENG
  Date: 2019/1/6
  Time: 18:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>E-Shop</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/xadmin.css">
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

<body>
<div class="x-body">
    <form class="layui-form layui-form-pane">
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>用户ID
            </label>
            <div class="layui-input-inline">
                <input type="text" id="cid" name="cid" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>用户昵称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="cname" name="cname" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>真实姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="realname" name="realname" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>手机号码
            </label>
            <div class="layui-input-inline">
                <input type="text" id="tel" name="tel" required="" lay-verify="required | phone"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>邮箱地址
            </label>
            <div class="layui-input-inline">
                <input type="text" id="email" name="email" required="" lay-verify="required | email"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>密码
            </label>
            <div class="layui-input-block">
                <input type="password" id="new_pass" name="cpass" required="" lay-verify="pass" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">6到16个字符</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>确认密码
            </label>
            <div class="layui-input-block">
                <input type="password" id="check_pass" required="" lay-verify="repass" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" id="x-city">
            <label class="layui-form-label" style="height: 114px;line-height: 100px">
                <span class="x-red">*</span>用户地址
            </label>
            <div class="layui-input-inline">
                <select name="province" lay-filter="province">
                    <option value="">请选择省</option>
                </select>
                <select name="city" lay-filter="city">
                    <option value="">请选择市</option>
                </select>
                <select name="area" lay-filter="area">
                    <option value="">请选择县/区</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label"><span class="x-red">*</span>详细地址</label>
            <div class="layui-input-block">
                <textarea id="addressDetail" class="layui-input" name="addressDetail" type="layui-textarea" required=""
                          lay-verify="required" placeholder="请输入详细地址" autocomplete="off" style="height:100px"></textarea>
            </div>
        </div>
        <div class="layui-form-item" pane="">
            <label class="layui-form-label">
                <span class="x-red">*</span>状态
            </label>
            <div class="layui-input-inline">
                <input type='checkbox' name='status' lay-skin='switch' lay-text='启用|禁用' value="1"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="background-color:#FFFFFF;border:none;">
            </label>
            <button  class="layui-btn" lay-filter="add" lay-submit="">增加</button>
        </div>
    </form>
</div>
<script>
    layui.use(['form', 'layer'], function () {
        $ = layui.jquery;
        var form = layui.form, layer = layui.layer;
        //初始化城市选择列表
        $('#x-city').xcity('', '', '', form);
        //自定义验证规则
        form.verify({
            pass: [/(.+){6,12}$/, '密码必须6到12位'],
            repass: function () {
                if ($('#new_pass').val() !== $('#check_pass').val()) {
                    return '两次密码不一致';
                }
            }
        });
        //监听提交
        form.on('submit(add)', function (data) {
            var postData = data.field;
            postData.address = postData.province + '@' + postData.city + '@' + postData.area + '@' + postData.addressDetail;
            console.log(postData);
            //发异步，把数据提交给后端
            $.ajax({
                type: 'post',
                url: 'addCustomer',
                data: JSON.stringify(data.field),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (result) {
                    console.log(result);
                    if (result.code === 200) {
                        layer.alert('增加成功', {icon: 6}, function () {
                            parent.location.reload();
                        });
                    } else {
                        layer.alert('增加失败', {icon: 5}, function () {
                        });
                    }
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
