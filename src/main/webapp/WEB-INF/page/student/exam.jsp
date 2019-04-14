<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"/>
<link rel="stylesheet" href="<%=basePath%>/css/font-awesome.min.css"/>
<head>
    <title>考试列表页面</title>
    <script src="<%=basePath%>/lib/jquery-3.3.1.min.js"></script>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-8">
<c:forEach items="${requestScope.choice}" var="ch">
    <form>
        <fieldset id="fieldset3">
            <p>${ch.content}分数:${score}</p>
            <input type="radio" name="radio" value="A"/>${ch.aoption}<br />
            <input type="radio" name="radio" value="B" />${ch.aoption}<br />
            <input type="radio" name="radio" value="C"/>${ch.aoption}<br />
            <input type="radio" name="radio" value="D"/>${ch.aoption}<br />
            <br />
        </fieldset>
    </form>
</c:forEach>
            <button type="submit" class="delSure btn btn-info" data-dismiss="modal" onclick="getValue()">提交</button>
        </div>
    </div>
</div>
</body>
<script>
      function getValue(){
         var radio = document.getElementsByName("radio");
         var answer = new Array();
          <c:forEach items="${requestScope.choice}" var="ch">
                answer.push('${ch.answer}')
          </c:forEach>
          console.log("length"+answer.length);
          var allscore = 0;
        for (i=0; i<radio.length; i++) {
            if (radio[i].checked) {
                var b =answer.shift();
               if(b == radio[i].value){
                   allscore += Number('${score}');
               }
            }
        }
         save(allscore);
        console.log("总分" + allscore);
      }
      function save(allscore) {
          console.log("dd"+ allscore);
          console.log("aa"+'${examname}')
          alert("当前考试分数为：" + allscore);
          location.href = "<%=basePath%>/student/savescore.do?allscore="+allscore+"&examname="+'${examname}';

          <%--$.ajax({--%>
              <%--url: '<%=basePath%>/student/savescore.do',--%>
              <%--type: 'POST',--%>
              <%--dataType: 'json',--%>
              <%--contentType: 'application/json;charset=UTF-8',--%>
              <%--data: JSON.stringify({--%>
                  <%--allscore: allscore,--%>
                  <%--examname:'${examname}'--%>
              <%--}),--%>
              <%--success: function () {--%>
                <%--alert("你本次的考试成绩为" + allscore);--%>
              <%--},--%>
          <%--});--%>
      }
</script>
</html>
