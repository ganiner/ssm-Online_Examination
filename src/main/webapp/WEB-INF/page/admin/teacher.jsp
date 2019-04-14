<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>基础设置</title>

    <link rel="stylesheet" href="<%=basePath%>/vendor/bootstrap/css/bootstrap.min.css">
    <script src="<%=basePath%>/vendor/jquery/jquery.min.js"></script>
    <script src="<%=basePath%>/vendor/bootstrap/js/bootstrap.min.js"></script>

    <style>
        table {
            border: 1px solid black;
            border-collapse: collapse;
            width: 500px;
        }

        table th {
            border: 1px solid black;
            width: 25%;
        }

        table td {
            text-align: center;
            align-items: center;
            border: 1px solid black;
            width: 14%;
        }

        table th {
            background-color: #c6d0e9;
        }
    </style>
    <script>


    </script>

    <script src="<%=basePath%>/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=basePath%>/vendor/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=basePath%>/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="<%=basePath%>/vendor/js/123.js"></script>
    <script src="<%=basePath%>/vendor/js/456.js"></script>
    <![endif]-->

</head>
<script type="text/javascript">
    $(function(){
        //实现全选与反选 var ids=[];
        $("#allAndNotAll").click(function() {
            if (this.checked){
                $("input[name='items']:checkbox").each(function(){
                    $(this).attr("checked", true);
                });
            } else {
                $("input[name='items']:checkbox").each(function() {
                    $(this).attr("checked", false);
                });
            }
        });
        //获取被选中的id

        $('#getAllSelectedId').click(function(){
            var ids=new Array();
            $("input[name='items']:checked").each(function(){
                ids.push($(this).attr("id"));
            });
            var chk_value=ids.join(",");
            location.href = "<%=basePath%>/user/deletemanyteacher.do?chk_value="+chk_value;
        });
    });
</script>
<body>

