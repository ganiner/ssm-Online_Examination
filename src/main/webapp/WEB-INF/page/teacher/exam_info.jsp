<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%><!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>考试设置</title>
    <link rel="stylesheet" href="<%=basePath%>/vendor/bootstrap/css/bootstrap.min.css">
    <script src="<%=basePath%>/vendor/jquery/jquery.min.js"></script>
    <script src="<%=basePath%>/vendor/bootstrap/js/bootstrap.min.js"></script>


    <link href="<%=basePath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=basePath%>/vendor/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=basePath%>/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <script src="<%=basePath%>/vendor/js/123.js"></script>
    <script src="<%=basePath%>/vendor/js/456.js"></script>
    <![endif]-->

</head>

<body>

<div id="wrapper">
    <!-- Navigation -->
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
                    <i class="fa fa-user fa-fw"></i> ${sessionScope.teachersession.username}&nbsp;<i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="<%=basePath%>/teacher/uppass.do?username=${sessionScope.teachersession.username}">
                        <i class="fa fa-gear fa-fw"></i> 更改密码</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="<%=basePath%>/teacher/logout.do"><i class="fa fa-sign-out fa-fw"></i> 退出</a>
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
                                <a href="<%=basePath%>/tea_tk/tea_findallchoice.do">选择题查询</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/tea_tk/alljudge.do">判断题查询</a>
                            </li>
                            <%--<li>--%>
                            <%--<a href="<%=basePath%>/tea_tk/tea_allReadFill.do">程序填空查询</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                            <%--<a href="<%=basePath%>/tea_tk/tea_allReadProgram.do">读程序写结果查询</a>--%>
                            <%--</li><li>--%>
                            <%--<a href="<%=basePath%>/tea_tk/allPgDesign.do">程序设计查询</a>                        </li>--%>

                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href=""><i class="fa fa-table fa-fw"></i>考试<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=basePath%>/exam/examall.do">查看考试信息</a>
                            </li>
                            <li>
                                <a href=<%=basePath%>/exam/addexam.do>创建新考试</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>学生<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=basePath%>/teacher/stuinfo.do">学生信息查询</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/teacher/findstuscore.do">学生成绩查询</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
    </nav>
    <div id="page-wrapper">
        <br>
        <br>
        <table border="1" class="table table-bordered" id = "tab1" style="text-align: center">
            <thead>
            <tr>
                <th colspan="8" style="text-align:center;font-size: 20px ">考试基础信息设置</th>
            </tr>
            </thead>
            <tr>
                <th style="text-align: center">考试名称</th>
                <th style="text-align: center">考试时间</th>
                <th style="text-align: center">考试时长</th>
                <th style="text-align: center">密码</th>
                <th style="text-align: center">状态</th>
                <th style="text-align: center">命题人</th>
                <th style="text-align: center">操作</th>
            </tr>
<c:forEach items="${examInfo}" var="ex">
            <tr>
                <%--<td><a href="check_exam_score.html">${ex.examname}</a></td>--%>
                <td><a href="<%=basePath%>/exam/allstuexam.do?examid=${ex.id}">${ex.examname}</a></td>
                <td>${ex.begindate}-${ex.enddate}</td>
                <td>${ex.examtime}</td>
                <c:choose>
                    <c:when test="${empty ex.password}">
                        <td>无</td>
                    </c:when>
                    <c:otherwise>
                        <td>${ex.password}</td>
                    </c:otherwise>
                </c:choose>
                <% request.setAttribute("currentTime", new Date()); %>
                    <c:choose>
                        <c:when test="${ex.enddate < currentTime}">
                            <td ><font color="red">已结束</font></td>
                        </c:when>
                        <c:when test="${ex.begindate >currentTime }"><td > <font color="yellow">未开始</font></td></c:when>
                        <c:otherwise>
                            <td ><font color="green">进行中</font></td>
                        </c:otherwise>
                    </c:choose>
                <td>${ex.teacher}</td>
                <td >
                    <input  class="btn btn-outline btn-primary" type="button" value="查看详情"  onclick = "window.location.href = '<%=basePath%>/exam/detail.do?examid=${ex.id}'" >
                    <%--<input  class="btn btn-outline btn-primary" type="button" value="编辑"  data-toggle="modal" data-target="#myModa_n" >--%>
                    <input  class="btn btn-outline btn-primary" type="button" value="删除"  onclick="trash(${ex.id})" data-toggle="modal" data-target="#trashModal">
                </td>
            </tr>
