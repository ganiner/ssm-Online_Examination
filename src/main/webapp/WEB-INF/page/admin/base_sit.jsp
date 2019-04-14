<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
        table{
            border: 1px solid black;
            border-collapse: collapse;
            width: 300px;
            text-align: center;
        }
        table th {
            border: 1px solid black;
            width: 2%;
            text-align: center;
        }
        table td {
            align-items: center;
            border: 1px solid black;
            width: 25%;
            text-align: center;
        }
    </style>


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
        <!-- /.navbar-static-side -->
    </nav>

    <!-- Page Content -->
    <div id="page-wrapper">
        <br>
        <br>
        <table border="1" class="table table-bordered" id = "tab1">
            <thead>
            <tr>
                <th colspan="4">职称信息</th>
            </tr>
            </thead>

            <tr>
                <th>职称</th>
                <th>操作&nbsp;
                    &nbsp;<input style="width: 20%" class="btn btn-outline btn-primary" type="button" value="新增"  data-toggle="modal" data-target="#myModa_n" >
                </th>
            </tr>
            <c:forEach items="${sit}" var="ma">
                <tr>
                    <td style="margin-top: 50%"  >${ma.sit}</td>
                    <td ><input style="width: 30%" class="btn btn-outline btn-primary" type="button" value="编辑"  onclick="edit('${ma.sit}','${ma.id}')">
                        <input style="width: 30%" class="btn btn-outline btn-primary" type="button" value="删除" onclick="deletemajor('${ma.id}') " data-toggle="modal" data-target="#trashModal" >
                    </td>
                </tr>
            </c:forEach>
        </table>
        <%--<div align="center">--%>
        <%--<input style="width: 20%" class="btn btn-outline btn-primary" type="button" value="新增"  data-toggle="modal" data-target="#myModa_n" >--%>
        <%--&lt;%&ndash;<input style="width: 20%" class="btn btn-outline btn-primary" type="button" value="删除" onclick="todelete()"/>&ndash;%&gt;--%>
        <%--</div>--%>
        <br>
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
    <!-- 编辑-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form action="<%=basePath%>/basic/upsit.do" method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">职称更改</h4>
                    </div>
                    <input name="id" id="id"   hidden="hidden"/>
                    <div class="modal-body" style="text-align:left">

                        <div class="form-group input-group">
                            <span class="input-group-addon" style="height: 40px ; tab-size: 16px">请输入更改后的职称:</span>
                            <input type="text" style="height: 40px " class="form-control" name="sit" id="sit">
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
    <!-- /#wrapper -->
    <br>
    <div>
        <tr class="append-row">
            <td colspan="5" align="right">
                <!-- Modal -->
                <div class="modal fade" id="myModa_n" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <form action="<%=basePath%>/basic/addsit.do" method="post">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <%--<input name="seid" id="seid"  value="${seid}" hidden="hidden"/>--%>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" id="myModalLabe2" style="text-align:center">添加选项</h4>
                                </div>
                                <div class="modal-body" style="text-align:left">
                                    <div class="form-group input-group">
                                        <span class="input-group-addon" style="height: 40px ; tab-size: 16px">请输入院系:</span>
                                        <input type="text" style="height: 40px " class="form-control" name="sit">
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
            </td>
        </tr>
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
    function edit(sit,id) {
        console.log("编辑都depart" + sit);
        $("#sit").val(sit);
        $("#id").val(id);
        $("#myModal").modal('show');
    }
    function deletemajor(id) {
        console.log("删除的班级" + id);
        $(".delSure").click(function () {
            $.ajax({
                url: '<%=basePath%>/basic/deletesit.do?id='+ id,
                type: 'POST',
                contentType: 'application/json;charset=UTF-8',
                success: function (data) {
                    location.reload();
                }
            });
        });
    }
</script>
</html>
