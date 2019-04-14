<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"/>
<link rel="stylesheet" href="<%=basePath%>/css/font-awesome.min.css"/>
<head>
    <title>考试列表页面</title>
</head>

<body>
<br/>
<hr/>
<div class="table-responsive">
    <table class="table table-hover table-striped">
        <thead>
    <tr>
        <th style="text-align: center;">考试名称</th>
        <th style="text-align: center;">操作</th>
    </tr>
    </thead>
    <c:choose>
           <c:when test="${fn:length(requestScope.examInfo) > 0 }">


        <tbody> <c:forEach items="${requestScope.examInfo}" var="ex">
            <tr class="text-center">
                <td >${ex.examname}</td>
                <td>
                    <form action="<%=basePath%>/teacher/exambegin.do" method="post">
                        <input name="examname" id="examname"  value="${ex.examname}" hidden="hidden"/>
                        <input name="exnumber" id="exnumber"  value="${ex.exnumber}" hidden="hidden"/>
                        <input name="score" id="score" value="${ex.score}" hidden="hidden"/>
                    <button type="submit" class="delSure btn btn-info" data-dismiss="modal">进入</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

        </c:when>
        <c:otherwise>
            <div class="jumbotron">
                <h1>暂无待考信息</h1>
                <p>请等待教师分配</p>
            </div>
        </c:otherwise>
        </c:choose>
</div>
</body>
<script src="<%=basePath%>/lib/jquery-3.3.1.min.js"></script>

</html>
