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
    <link rel="stylesheet" href="../../vendor/bootstrap/css/bootstrap.min.css">
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
            width:2%;
            text-align: center;

        }
        table td {
            align-items: center;
            border: 1px solid black;
            width: 20%;
            text-align: center;
        }

    </style>
    <script>
        //文档准备就绪
        $(function () {
            //设置 所有 td 居中
            $('table td').attr("align","center");
            //标签+属性选择所有<编辑>按钮
            /*
            $('input[value="编辑"]').click(function () {
                //获取每一个<编辑>按钮的 下标（从0开始 所以需要+2 = 按钮在表格的所在行数）
                var numId = $('input[value="编辑"]').index($(this))+2;
                //选择表格中的所有tr 通过eq方法取得当前tr
                var ttr = $('table tr').eq(numId);

                ttr.find("td").each(function () {

                    if($(this).children("input[type='checkbox']").length>0){
                        return ;
                    }
                    if($(this).children("input[type='button']").length>0){
                        return ;
                    }
                    if($(this).children("input[type='text']").length>0){
                        return ;
                    }
                    var tdText = $(this).html();
                    $(this).html("");
                    var inputObj = $("<input type='text'>");
                    inputObj.appendTo($(this));
                    inputObj.css("width","95%");
                    inputObj.val(tdText);
                });
            });
            */
            //为每一个确定按钮设置点击事件
            $('input[value="确定"]').click(function () {
                /*通过parents方法获取<确定>按钮的父容器tr
                 再为 tr中的每一个text设置function
                 */
                var ttr=$(this).parents("tr");
                ttr.find('input[type="text"]').each(function () {
                    var inputVal = $(this).val();
                    $(this).parents('td').html(inputVal);
                })
            });
            //全选/反选
            $('#cha').click(function () {
                //判断checkbox是否选中
                if($(this).is(':checked')){
                    $('input[type="checkbox"]').attr("checked","true");
                }else{
                    $('input[type="checkbox"]').removeAttr("checked");
                }
            });
            //增加一行
            $('#add').click(function () {
                $('#tab1 tr').eq(3).clone(true).appendTo("#tab1");
            });
            //删除最后一行
            $('#delete').click(function () {
                $('table tr:last').remove();
            });
            //$('#deleteone').click(function () {
            //   $('input[type="checkbox"]');
            //});
            // $(function(){
            //    $("input[type='button']").click(function() {
            //       $("input[id=\"cha\"]:checked").each(function() { // 遍历选中的checkbox
            //           n = $(this).parents("tr").index();  // 获取checkbox所在行的顺序
            //            $("table#test_table").find("tr:eq("+n+")").remove();
            //        });
            //    });
            // });
        })

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
        <!-- /.navbar-header -->

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
                <th colspan="4" style="text-align: center;font-size: 20px ">${cname}学生信息设置</th>
            </tr>
            </thead>

            <tr>
                <td>学号</td>
                <td>姓名</td>
                <td>密码</td>
                <td>操作&nbsp;&nbsp;&nbsp;<input style="width: 20%" class="btn btn-outline btn-primary" type="button" value="新增"  data-toggle="modal" data-target="#myModa_n" ></td>
            </tr>
            <c:forEach items="${student}" var="st">
            <tr>
                <td style="margin-top: 50%"  >${st.num}</td>
                <td> <a href="<%=basePath%>/exam/stuexam.do?stuid="+${st.id}>${st.username}</a></td>
                <td>${st.password}</td>
                <td >
                    <input style="width: 30%" class="btn btn-outline btn-primary" type="button" value="编辑" onclick="edit('${st.id}')" >
                    <input style="width: 30%" class="btn btn-outline btn-primary" type="button" value="删除"  onclick="removeTr(${st.num})">
                </td>
            </tr>
            </c:forEach>
        </table>
        <%--<div align="center">--%>
            <%--<input style="width: 20%" class="btn btn-outline btn-primary" type="button" value="新增"  data-toggle="modal" data-target="#myModa_n" >--%>
        <%--</div>--%>
        <br>
        <!-- /#page-wrapper -->
    </div>
    <!-- 编辑  data-toggle="modal" data-target="#myModa_n" -->
    <div class="modal fade" id="editstu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">学生信息更改</h4>
                </div>
                <div class="modal-body" style="text-align:left">
                    <form action="<%=basePath%>/student/upstu.do" method="post">
                    <div class="form-group input-group">
                        <span class="input-group-addon" style="height: 40px ; tab-size: 16px">请输入更改后的学号：</span>
                        <input type="text" style="height: 40px" class="form-control" disabled="disabled" id="upnum" name ="num">
                    </div>
                        <input name="num" id="num" hidden="hidden"/>
                    <div class="form-group input-group">
                        <span class="input-group-addon" style="height: 40px ; tab-size: 16px">请输入更改后的姓名：</span>
                        <input type="text" style="height: 40px" class="form-control" name="username" id="upusername">
                    </div>
                    <div class="form-group input-group">
                        <span class="input-group-addon" style="height: 40px ; tab-size: 16px">请输入更改后的密码：</span>
                        <input type="text" style="height: 40px" class="form-control" name="password" id="uppassword">
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
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabe2" style="text-align:center">添加选项</h4>
                            </div>
                            <form action="<%=basePath%>/basic/creatstu.do" method="post">
                            <div class="modal-body" style="text-align:left">
                               <input name="classname" id="classname"  hidden="hidden" value="${cname}"/>
                                <div class="form-group input-group">
                                    <span class="input-group-addon" style="height: 40px ; tab-size: 16px">请输入学号：</span>
                                    <input type="text" style="height: 40px " class="form-control" name="num">
                                </div>
                                <div class="form-group input-group">
                                    <span class="input-group-addon" style="height: 40px ; tab-size: 16px">请输入姓名：</span>
                                    <input type="text" style="height: 40px" class="form-control" name="username">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button"  class="btn btn-outline btn-primary" data-dismiss="modal">关闭</button>
                                <button type="submit"  class="btn btn-outline btn-primary">确定</button>
                            </div>
                            </form>
                        </div>
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
    function edit(id) {
        console.log("插在的id" + id);
        $.ajax({
            url: '<%=basePath%>/student/byId.do?id='+ id,
            type: 'POST',
            success: function (data) {
                $("#upnum").val(data.num);
                $("#num").val(data.num);
                $("#upusername").val(data.username);
                $("#uppassword").val(data.password);
                $("#editstu").modal('show');
             }
        });
    }
    function removeTr(num) {
        console.log("num" + num);
        $.ajax({
            url: '<%=basePath%>/student/detelestu.do?num='+ num,
            type: 'POST',
            success: function (data) {
                location.reload();
            }
        });

    }
</script>
</html>

