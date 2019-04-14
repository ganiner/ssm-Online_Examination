<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
            <a class="navbar-brand"  style="font-size: 25px">在线考试系统</a>
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
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=basePath%>/css/style.css" media="screen" type="text/css" />
<div>
    <div><button class="btn btn-primary" id="showread">查看</button>
    </div>
    <div>
            <br/>
            <br/>
            <form  id="found">
            </form>
        <p id = "answer"></p>
    </div>
</div>

</body>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.1.js"></script>
<script type="text/javascript">
    $(function(){
        $.ajax({
            url : "${APP_PATH}/user/readall.do",	//请求url
            type : "POST",	//请求类型  post|get
            // data : "key=value&key1=value2",	//后台用 request.getParameter("key");
            dataType : "json",  //返回数据的 类型 text|json|html--
            success:function(data) {
                for(var i = 0; i < data.length; i++) {
                    var str =data[i].content;
                    var an = data[i].answer;
                    str = str.replace(/\t/g,"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
                    str = str.replace( /\r\n/g,"<br/>");
                    an = an.replace(/\t/g,"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
                    an = an.replace( /\r\n/g,"<br/>");
                    /*str = data[i].content;
                    str= str.replace(/</g,"&lt;");
                    str = str.replace(/>/g,"&gt;");
                    console.log("第二次替换"+str);*/
                    $("#found").append(str);
                    $("#answer").append(an);
                }
            }
        });
    });
</script>
<script>
    $("#showread").click(function(){
        $.ajax({
            url:"${APP_PATH}/user/readall.do",
            type:"GET",
            success:function(data) {
                for(var i = 0; i < data.length; i++) {
                    var str =data[i].content;
                    console.log("题目",str);
                    var s = data[i].answer;
                    str = str.replace(/\t/g,"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
                    str = str.replace( /\r\n/g,"<br/>");
                    /*str = data[i].content;
                    str= str.replace(/</g,"&lt;");
                    str = str.replace(/>/g,"&gt;");
                    console.log("第二次替换"+str);*/
                    $("#found").append(str);
                }
            }
        });
    });
</script>
</html>
