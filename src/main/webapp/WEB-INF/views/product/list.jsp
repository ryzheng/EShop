<%--
  Created by IntelliJ IDEA.
  User: FENG
  Date: 2019/1/1
  Time: 13:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>产品列表 E-Shop</title>
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../css/font.css" />
    <link rel="stylesheet" href="../css/xadmin.css" />
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
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="javascript:;">首页</a>
        <a href="">产品管理</a>
        <a><cite>产品列表</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i>
    </a>
</div>
<div class="x-body">
    <xblock class="layui-btn-group demoTable">
        <button class="layui-btn layui-btn-danger" data-type="getCheckData"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加产品','add',450,600)"><i class="layui-icon"></i>添加</button>
        <%--<span class="x-right" style="line-height:40px">共有数据：88 条</span>--%>
    </xblock>
    <table class="lay-hide" lay-filter="demo" id="idTest"></table>
</div>

<script id="barDemo" type="text/html">
    <%--<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>--%>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script type="text/html" id="statusTpl">
    {{#  if(d.sales_status == 1){ }}
    <input type="checkbox" name="status" lay-skin="switch" lay-text="销售中|已下架" checked disabled/>
    {{#  } else { }}
    <input type="checkbox" name="status" lay-skin="switch" lay-text="销售中|已下架" disabled/>
    {{#  } }}
</script>

<script>
    //表格开始
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#idTest',           //元素id
            url: 'getProductsForPage', //请求地址
            method: 'get',             //请求方式
            page: true,                //是否开启分页
            response: {
                statusName: 'code', //规定数据状态的字段名称，默认：code
                statusCode: 200,    //规定成功的状态码，默认：0
                msgName: 'msg',     //规定状态信息的字段名称，默认：msg
                countName: 'count', //规定数据总数的字段名称，默认：count
                dataName: 'data'    //规定数据列表的字段名称，默认：data
            },
            cols: [[
                {type: 'checkbox'},
                {field: 'pid', sort: true, align: 'center', title: '产品ID'},
                {field: 'pname', align: 'center', title: '产品名称'},
                {field: 'brand', align: 'center', title: '品牌'},
                {field: 'image', align: 'center', title: '图片路径'},
                {field: 'price', align: 'center', title: '价格'},
                {field: 'capacity', align: 'center', title: '容量'},
                {field: 'weight', align: 'center', title: '重量'},
                {field: 'size', align: 'center', title: '尺寸'},
                {field: 'category', align: 'center', title: '类别'},
                {field: 'color', align: 'center', title: '颜色'},
                {field: 'material', align: 'center', title: '材质'},
                {field: 'bar_code', align: 'center', title: '条码'},
                {field: 'sales_status', align: 'center', title: '状态', templet: '#statusTpl'},
                {width: 145, align: 'center', toolbar: '#barDemo'}
            ]]
        });
        //监听表格复选框选择
        table.on('checkbox(demo)', function (obj) {
            console.log(obj);
        });
        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'detail') {
                layer.msg('ID：' + data.pid + ' 的查看操作');
            } else if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        type: 'post',
                        url: 'deleteProduct',
                        data: {
                            'pid': data.pid
                        },
                        dataType: 'json',
                        success: function (result) {
                            if (result.code === 200) {
                                layer.alert('删除成功', {icon: 6}, function () {
                                    //关闭当前frame
                                    table.reload('idTest');
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
                    title: data.pname,
                    area: '400px',
                    id: 'editProduct',
                    resize: false,
                    btn: '确认',
                    btnAlign: 'c',
                    moveType: 1,
                    content: ''
                        + '<form id="updateForm" class="layui-form layui-form-pane" style="margin:30px;">'
                        + '<div class="layui-form-item"><label class="layui-form-label">价格</label><div class="layui-input-block">'
                        + '<input id="price" class="layui-input" type="text" placeholder="请输入价格" value="' + data.price + '" autocomplete="off"/></div></div>'
                        + '<div class="layui-form-item" pane=""><label class="layui-form-label">状态</label><div class="layui-input-block">'
                        + '<input id="status" type="checkbox" lay-skin="switch" lay-text="销售中|已下架" ' + (data.sales_status === '1' ? 'checked' : '') + '/></div></div>'
                        + '<div class="layui-form-item layui-form-text"><label class="layui-form-label">描述</label><div class="layui-input-block">'
                        + '<textarea id="intro" class="layui-input" type="layui-textarea" placeholder="请输入描述内容" autocomplete="off" style="height:100px">' + data.intro + '</textarea>'
                        + '</div></div></form>',
                    success: function () {
                        layui.use('form', function () {
                            var form = layui.form;
                            form.render();
                        });
                        console.log(data);
                    },
                    yes: function () {
                        var price = $('#price')[0].value;
                        var intro = $('#intro')[0].value;
                        var status = $('#status')[0].checked === true ? 1 : 0;
                        console.log(price);
                        console.log(intro);
                        console.log(status);
                        $.ajax({
                            type: 'post',
                            url: 'updateProduct',
                            data: {
                                'pid': data.pid,
                                'price': price,
                                'status': status,
                                'intro': intro
                            },
                            dataType: 'json',
                            success: function (result) {
                                if (result.code === 200) {
                                    layer.alert('更新成功', {icon: 6}, function () {
                                        //关闭当前frame
                                        table.reload('idTest');
                                        layer.closeAll();
                                    });
                                } else {
                                    layer.alert('更新失败', {icon: 5}, function () {
                                    });
                                }
                            }
                        });
                    }
                });
            }
        });
        var $ = layui.$, active = {
            getCheckData: function () { //获取选中数据
                var checkStatus = table.checkStatus('idTest'), data = checkStatus.data;
                var IDlist = [];
                for (var i = 0; i < data.length; i++) {
                    IDlist[i] = data[i].pid;
                }
                layer.alert(JSON.stringify(IDlist));
                console.log(IDlist);
            },
            getCheckLength: function () { //获取选中数目
                var checkStatus = table.checkStatus('idTest')
                    , data = checkStatus.data;
                layer.msg('选中了：' + data.length + ' 个');
            },
            isAll: function () { //验证是否全选
                var checkStatus = table.checkStatus('idTest');
                layer.msg(checkStatus.isAll ? '全选' : '未全选');
            }
        };
        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>
</body>
</html>
