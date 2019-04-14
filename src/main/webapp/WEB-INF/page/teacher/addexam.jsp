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

    <title>考试设计</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=basePath%>/vendor/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=basePath%>/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>/vendor/css/editTable.css" type="text/css" rel="stylesheet" />
    <script language="javascript" type="text/javascript" src="<%=basePath%>/vendor/js/jquery-1.7.2.min.js"></script>
    <script language="javascript" type="text/javascript" src="<%=basePath%>/vendor/js/editTable.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="<%=basePath%>/vendor/js/123.js"></script>
    <script src="<%=basePath%>/vendor/js/456.js"></script>
    <![endif]-->

</head>

<body>

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

    <!-- /.navbar-top-links -->

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
<br>
<br>
<div align="center">
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <form class="form-horizontal" role="form" id="examPaperAction" action="<%=basePath%>/exam/examadd.do" method="post">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">试卷名称</label>
                        <div class="col-sm-3">
                            <input class="form-control" id="examname" name="examname" type="text"  placeholder="试卷名称" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">命题人</label>
                        <div class="col-sm-3">

                            <select class="form-control" name="teacher" id="teacher" data-live-search="true">
                                <c:forEach items="${teacher}" var="te">
                                    <option value="${te.username}">${te.username}</option>
                                </c:forEach>
                            </select>

                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">设置口令</label>
                        <div class="col-sm-5">
                            <input class="form-control" id="password" name="password" type="text"  placeholder="进入考试的密码   公开则不填" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">知识点</label>
                        <div class="col-sm-3">
                            <select class="form-control" name="chapter" id="chapter" data-live-search="true">
                            </select>
                            <select class="form-control" name="chaptertwo" id="chaptertwo" data-live-search="true">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">难度</label>
                        <div class="col-sm-3">
                            <select class="form-control" id="difficulty" name = "difficulty">
                                <option value="1">容易</option>
                                <option value="2">中等</option>
                                <option value="3">较难</option>
                                <option value="4">困难</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">选择数量</label>
                        <div class="col-sm-5">
                            <input class="form-control" id="choicenum" name="choicenum" type="text"  placeholder="试卷中的试题总量" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">每小题分数</label>
                        <div class="col-sm-5">
                            <input class="form-control" id="choicescore" name="choicescore" type="text"  placeholder="每个选择题的分值" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">判断题数量</label>
                        <div class="col-sm-5">
                            <input class="form-control" id="judgenum" name="judgenum" type="text"  placeholder="判断题数量" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">每小题分数</label>
                        <div class="col-sm-5">
                            <input class="form-control" id="judgescore" name="judgescore" type="text" placeholder="每个判断题的分值" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">考试日期</label>
                        <div style="text-align: left">
                            <input type="date" value="2019-01-24" name="begindate"/>至
                            <input type="date" value="2019-01-24" name="enddate"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="examtime" class="col-sm-2 control-label">考试时长</label>
                        <div class="col-sm-5">
                            <input class="form-control" id="examtime" name="examtime" type="text"  placeholder="当前试卷考试时长 单位(min)" />
                        </div>
                    </div>
                    <br />
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-4">
                            <button  type="submit" class="btn btn-default btn-lg btn-block">
                                生成试卷
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
$(function(){
    $.ajax({
        url:"${APP_PATH}/user/pointall.do",
        type:"GET",
        success:function(data) {
            console.log(data);
            var chapter =$(document).find("#chapter");
            var chaptertwo =$(document).find("#chaptertwo");
            var  num= data.length;
            //   console.log("长度是"+num);
            var pp = new Array(num+1);
            for (var i = 0; i < data.length; i++) {
                chapter.append("<option value='" + i + "'>" + data[i].pointname + "</option>");
            }
            for (var j = 0; j < data[0].point2.length; j++) {
                chaptertwo.append("<option value='" + data[0].point2[j].pname + "'>" + data[0].point2[j].pname + "</option>");
            }
            //select1绑定change事件
            $("#chapter").change(function () {
                var p = this.value;
                //p = p-1;
                console.log("第几个"+p);
                $("#chaptertwo").empty();
                //遍历p2的数组
                console.log("长度为"+ data[p].point2.length);
                for (var j = 0; j < data[p].point2.length; j++) {
                    console.log(data[p].point2[j].pname);
                    chaptertwo.append("<option value='" + data[p].point2[j].pname+ "'>" + data[p].point2[j].pname+ "</option>");
                }
            });
        }
    });
})

</script>
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

</html>