</c:forEach>
        </table>
        <br>
        <!-- /#page-wrapper -->
    </div>
    <!-- 更改模态框  data-toggle="modal" data-target="#myModa_n" -->
    <div class="modal fade" id="editexam" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form action="<%=basePath%>/teacher/upexam.do" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">考试信息更改</h4>
                </div>
                <div class="modal-body" style="text-align:left">
                    <input name="id" id="id" hidden="hidden"/>
                    <div class="form-group input-group">
                        <span class="input-group-addon" style="height: 40px ; tab-size: 16px">请输入考试名称：</span>
                        <input type="text" style="height: 40px" class="form-control" id="upexamname" name="examname">
                    </div>
                    <div class="form-group has-success" >
                        <label  >请选择更改后的考试开始时间:</label>
                        <div >
                            <input style="width: 45%" type="date" id="upbegindate" name="begindate" value="2018-09-24"/>
                            <input style="width: 45%" type="time" id="upbegintime" name="begintime" value="13:00:59"/>
                        </div>

                        <label >请选择更改后的考试结束时间:</label>
                        <div>
                            <input style="width: 45%" type="date" id="upenddate" name="enddate" value="2018-12-24"/>
                            <input style="width: 45%" type="time" id="upendtime" name="endtime" value="13:00:59"/>
                        </div>
                    </div>
                    <div class="form-group input-group">
                        <span class="input-group-addon" style="height: 40px ; tab-size: 16px">请输入考试密码：</span>
                        <input type="text" style="height: 40px" class="form-control" id="uppassword" name="password">
                    </div>
                    <div class="form-group">
                        <label>请选择考试命题人</label>
                        <select class="form-control" id="upteacher" name="teacher">
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button"  class="btn btn-outline btn-primary" data-dismiss="modal">关闭</button>
                    <button type="submit"  class="btn btn-outline btn-primary">确定</button>
                </div>
            </div>
            </form>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
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
                        <strong>你将删除此次考试的全部信息！</strong>
                    </div>
                    <!-- 模糊框底部 -->
                    <div class="modal-footer">
                        <button type="button" class="delSure btn btn-info" data-dismiss="modal">确定</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                    </div>
                </div>
            </div>
        </div>


</div>
<script src="<%=basePath%>/vendor/jquery/jquery.min.js"></script>
<script src="<%=basePath%>/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/vendor/metisMenu/metisMenu.min.js"></script>
<script src="<%=basePath%>/vendor/dist/js/sb-admin-2.js"></script>
</body>
<script>

    //删除
    function trash(examid) {
        if (!id) {
            alert("error");
        } else {
            $(".delSure").click(function () {
                $.ajax({
                    url: '<%=basePath%>/exam/deleteexam.do?examid=' + examid,
                    type: 'POST',
                    success: function (data) {
                        $("body").html(data);
                    }
                });
            });
        }
    }
    function edit(id) {
        console.log("id" + id);
        // 先去查询数据
        $.ajax({
            url: '<%=basePath%>/teacher/byexamid.do',
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify({
                id: id
            }),
            success: function (data) {
                 getteacher();
                 console.log("数据" + data.examname);
                $("#id").val(data.id);
                $("#upexamname").val(data.examname);
                $("#uppassword").val(data.password);
                $("#begindate").val(data.begindate);
                $("#begintime").val(data.begintime);
                $("#enddate").val(data.enddate);
                $("#endtime").val(data.enddate);
                $("#endtime").val(data.enddate);
                $("#state").val(data.state);
                $("#upteacher").val(data.teacher);
                $("#editexam").modal('show');
            },
            error: function () {
                alert("错误");
            }
        });
        $("#editexam").modal('show');
    }
    function getteacher() {
        console.log("请求老师");
        $.ajax({
            url: "<%=basePath%>/user/listteacher.do",
            type: "GET",
            success: function (data) {
                var upteacher = $(document).find("#upteacher");
                for (var i = 0; i < data.length; i++) {
                    console.log("老师"  + data[i].username);
                    upteacher.append("<option value='" + data[i].username + "'>" + data[i].username + "</option>");
                }

            }
            });
    }
</script>
</html>
