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

<html  lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
        body {
            padding-top: 80px;
            padding-left: 50px;
            font-size: 20px;
        }
        .container { margin:10px ; min-width:10px;}
    </style>
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

    <style>
        table{
            border: 1px solid black;
            border-collapse: collapse;
            width: 500px;
        }
        .container { margin:10px ; min-width:10px;}
        td{padding:0px 40px;}
        #customers{
            font-family:黑体;
            width:100%;
            border-collapse:collapse;
            text-align:center;
        }

        #customers td, #customers th{  /* 建立customers的派生选择器td，th*/
            font-size:1em;
            border:1px solid #35c628;
            padding:20px 7px 2px 7px;
        }

        #customers th{
            font-size:14px;
            text-align:center;
            padding-top:30px;
            padding-bottom:30px;
            background-color:#767c8d;
            color:#ffffff;
        }
        #customers tr.alt td{
            color:#000000;
            background-color:#EAF2D3;
        }
    </style>

</head>
<body>


<div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand"  style="font-size: 25px">C语言在线考试系统</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav"> <!-- 下列class="active"  为那个高亮 -->
                <li><a href="<%=basePath%>/user/findpoint1.do"><span class="glyphicon glyphicon-envelope"></span> 知识点 </a></li>
                <li  ><a href="<%=basePath%>/user/ListTk.do"><span class="glyphicon glyphicon-home"></span> 题库 </a></li>
                <li><a href=""><span class="glyphicon glyphicon-briefcase"></span> 考试 </a></li>
                <li><a href="<%=basePath%>/user/ListTeacher.do"><span class="glyphicon glyphicon-envelope"></span> 教师 </a></li>
                <li><a href=""><span class="glyphicon glyphicon-cog"></span> 基础设置 </a></li>
            </ul>
            <div  style="margin: 10px ; text-align: right" class="info">
                <span style="color: gray">欢迎您：${sessionScope.usersession.username }老师</span>
                <em>|</em>
                <a  href="">退出</a>
            </div>
        </div>
    </div><!-- /.container -->
</div>  <!-- 抬头 -->
<br/>
<br/>
<script src="<%=basePath%>/js/jquery-3.3.1.min.js"></script>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/js/index.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/js/jquery-1.12.4.min.js"></script>
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=basePath%>/css/style.css" media="screen" type="text/css" />

<div class="container">
    <div class="row">
        <div class="col-sm-4">

        </div>
        <div class="col-sm-5">
            <h3 >知识点管理：</h3>
            <div><button class="btn btn-primary" id="addpoint1">新增章节</button>
                    <button class="btn btn-primary" id="addpoint2" >添加小节</button>
            </div>
            <div style="text-align:center;clear:both">
            </div>
            <!--二级联动-->
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
    </div>
</div>
</div>
<!-- 添加章节的模态框 -->
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
</body>
<script>
    $("#addpoint1").click(function(){
        $("#addp1").modal({
            backdrop:"static"
        });
    });
    $("#addpoint2").click(function(){
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
       // reset_form("#addp1 form");
        //发送ajax请求，查出，显示在下拉列表中
        //弹出模态框
        $("#addp2_select option").remove();
        getpoint1();
        $("#addp2").modal({
            backdrop:"static"
        });
    });
    function getpoint1() {
        $.ajax({
            url:"${APP_PATH}/user/allpoint1.do",
            type:"GET",
            success:function(data) {
                console.log(data);
                var bb =$(document).find("#addp2_select");
                for (var i = 0; i < data.length; i++) {
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