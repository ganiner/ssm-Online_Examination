<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="java.util.*" %>
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

    <title>管理员首页</title>

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
    <style class="cp-pen-styles">* {
        margin: 0;
        padding: 0;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }

    ul {
        list-style-type: none;
    }
    h1 {
        color: #FFF;
        font-size: 24px;
        font-weight: 400;
        text-align: center;
        margin-top: 80px;
    }

    h1 a {
        color: #c12c42;
        font-size: 16px;
    }

    .accordion {
        width: 100%;
        max-width: 1000px;
        margin: 30px auto 20px;
        background: #FFF;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        border-radius: 4px;
    }

    .accordion .link {
        cursor: pointer;
        display: block;
        padding: 15px 15px 15px 42px;
        color: #4D4D4D;
        font-size: 14px;
        font-weight: 700;
        border-bottom: 1px solid #CCC;
        position: relative;
        -webkit-transition: all 0.4s ease;
        -o-transition: all 0.4s ease;
        transition: all 0.4s ease;
    }

    .accordion li:last-child .link {
        border-bottom: 0;
    }

    .accordion li i {
        position: absolute;
        top: 16px;
        left: 12px;
        font-size: 18px;
        color: #595959;
        -webkit-transition: all 0.4s ease;
        -o-transition: all 0.4s ease;
        transition: all 0.4s ease;
    }

    .accordion li i.fa-chevron-down {
        right: 12px;
        left: auto;
        font-size: 16px;
    }

    .accordion li.open .link {
        color: #55acee;
    }

    .accordion li.open i {
        color: #55acee;
    }
    .accordion li.open i.fa-chevron-down {
        -webkit-transform: rotate(180deg);
        -ms-transform: rotate(180deg);
        -o-transform: rotate(180deg);
        transform: rotate(180deg);
    }

    .accordion li.default .submenu {display: block;}
    /**
     * Submenu
     -----------------------------*/
    .submenu {
        display: none;
        font-size: 14px;
    }

    .submenu li {
        border-bottom: 1px solid #4b4a5e;
    }

    .submenu a {
        display: block;
        text-decoration: none;
        color: #55acee;
        padding: 12px;
        padding-left: 42px;
        -webkit-transition: all 0.25s ease;
        -o-transition: all 0.25s ease;
        transition: all 0.25s ease;
    }

    .submenu a:hover {
        background: #b63b4d;
        color: #FFF;
    }

    </style>
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
        <h1>Menu Despegable</h1>
        <!-- Contenedor -->

        <ul id="accordion" class="accordion">
            <c:forEach items="${requestScope.point1}" var="ts">
                <li>
                    <div class="link"><i class="fa fa-paint-brush"></i>${ts.pointname}
                        <i class="fa fa-chevron-down"></i></div>
                    <ul class="submenu">
                        <c:forEach items="${ts.point2}" var="t">
                            <li><a href="#">${t.pname}</a></li>
                        </c:forEach>
                    </ul>
                </li>
            </c:forEach>
        </ul>
        </ul>
        <button  class="btn btn-info"id="addpoint1">添加章节</button>
        <button  class="btn btn-info"id="addpoint2">添加小节</button>
        <button  class="btn btn-info" id="delpoint1">删除章节</button>
        <button  class="btn btn-info" id="delpoint2">删除小节</button>
    </div>
    <!-- /#page-wrapper -->
    <!--二级联动-->

</div>
<!-- /#wrapper --><!-- 添加章节的模态框 -->
<div class="modal fade" id="addp1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">章节添加</h4>
            </div>
            <form class="form-horizontal" action="<%=basePath%>/user/addpoint1.do" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">章节名</label>
                        <div class="col-sm-10">
                            <input type="text" name="pointname" class="form-control" id="pointname" placeholder="pointname">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary" id="empbtn">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- /#wrapper --><!-- 删除章节的模态框 -->
