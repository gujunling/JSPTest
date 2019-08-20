<%--
  User: ling
  Date: 2019/8/17
  Time: 15:26
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
    <head>
        <!-- 指定字符集 -->
        <meta charset="utf-8">
        <!-- 使用Edge最新的浏览器的渲染方式 -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
        width: 默认宽度与设备的宽度相同
        initial-scale: 初始的缩放比，为1:1 -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
        <title>用户信息管理系统</title>

        <!-- 1. 导入CSS的全局样式 -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
        <script src="js/jquery-2.1.0.min.js"></script>
        <!-- 3. 导入bootstrap的js文件 -->
        <script src="js/bootstrap.min.js"></script>
        <style type="text/css">
            td, th {
                text-align: center;
            }
        </style>

        <script>
            function deleteUser(id) {

                if (confirm("您确定要删除吗？删除后信息将不能找回")) {

                    location.href = "${pageContext.request.contextPath}/delUserServlet?id=" + id;

                    alert("信息已删除");
                }
            }

            window.onload = function () {
                //给删除选中按钮添加单击事件
                document.getElementById("delselected").onclick = function () {

                    if (confirm("您确定要删除这些数据吗？")) {

                        var flag = false;
                        //判断是否有选中条目
                        var cbs = document.getElementsByName("uid");
                        //遍历
                        for (var i = 0; i < cbs.length; i++) {
                            if (cbs[i].checked) {
                                //至少有一个条目被选中了
                                flag = true;
                                break;
                            }
                        }
                        if (flag) {
                            //表单提交
                            document.getElementById("formdelsel").submit();
                        }
                    }

                }
                //获取第一个CheckBox
                document.getElementById("firstChb").onclick = function () {
                    //获取下面列表中所有的CheckBox
                    var cbs = document.getElementsByName("uid");
                    //遍历
                    for (var i = 0; i < cbs.length; i++) {
                        //设置这些cbs[i]的checked状态 = firstChb
                        cbs[i].checked = this.checked;
                    }
                }
            }

            function close() {
                location.href = "${pageContext.request.contextPath}/login.jsp";

            }
        </script>

    </head>
    <body>
        <div style="color: darkorchid;text-align: center;font-size: 30px">${user.name},欢迎您</div>

        <div style="color: red; float: right ;margin-right: 120px ;font-size: 20px;">
            <a class="btn btn-warning "
               href="javascript:close(0);">退出系统
            </a>
        </div>

        <div class="container">
            <h3 style="text-align: center">用户信息列表</h3>

            <div style="float: left;margin: 5px">
                <form class="form-inline" action="${pageContext.request.contextPath}/findUserByPageServlet"
                      method="post">
                    <div class="form-group">
                        <label for="exampleInputName2">姓名</label>
                        <input type="text" name="name" class="form-control" value="${condition.name[0]}"
                               id="exampleInputName2" placeholder="请输入姓名">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputAddress2">籍贯</label>
                        <input type="text" name="address" class="form-control" value="${condition.address[0]}"
                               id="exampleInputAddress2" placeholder="请输入籍贯">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail2">Email</label>
                        <input type="email" name="email" class="form-control" value="${condition.email[0]}"
                               id="exampleInputEmail2" placeholder="请输入邮箱">
                    </div>
                    <button type="submit" class="btn btn-default">查询</button>
                </form>
            </div>

            <div style="float: right;margin : 5px">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/add.jsp">添加新用户</a>
                <a class="btn btn-primary" href="javascript:void(0);" id="delselected">批量删除</a>
            </div>
            <form id="formdelsel" action="${pageContext.request.contextPath}/delSelectedServlet" method="post">
                <table border="1" class="table table-bordered table-hover">
                    <tr class="success">
                        <th><input type="checkbox" id="firstChb"></th>
                        <th>编号</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>籍贯</th>
                        <th>QQ</th>
                        <th>邮箱</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pb.list}" var="user" varStatus="s">
                        <tr>
                            <td><input type="checkbox" name="uid" value="${user.id}"></td>
                            <td>${s.count}</td>
                            <td>${user.name}</td>
                            <td>${user.gender}</td>
                            <td>${user.age}</td>
                            <td>${user.address}</td>
                            <td>${user.qq}</td>
                            <td>${user.email}</td>
                            <td><a class="btn btn-default btn-sm"
                                   href="${pageContext.request.contextPath}/findUserServlet?id=${user.id}">修改
                            </a>&nbsp;
                                <a class="btn btn-default btn-sm"
                                   href="javascript:deleteUser(${user.id});">删除
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </form>
            <div>
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <c:if test="${pb.currentPage == 1}">
                        <li class="disabled">
                            </c:if>
                            <c:if test="${pb.currentPage != 1}">
                        <li>
                            </c:if>

                            <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage - 1}&rows=5&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}"
                               aria-label="Previous">
                                <span aria-hidden="true">上一页</span>
                            </a>
                            <%--注意，在&rows=5&name中，5&name之间不能有空格，有空格的话，字符串"5"不能转化为int类型--%>
                        </li>

                        <c:forEach begin="1" end="${pb.totalPage}" var="i">
                            <c:if test="${pb.currentPage == i}">

                                <li class="active">
                                    <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&rows=5&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}">${i}</a>
                                </li>

                            </c:if>
                            <c:if test="${pb.currentPage != i}">

                                <li>
                                    <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&rows=5&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}">${i}</a>
                                </li>

                            </c:if>
                        </c:forEach>
                        <c:if test="${pb.currentPage == pb.totalPage}">
                        <li class="disabled">
                            </c:if>
                            <c:if test="${pb.currentPage != pb.totalPage}">
                        <li>
                            </c:if>
                            <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage + 1}&rows=5&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}"
                               aria-label="Next">
                                <span aria-hidden="true">下一页</span>
                            </a>
                        </li>
                        <span style="font-size: 25px;margin-left: 5px">
                            共${pb.totalCount}条记录，共${pb.totalPage}页
                        </span>
                    </ul>
                </nav>

            </div>

        </div>
    </body>
</html>

