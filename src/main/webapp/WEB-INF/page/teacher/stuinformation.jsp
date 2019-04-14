<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>教师首页</title>

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
                    <i class="fa fa-user fa-fw"></i> ${sessionScope.teachersession.username}&nbsp;<i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="<%=basePath%>/teacher/uppass.do?username=${sessionScope.teachersession.username}">
                        <i class="fa fa-gear fa-fw"></i> 更改密码</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="<%=basePath%>/teacher/logout.do"><i class="fa fa-sign-out fa-fw"></i> 退出</a>
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
                                <a href="<%=basePath%>/tea_tk/tea_findallchoice.do">选择题查询</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/tea_tk/alljudge.do">判断题查询</a>
                            </li>
                            <%--<li>--%>
                            <%--<a href="<%=basePath%>/tea_tk/tea_allReadFill.do">程序填空查询</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                            <%--<a href="<%=basePath%>/tea_tk/tea_allReadProgram.do">读程序写结果查询</a>--%>
                            <%--</li><li>--%>
                            <%--<a href="<%=basePath%>/tea_tk/allPgDesign.do">程序设计查询</a>                        </li>--%>

                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href=""><i class="fa fa-table fa-fw"></i>考试<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=basePath%>/exam/examall.do">查看考试信息</a>
                            </li>
                            <li>
                                <a href=<%=basePath%>/exam/addexam.do>创建新考试</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>学生<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=basePath%>/teacher/stuinfo.do">学生信息查询</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/teacher/findstuscore.do">学生成绩查询</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>

    <!-- Page Content -->
    <div id="page-wrapper">
        <br>
        <h2>数据导入：</h2>
        <br>

        &nbsp;&nbsp;&nbsp;
        <div class="form-group" style="width: 10%; margin: 0px ;display: inline" >
            <label style="font-size: large" > 入学时间：</label>
            <select class="form-control" style="width: 10% ;margin: 0px ;display: inline " id="semester">
                <<option>--学年选择--</option>
            </select>
        </div>
        &nbsp;&nbsp;&nbsp;
        <div class="form-group" style="width: 10%; margin: 0px ;display: inline" >
            <label style="font-size: large">专业：</label>
            <select class="form-control" style="width: 10% ;margin: 0px ;display: inline " id="major">
                <option>--专业选择--</option>
            </select>
        </div>
        &nbsp;&nbsp;&nbsp;
        <div class="form-group" style="width: 10%; margin: 0px ;display: inline" >
            <label style="font-size: large">班级：</label>
            <select class="form-control" style="width: 10% ;margin: 0px ;display: inline " id="class">
                <option>--班级选择--</option>
            </select>
        </div>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <button class="btn btn-outline btn-primary" onclick="search()" id="btn">确定</button>
           &nbsp;&nbsp;&nbsp;&nbsp;
           <button class="btn btn-outline btn-primary" data-toggle="modal" data-target="#myModa_n">添加</button>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <form style="margin:0px;display:inline;"  action="<%=basePath%>/student/ajaxUpload.do" method="post" enctype="multipart/form-data">
                <input style="display: inline" id="file" type="file" name="file"/>
                <input style="display: inline ; width: 5%" type="submit" name="submit" id="submit" value="上传" />
            </form>
        <br>


        <!-- 信息上传 -->
        <div>
            <table class="table table-striped" style="width: 90%" align="center" id="test" >
                <caption></caption>
                <thead>
                <tr>
                    <th id="num">学号</th>
                    <th>姓名</th>
                     <th>密码</th>
                     <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
        <!-- 编辑的模态框 -->
        <div class="modal fade" id="stuedit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="Label">编辑</h4>
                    </div>
                    <form class="form-horizontal">
                        <div class="modal-body">
                            <input name="num" id="upnum" hidden="hidden"/>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-10">
                                    <input type="text" name="username" class="form-control" id="username"
                                           placeholder="数字或英语">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-10">
                                    <input type="text" name="password" class="form-control" id="password"
                                           placeholder="数字或英语">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="submit" class="btn btn-primary" id="editbtn">保存</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%--添加模态框--%>
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
                                <form action="<%=basePath%>/student/creatstu.do" method="post">
                                    <div class="modal-body" style="text-align:left">
                                        <div class="form-group input-group">
                                            <span class="input-group-addon" style="height: 40px ; tab-size: 16px">请输入班级：</span>
                                            <input type="text" style="height: 40px " class="form-control" name="classname" id="classname">
                                        </div>
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
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="<%=basePath%>/vendor/jquery/jquery.min.js"></script>
<script src="<%=basePath%>/vendor/bootstrap/js/bootstrap.min.js"></script>

