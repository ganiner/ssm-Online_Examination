<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
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

    <title>考试</title>
    <link href="<%=basePath%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="<%=basePath%>/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <link href="<%=basePath%>/vendor/dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="<%=basePath%>/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <SCRIPT type="text/javascript">
        var maxtime = ${examinfo.examtime} * 60;
        function CountDown() {
            if (maxtime >= 0) {
                minutes = Math.floor(maxtime / 60);
                seconds = Math.floor(maxtime % 60);
                msg =  minutes + "分" + seconds + "秒";
                document.all["timer"].innerHTML = msg;
                if (maxtime == 5 * 60)alert("还剩5分钟");
                --maxtime;
            } else{
                clearInterval(timer);
                getValue();
                alert("时间到，结束!");
            }
        }
        timer = setInterval("CountDown()", 1000);
    </SCRIPT> <!--倒计时-->
    <style type="text/css">
        .opt{
            width:30px;
            height:30px;
            border:1px solid gray;
            float:left;

        }
        .opt_later{
            width:30px;
            height:30px;
            border:1px solid gray;
            float:left;
            background-color:gray;
        }
    </style>
</head>

<body>

<div id="wrapper">
    <div id="page-wrapper">
        <div>
            <table  border="0" width="90%" cellpadding="0" style="min-width:860px;">
                <tr>
                    <!-- left -->
                    <td valign="top">
                        <div class="tm_paper">
                            <div class="tm_paper_head">
                                <h5 style="background:#a6b4cd; color: #ffffff; padding:15px 0; font-size:14px; font-weight:bold; text-align: center" >
                                  ${examinfo.examname}
                                </h5>
                                <h5>
                                    <b>开考时间</b> :
                                    ${examinfo.begindate}-${examinfo.enddate}
                                    &nbsp;&nbsp;
                                    <b>考试时长</b> :${examinfo.examtime}分钟
                                    &nbsp;&nbsp;
                                    <b>选择题每小题分数</b> : ${examinfo.choicescore}
                                    &nbsp;&nbsp;
                                    <b>判断题每小题分数</b> : ${examinfo.judgescore}
                                    &nbsp;&nbsp;
                                    <b>出卷人</b> : ${examinfo.teacher}
                                </h5>
                                <h5 style="background:#a6b4cd; color: #ffffff; padding:5px 0; font-size:14px; font-weight:bold">
                                    考生信息
                                </h5>
                                <h5>
                                    <b>考生学号</b> :
                                    ${sessionScope.studentsession.num}
                                    &nbsp;&nbsp;
                                    <b>考生姓名</b> :
                                    ${sessionScope.studentsession.username}
                                    &nbsp;&nbsp;

                                    <b>倒计时(分钟)</b> :
                                    <em id="timer"  align="right" style="color :red"></em>
                                    <em id="warring" style="color:red"></em>
                                    &nbsp;&nbsp;
                                </h5>
                            </div>

                        </div>
                    </td>
                </tr>
            </table>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-sm-8">
                    <c:forEach items="${choice}" var="ch">
                    <form>
                        <fieldset>
                            <c:set var="index" value="${index+1}"/>
                            <p>${index}:${ch.content}</p>
                            <input type="radio" name="radio" value="A"/>A: ${ch.aoption}<br />
                            <input type="radio" name="radio" value="B"/>B: ${ch.boption}<br />
                            <input type="radio" name="radio" value="C"/>C: ${ch.coption}<br />
                            <input type="radio" name="radio" value="D"/>D: ${ch.doption}<br />
                            <br />
                        </fieldset>
                    </form>
                </c:forEach>
                    <c:forEach items="${judge}" var="ju">
                        <form >
                            <fieldset>
                                <c:set var="index" value="${index+1}"/>
                                <p>${index}:${ju.content}</p>
                                <input type="radio" name="radio1" value="true"/>正确<br />
                                <input type="radio" name="radio1" value="false"/>错误<br />
                                <br />
                            </fieldset>
                        </form>
                    </c:forEach>
                    <hr class="hidden-sm hidden-md hidden-lg">
                </div>
            </div>
        </div>

        <br />
        <br />

        <p align="center">
            <button style="width: 40%"   onclick="getValue()" type="button" class="btn btn-default btn-lg btn-block">提交试卷</button>
        </p>

        <br />
        <br />
        <br />
        <br />
    </div>
    <!-- /#page-wrapper -->

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
    function getValue(){
        var radio = document.getElementsByName("radio");
        var radio1 = document.getElementsByName("radio1");
        var answerchoice = new Array();
        var answerjudge = new Array();
        for (i =0; i<radio.length; i++) {
                if (radio[i].checked) {
                    answerchoice.push(radio[i].value);
                }
        }
        for (i =0; i<radio1.length; i++) {
            if (radio1[i].checked) {
                answerjudge.push(radio1[i].value);
            }
        }
        if(answerchoice.length < ${examinfo.choicenum}||answerjudge.length< ${examinfo.judgenum}){
            alert("还有未选择的题目");
        }
        else{
        location.href = "<%=basePath%>/exam/saveexam.do?examid=" + ${examinfo.id}+
            '&studentid='+${sessionScope.studentsession.id} + '&answerchoice='+ answerchoice+'&answerjudge='+ answerjudge;
        // alert("选择答案" +  answerchoice + "填空题答案" + answerjudge);
        }
    }
</script>
</html>