<div id="wrapper">

    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">在线考试系统</a>
        </div>
        <ul class="nav navbar-top-links navbar-right">
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i>${sessionScope.usersession.username}&nbsp;<i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <%--<li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>--%>
                    <%--</li>--%>
                    <li><a href="<%=basePath%>/user/uppass.do?username=${sessionScope.usersession.username}">
                        <i class="fa fa-gear fa-fw"></i> 密码修改</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="<%=basePath%>/user/logout.do">
                        <i class="fa fa-sign-out fa-fw"></i> 退出</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="#"><i class="fa fa-dashboard fa-fw"></i>首页</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>题库<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=basePath%>/user/findallchoice.do">选择题查询</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/tk/alljudge.do">判断题查询</a>
                            </li>
                            <%--</li>--%>
                            <%--<li>--%>
                            <%--<a href="<%=basePath%>/tk/allReadFill.do">程序填空查询</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                            <%--<a href="<%=basePath%>/tk/allReadProgram.do">读程序写结果查询</a>--%>
                            <%--</li><li>--%>
                            <%--<a href="<%=basePath%>/tk/allPgDesign.do">程序设计查询</a>--%>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="<%=basePath%>/user/findpoint1.do"><i class="fa fa-table fa-fw"></i>知识点</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>/user/findallteacher.do"><i class="fa fa-edit fa-fw"></i>教师</a>
                    </li>
                    <li>
                        <a href=""><i class="fa fa-table fa-fw"></i>考试管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=basePath%>/exam/allexam.do">查看考试信息</a>
                            </li>
                            <li>
                                <a href=<%=basePath%>/exam/adminaddexam.do>创建新考试</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/admin/findstuscore.do">学生成绩查询</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href=""><i class="fa fa-wrench fa-fw"></i>基础信息<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=basePath%>/basic/allsemester.do">学生信息</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/basic/alldepart.do">院系信息</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/basic/allsit.do">职称信息</a>
                            </li>
                        </ul>
                    </li>


                </ul>
            </div>
        </div>
    </nav>
    <div id="page-wrapper">
        <br>
        <div class="container">
            <div class="table-responsive">
                <table style="width: 90%" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th colspan="7"><button class="line btn btn-primary btn-sm" id="teacheradd">添加老师</button>
                            &nbsp;&nbsp;&nbsp; <button class="line btn btn-primary btn-sm" id="getAllSelectedId" >批量删除</button></th>
                    </tr>
                    <tr>
                        <td ><input type="checkbox" id="allAndNotAll" />全选/反选</td>
                        <td >教师姓名</td>
                        <td>院系</td>
                        <td>职称</td>
                        <td>邮箱</td>
                        <td>密码</td>
                        <td>操作</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.teachers}" var="ts">
                        <tr class="text-center">
                            <td><input type="checkbox" name="items" id="${ts.id}"/></td>
                            <td>${ts.username}</td>
                            <td>${ts.major}</td>
                            <td>${ts.level}</td>
                            <td>${ts.mail}</td>
                            <td>${ts.password}</td>
                            <td>
                                <a href="#" onclick="return edit(${ts.id})" style="text-decoration: none;"
                                   id="teacheredit">
                                    <span class="fa fa-edit fa-fw"></span>
                                </a>
                                <a href="#" onclick="return trash(${ts.id})" style="text-decoration: none;"
                                   data-toggle="modal" data-target="#trashModal">
                                    <span class="fa fa-trash-o fa-fw"></span>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <%--<div align="center">--%>
                <%--<button style="width: 60%" class="btn btn-outline btn-primary" id="teacheradd">新增</button>--%>
            <%--</div>--%>
            <!-- 添加的模态框 -->
            <div class="modal fade" id="tchadd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">老师添加</h4>
                        </div>
                        <form class="form-horizontal" action="<%=basePath%>/user/save.do" method="post">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">姓名</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="username" class="form-control" id="username"
                                               placeholder="">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">系别</label>
                                    <div class="col-sm-5">
                                        <select class="form-control" id="major" name="major">

                                        </select>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label class="col-sm-2 control-label">职称</label>
                                    <div class="col-sm-5">

                                        <select class="form-control" id="level" name="level">

                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">邮箱</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="mail" class="form-control" id="mail"
                                               placeholder="">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">密码</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="password" class="form-control" id="password"
                                               placeholder="数字或英语">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="submit" class="btn btn-primary" id="emp_save_btn">保存</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- 删除的模态框 -->
            <div class="modal fade" id="trashModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!-- 模糊框头部 -->
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                            </button>
                            <h4 class="modal-title">删除！</h4>
                        </div>
                        <!-- 模糊框主体 -->
                        <div class="modal-body">
                            <strong>你确定要删除吗？</strong>
                        </div>
                        <!-- 模糊框底部 -->
                        <div class="modal-footer">
                            <button type="button" class="delSure btn btn-info" data-dismiss="modal">确定</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 编辑的模态框 -->
            <div class="modal fade" id="tchedit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="Label">编辑</h4>
                        </div>
                        <form class="form-horizontal" action="<%=basePath%>/user/update.do" method="post">
                            <div class="modal-body">
                                <input name="id" id="id" hidden="hidden"/>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">姓名</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="username" class="form-control" id="upusername"
                                               placeholder="">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label class="col-sm-2 control-label">系别</label>
                                    <div class="col-sm-5">
                                        <select class="form-control" id="upmajor" name="major">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">职称</label>
                                    <div class="col-sm-5">
                                        <select class="form-control" id="uplevel" name="level">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">邮箱</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="mail" class="form-control" id="upmail"
                                               placeholder="">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">密码</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="password" class="form-control" id="uppassword"
                                               placeholder="数字或英语">
                                        <span class="help-block"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="submit" class="btn btn-primary" id="tch_save_btn">保存</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script>
    /*<$(function(){
        window.location.href='user/findallteacher.do';
    })*/
    //点击新增按钮弹出模态框。
    $("#teacheradd").click(function () {
        $.ajax({
            url: '<%=basePath%>/basic/sit.do',
            type: 'POST',
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    $("#level").append("<option value='" + data[i].sit + "'>" + data[i].sit + "</option>");
                }
            }
        });

        $.ajax({
            url: '<%=basePath%>/basic/depart.do',
            type: 'POST',
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    $("#major").append("<option value='" + data[i].depart + "'>" + data[i].depart + "</option>");
                }
            }
        });
        $("#tchadd").modal({
            backdrop: "static"
        });
    });

    //删除
    function trash(id) {
        if (!id) {
            alert("error");
        } else {
            $(".delSure").click(function () {
                $.ajax({
                    url: '<%=basePath%>/user/delete.do?id=' + id,
                    type: 'POST',
                    success: function (data) {
                        $("body").html(data);
                    }
                });
            });
        }
    }

    // 编辑信息的方法
    function edit(id) {
        $.ajax({
            url: '<%=basePath%>/basic/sit.do',
            type: 'POST',
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    $("#uplevel").append("<option value='" + data[i].sit + "'>" + data[i].sit + "</option>");
                }
            }
        });

        $.ajax({
            url: '<%=basePath%>/basic/depart.do',
            type: 'POST',
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    $("#upmajor").append("<option value='" + data[i].depart + "'>" + data[i].depart + "</option>");
                }
            }
        });
        if (!id) {
            alert("error");
        } else {
            // 先去查询数据
            $.ajax({
                url: '<%=basePath%>/user/findById.do',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json;charset=UTF-8',
                data: JSON.stringify({
                    id: id
                }),
                success: function (data) {
                    console.log("老师" + data);
                    $("#id").val(data.id);
                    $("#upusername").val(data.username);
                    $("#upmajor").val(data.major);
                    $("#uplevel").val(data.level);
                    $("#upmail").val(data.mail);
                    $("#uppassword").val(data.password);
                    $("#tchedit").modal('show');
                },
                error: function () {
                    alert("错误");
                }
            });
        }
    }
</script>

<!-- /#wrapper -->

<!-- jQuery -->
<script src="<%=basePath%>/vendor/jquery/jquery.min.js"></script>
<script src="<%=basePath%>/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/vendor/metisMenu/metisMenu.min.js"></script>
<script src="<%=basePath%>/vendor/dist/js/sb-admin-2.js"></script>

</html>

