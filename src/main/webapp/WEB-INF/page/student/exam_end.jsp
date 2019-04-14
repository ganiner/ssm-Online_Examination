<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
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

    <title>考试</title>

    <style>
        .table th{
            text-align: center;
        }
        .table td{
            text-align: center;
        }
    </style>

    <link href="<%=basePath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <link href="<%=basePath%>/vendor/dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="<%=basePath%>/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="<%=basePath%>/vendor/js/123.js"></script>
    <script src="<%=basePath%>/vendor/js/456.js"></script>
    <![endif]-->

</head>

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

            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> ${sessionScope.studentsession.username}&nbsp;<i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="<%=basePath%>/student/studentup.do?username=${sessionScope.studentsession.username}">
                        <i class="fa fa-gear fa-fw"></i> 更改密码</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="<%=basePath%>/student/logout.do"><i class="fa fa-sign-out fa-fw"></i> 退出</a>
                    </li>
                </ul>
            </li>
        </ul>
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="#"><i class="fa fa-dashboard fa-fw"></i>首页</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>/exam/examallstu.do?studentid=${sessionScope.studentsession.id}">
                            <i class="fa fa-gear fa-fw"></i>考试</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>/exam/examhistory.do?studentid=${sessionScope.studentsession.id}">
                            <i class="fa fa-edit fa-fw"></i>试卷回顾</a>
                    </li>
                </ul>
            </div>

        </div>

    </nav>


    <div id="page-wrapper">
        <br>
        <table class="table table-striped" style="width: 90% " align="center">
            <caption></caption>
            <thead>
            <tr>
                <th width="30%">考试名称</th>
                <th width="15%">考试时间</th>
                <th width="15%">时长</th>
                <th width="10%">成绩</th>
                <th width="10%">命题人</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${examend}" var="ex">
                <tr>
                    <td><a href="<%=basePath%>/exam/examdetial.do?studentid=${sessionScope.studentsession.id}&examid=${ex.id}">${ex.examname}</a></td>
                    <td>${ex.begindate}&nbsp;${ex.enddate}</td>
                    <td>${ex.examtime}</td>
                    <td>${ex.allscore}</td>
                    <td>${ex.teacher}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <!-- /#page-wrapper -->

</div>
<script src="<%=basePath%>/vendor/jquery/jquery.min.js"></script>
<script src="<%=basePath%>/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/vendor/metisMenu/metisMenu.min.js"></script>
<script src="<%=basePath%>/vendor/dist/js/sb-admin-2.js"></script>
</body>
</html>
