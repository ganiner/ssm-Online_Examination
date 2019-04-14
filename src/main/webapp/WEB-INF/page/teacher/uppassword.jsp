<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
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
    <title>管理员首页</title>
    <link href="<%=basePath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <link href="<%=basePath%>/vendor/dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="<%=basePath%>/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="<%=basePath%>/vendor/js/123.js"></script>
    <script src="<%=basePath%>/vendor/js/456.js"></script>
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

    <div class="container">

        <br/>
        <form class="form-inline text-center" action="<%=basePath%>/teacher/uppassword.do" method="post" onsubmit="return check()">
            <input name="id" id="id" hidden="hidden" value="${teacher.id}"/>
            <div class="form-group form-inline">
                <label>原密码：</label>
                <input type="password" name="pass" id="pass" class="form-control" placeholder="请输入旧密码"/>
            </div>
            <br/>
            <br/>
            <div class="form-group form-inline">
                <label>新密码：</label>
                <input type="password" name="password" id="password" class="form-control" placeholder="请输入新密码"/>
            </div>
            <br/>
            <br/>
            <div class="form-group form-inline">
                <label>重复密码：</label>
                <input type="password" name="password2" id="password2" class="form-control" placeholder="请重复新密码"/>
            </div>
            <br/>
            <br/>
            <br/>
            <input type="submit" class="btn btn-info text-center"/>
            <input type="reset" class="btn btn-info text-center"/>
        </form>
    </div>

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="<%=basePath%>/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>/vendor/dist/js/sb-admin-2.js"></script>

</body>
<script>
    function check() {
        var old = "${teacher.password}";
        var pass = document.getElementById("pass").value;
        var password = document.getElementById("password").value;
        var password2 = document.getElementById("password2").value;
        if(pass == "") {
            alert("请输入原密码");return false;}
        if(pass!=old) {
            alert("初始密码不正确");return false;}
        if(password == "") {
            alert("请输入新密码");return false;}
        if(password2 == "") {
            alert("请重复输入新密码");return false;}
        if(password2 != password){
            alert("两次密码输入不一致");return false;}
    }
</script>
</html>

