<%--
  Created by IntelliJ IDEA.
  User: FENG
  Date: 2018/12/31
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8" />
    <title>后台登录 E-Shop</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css" />
    <link rel="stylesheet" href="./css/xadmin.css" />
    <script type="text/javascript" src="./js/jquery_3.3.1_jquery.min.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div class="message">管理登录 E-Shop</div>
    <div id="darkbannerwrap"></div>
    <form method="post" class="layui-form" >
        <input name="username" placeholder="用户名/邮箱/手机号码"  type="text" lay-verify="username" class="layui-input" />
        <hr class="hr15" />
        <input name="password" lay-verify="password" placeholder="密码"  type="password" class="layui-input" />
        <hr class="hr15" />
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit" />
        <hr class="hr20" />
    </form>
</div>

<script>
    $(function() {
        layui.use('form', function(){
            var form = layui.form;
            // layer.msg('玩命卖萌中', function(){
            //   //关闭后的操作
            //   });
            form.verify({
                username: function(value){
                    if(!value){
                        return '请输入用户名';
                    }
                },
                password: function(value){
                    if(!value){
                        return '请输入密码';
                    }
                }
            });
            //监听提交
            form.on('submit(login)', function(data){
                console.log(data.field);
                $.ajax({
                    type: 'post',
                    url: 'login/customer',
                    data:{
                        account: data.field.username,
                        password: data.field.password
                    },
                    dataType: 'json',
                    success: function(result){
                        if(result.code===200){
                            location.href='index';
                        }else{
                            layer.msg('用户名或密码错误！',function(){});
                        }
                    }
                });
                return false;
            });
        });
    });
</script>
<!-- 底部结束 -->
</body>
</html>
