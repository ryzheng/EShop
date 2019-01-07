<%--
  Created by IntelliJ IDEA.
  User: FENG
  Date: 2019/1/2
  Time: 10:12
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
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .layui-form-onswitch i{
            left: 42px;
        }
        .layui-form-switch em{
            width: 36px;
        }
        .layui-form-switch{
            width: 52px;
        }
    </style>
</head>

<body>
<div class="x-body">
    <form class="layui-form layui-form-pane">
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>产品ID
            </label>
            <div class="layui-input-inline">
                <input type="text" id="pid" name="pid" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>产品名称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="pname" name="pname" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>品牌
            </label>
            <div class="layui-input-inline">
                <input type="text" id="brand" name="brand" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>价格
            </label>
            <div class="layui-input-inline">
                <input type="text" id="price" name="price" required="" lay-verify="required | number"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>容量
            </label>
            <div class="layui-input-inline">
                <input type="text" id="capacity" name="capacity" required="" lay-verify="required | number"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>重量
            </label>
            <div class="layui-input-inline">
                <input type="text" id="weight" name="weight" required="" lay-verify="required | number"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>尺寸
            </label>
            <div class="layui-input-inline">
                <input type="text" id="size" name="size" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>类别
            </label>
            <div class="layui-input-inline">
                <input type="text" id="category" name="category" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>颜色
            </label>
            <div class="layui-input-inline">
                <input type="text" id="color" name="color" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>材质
            </label>
            <div class="layui-input-inline">
                <input type="text" id="material" name="material" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>图片路径
            </label>
            <div class="layui-input-inline">
                <input type="text" id="image" name="image" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>条码
            </label>
            <div class="layui-input-inline">
                <input type="text" id="bar_code" name="bar_code" required="" lay-verify="required | number"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>描述
            </label>
            <div class="layui-input-inline">
                <textarea type="text" id="intro" name="intro" required="" lay-verify="required"
                          autocomplete="off" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item" pane="">
            <label class="layui-form-label">
                <span class="x-red">*</span>状态
            </label>
            <div class="layui-input-inline">
                <input type='checkbox' name='sales_status' lay-skin='switch' lay-text='销售中|已下架' value="1"/>
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
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form, layer = layui.layer;

        //监听提交
        form.on('submit(add)', function(data){
            console.log(data.field);
            //发异步，把数据提交给后端
            $.ajax({
                type: 'post',
                url: 'addProduct',
                data: JSON.stringify(data.field),
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function(result){
                    console.log(result);
                    if(result.code === 200){
                        layer.alert('增加成功', {icon: 6},function () {
                            //刷新父级页面
                            parent.location.reload();
                        });
                    }else{
                        layer.alert('增加失败', {icon: 5},function () {
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