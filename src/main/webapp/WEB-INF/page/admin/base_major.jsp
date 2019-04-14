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
            width: 500px;
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
    <script>
        //根据checkbox批量删除
        function todelete() {
            var msg = "确认删除选中试题";
            if(confirm(msg)==true){
                var chk_value = [];//定义一个数组
                //利用将name等于ids的多选按钮得到
                $("#tableId").find(":input[id='case']:checked").each(function(){
                    //获取id值，因为id单元格在复选框单元格的下一个元素
                    var val = $(this).parent().next().text();
                    //将id值添加到数组
                    chk_value.push(val);
                });
                if (chk_value.length == 0) {
                    alert("你还没有选择任何内容！");
                }
                if (chk_value.length > 0) {
                    //在浏览器控制台打印信息
                    console.log(chk_value);
                    location.href = "${ctx}/tec/isdeleteMany.do?chk_value=" + chk_value;
                }
            }
        }

    </script>

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
                <th colspan="4">专业设置</th>
            </tr>
            </thead>

            <tr>
                <th>专业</th>
                <th>操作&nbsp;<input style="width: 20%" class="btn btn-outline btn-primary" type="button" value="添加"  data-toggle="modal" data-target="#myModa_n" >
                </th>
            </tr>
            <c:forEach items="${major}" var="ma">
            <tr>
                <td style="margin-top: 50%"  ><a href="<%=basePath%>/basic/allclass.do?maid=${ma.maid}">${ma.maname}</a></td>
                <td >
                    <input style="width: 30%" class="btn btn-outline btn-primary" type="button" value="编辑" onclick="edit('${ma.maid}','${ma.maname}','${seid}')" >
                    <input style="width: 30%" class="btn btn-outline btn-primary" type="button" value="删除" onclick="deletemajor(${ma.maid})" >
                </td>
            </tr>
            </c:forEach>
        </table>

        <br>
    </div>

    <!-- 编辑-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="<%=basePath%>/basic/upma.do" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">专业更改</h4>
                </div>
                <div class="modal-body" style="text-align:left">
                    <input name="maid" id="maid"   hidden="hidden"/>
                    <input name="seid" id="seid"   hidden="hidden"/>
                    <div class="form-group input-group">
                        <span class="input-group-addon" style="height: 40px ; tab-size: 16px">请输入更改后的专业:</span>
                        <input type="text" style="height: 40px " class="form-control" id="maname" name="maname">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button"  class="btn btn-outline btn-primary" data-dismiss="modal">关闭</button>
                    <button type="submit"  class="btn btn-outline btn-primary">确定</button>
                </div></form>
            </div>
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
                        <form action="<%=basePath%>/basic/insertma.do" method="post">
                        <div class="modal-content">
                            <div class="modal-header">
                                <input name="seid" id="seid"  value="${seid}" hidden="hidden"/>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabe2" style="text-align:center">添加选项</h4>
                            </div>
                            <div class="modal-body" style="text-align:left">
                                <div class="form-group input-group">
                                    <span class="input-group-addon" style="height: 40px ; tab-size: 16px">请输入专业:</span>
                                    <input type="text" style="height: 40px " class="form-control" name="maname">
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
    function edit(maid,maname,seid) {
        $("#maid").val(maid);
        $("#seid").val(seid);
        $("#maname").val(maname);
        $("#myModal").modal('show');
    }
    function deletemajor(maid) {
        console.log("删除的班级" + maid);
        $.ajax({
            url: '<%=basePath%>/basic/findciall.do?maid='+maid,
            type: 'POST',
            success: function (data) {
                if (0 != data.length){
                    alert("请先删除此班级下的所有班级"+data.length);
                }
                else {
                    $.ajax({
                        url: '<%=basePath%>/basic/deletemajor.do?maid='+ maid,
                        type: 'POST',
                        success: function (data) {
                            location.reload();
                            alert("删除成功");
                        }
                    });
                    location.reload();
                    alert("删除成功");
                }

            }
        });
    }
</script>
</html>
