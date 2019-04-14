<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"/>
</head>
<body>
<div class="container">
    <h1 class="text-center">考试添加页面</h1>
    <hr/>
    <br/>
    <form class="form-inline text-center" action="<%=basePath%>/teacher/examInfo.do" method="post">
        <div class="form-group form-inline">
            <label>考试名称：</label>
            <input type="text" name="examname" class="form-control"/>
        </div>
        <br/>
        <br/>
        <div class="form-group form-inline">
            <label>题目数量：</label>
            <input type="text" name="exnumber" class="form-control"/>
        </div>
        <br/>
        <br/>
        <div class="form-group form-inline">
            <label>每小题分值：</label>
            <input type="text" name="score" class="form-control"/>
        </div>
        <br/>
        <br/>
        <br/>
        <input type="submit" class="btn btn-info text-center"/>
        <input type="reset" class="btn btn-info text-center"/>
    </form>
</div>
</body>
</html>