<script src="<%=basePath%>/vendor/metisMenu/metisMenu.min.js"></script>
<script src="<%=basePath%>/vendor/dist/js/sb-admin-2.js"></script>

</body>
<script>
    function search(){
        $("#btn").click(function() {//清除table
            $("#test tbody").html("");
        });
        var options=$("#class option:selected");
        classname = options.text();
        $.ajax({
            type: "POST",
            cache: false,
            url: "${APP_PATH}/student/byclassname.do",
            data: {"classname": classname},
            dataType: "json",
            success: function (data) {
                var tempHtml = "";
                  for(var i = 0;i < data.length;i++){
                      id=data[i].id;
                      var destu = "<a href=\"javascript:void(0)\" onclick=\"removeTr(this)\">删除</a>";
                      var edit = "<a href=\"javascript:void(0)\" onclick=\"editTr(this)\">编辑</a>";
                      tempHtml += "<tr class=\"myclass\"><td id='num'>"+data[i].num+"</td><td>" + data[i].username+"</td><td>"+ data[i].password+ "</td><td>"+
                          destu + "&nbsp;"+edit+"</td></tr>";
                  }
                $("table").append(tempHtml);
            }
        });
    }
    function removeTr(obj) {
        var tr= $(obj).parent().parent();
        var num=$(obj).parent().parent().children("td").get(0).innerHTML;
        <%--location.href = "<%=basePath%>/student/detelestu.do?num="+num;--%>
        $.ajax({
        url: '<%=basePath%>/student/detelestu.do?num='+ num,
        type: 'POST',
        success: function (data) {
            tr.remove();
             }
        });

    }
    // 编辑信息的方法
    function editTr(obj) {
        var num=$(obj).parent().parent().children("td").get(0).innerHTML;
        var name=$(obj).parent().parent().children("td").get(1).innerHTML;
        var psw=$(obj).parent().parent().children("td").get(2).innerHTML;
        //alert("num = " + num + "name = " + name +"psw = " + psw);
                    $("#upnum").val(num);
                     $("#username").val(name);
                    $("#password").val(psw);
                    $("#stuedit").modal('show');
    }
    $("#editbtn").click(function(){
        alert($("#stuedit form").serialize())//序列化form上的数据
        $.ajax({
            url:"<%=basePath%>/student/upstu.do",
            type:"POST",
            data:$("#stuedit form").serialize(),
            success:function(data) {
                $("#addp2").modal('hide');
            }
        });
    });
    $(function() {
        $.ajax({
            type: "POST",
            cache: false,
            url: "${APP_PATH}/basic/findall.do",
            data: {"pid": 0},
            dataType: "json",
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    $("#semester").append("<option value='" + data[i].seid + "'>" + data[i].sename + "</option>");
                }
            }
        });
        $("#semester").change(function(){
            var seid=$(this).val();
            $.ajax({
                type:"POST",
                cache:false,
                url:"${APP_PATH}/basic/findmaall.do",
                data:{"seid":seid},
                dataType:"json",
                success:function(data){
                    $("#major option").remove();
                    $("#class option").remove();
                    $("#class").append("<option>" + "--班级选择--"+ "</option>");
                    $("#major").append("<option>" + "--专业选择--"+ "</option>");
                    for (var i = 0; i < data.length; i++) {
                        $("#major").append("<option value='" + data[i].maid + "'>" + data[i].maname + "</option>");
                    }
                }
            });
        });
        $("#major").change(function(){
            var maid=$(this).val();
            $.ajax({
                type:"POST",
                cache:false,
                url:"${APP_PATH}/basic/findciall.do",
                data:{"maid":maid},
                dataType:"json",
                success:function(data){
                    //追加本机option前，先清除city和county的option，以免重选时干扰
                    $("#class option").remove();
                    $("#class").append("<option>" + "--班级选择--"+ "</option>");
                    for (var i = 0; i < data.length; i++) {
                        $("#class").append("<option value='" + data[i].cid + "'>" + data[i].cname + "</option>");
                    }
                }
            });
        });
    });

</script>
</html>