<div class="modal fade" id="delp1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="mypoint1">删除章节</h4>
            </div>
            <form class="form-horizontal" action="<%=basePath%>/user/delep1.do" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">章节</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="delp1_select" name = "id"></select>
                            <!--<option value="1"></option>-->
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary" id = "delp1but">删除</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div>
</div>


<!-- 添加小节的模态框 -->
<div class="modal fade" id="addp2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="my">添加小节</h4>
            </div>
            <form class="form-horizontal">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">章节</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="addp2_select" name = "aid"></select>
                            <!--<option value="1"></option>-->
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">小节</label>
                        <div class="col-sm-10">
                            <input type="text" name="pname" class="form-control" id="pname" placeholder="">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id = "addp2but">提交</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- 删除小节的模态框 -->
<div class="modal fade" id="delp2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myp2">删除小节</h4>
            </div>
            <form class="form-horizontal" action="<%=basePath%>/user/delep2.do" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">章节</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="chapter" name = "chapter">
                            </select>
                            <select class="form-control" id="chaptertwo" name = "chaptertwo"></select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary" id = "delp2but">提交</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- jQuery -->
<script src="<%=basePath%>/vendor/jquery/jquery.min.js"></script>
<script src="<%=basePath%>/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/vendor/metisMenu/metisMenu.min.js"></script>
<script src="<%=basePath%>/vendor/dist/js/sb-admin-2.js"></script>
<script>
    $(function () {
        var Accordion = function (el, multiple) {
            this.el = el || {};
            this.multiple = multiple || false;
            var links = this.el.find('.link');
            links.on('click', {
                el: this.el,
                multiple: this.multiple
            }, this.dropdown);
        };
        Accordion.prototype.dropdown = function (e) {
            var $el = e.data.el;
            $this = $(this), $next = $this.next();
            $next.slideToggle();
            $this.parent().toggleClass('open');
            if (!e.data.multiple) {
                $el.find('.submenu').not($next).slideUp().parent().removeClass('open');
            }
            ;
        };
        var accordion = new Accordion($('#accordion'), false);
    });
    //@ sourceURL=pen.js
</script>
</body>
<script>
    //添加章节
    $("#addpoint1").click(function(){
        $("#addp1").modal({
            backdrop:"static"
        });
    });
    //添加小节
    $("#addpoint2").click(function(){
        $("#addp2_select option").remove();
        getpoint1();
        $("#addp2").modal({
            backdrop:"static"
        });
    });
    //删除章节
    $("#delpoint1").click(function(){
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        // reset_form("#addp1 form");
        //发送ajax请求，查出，显示在下拉列表中
        //弹出模态框
        $("#delp1_select option").remove();
        getpoint1();
        $("#delp1").modal({
            backdrop:"static"
        });
    });
    //删除小节
    $("#delpoint2").click(function(){
        $("#chapter option").remove();
        $("#chaptertwo option").remove();
       getpoint();
        $("#delp2").modal({
            backdrop:"static"
        });
    });
    function getpoint() {
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
    }
    function getpoint1() {
        $.ajax({
            url:"${APP_PATH}/user/allpoint1.do",
            type:"GET",
            success:function(data) {
                //console.log(data);
                var bb =$(document).find("#delp1_select");
                var aa =$(document).find("#addp2_select");
                for (var i = 0; i < data.length; i++) {
                    aa.append("<option value='" + data[i].id+ "'>" + data[i].pointname + "</option>");
                    bb.append("<option value='" + data[i].id+ "'>" + data[i].pointname + "</option>");
                }
            }
        });
    }
    $("#addp2but").click(function(){
        alert($("#addp2 form").serialize())//序列化form上的数据
        $.ajax({
            url:"${APP_PATH}/user/addpoint2.do",
            type:"POST",
            data:$("#addp2 form").serialize(),
            success:function() {
                $("#addp2").modal('hide');
            }
        });
    });
    //清空表单样式及内容
    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }
</script>
</html>