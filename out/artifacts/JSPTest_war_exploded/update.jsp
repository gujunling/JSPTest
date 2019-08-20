<%--
  User: ling
  Date: 2019/8/18
  Time: 9:00
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
    <head>
        <!-- 指定字符集 -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>修改用户</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/jquery-2.1.0.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

    </head>
    <body>
        <div class="container" style="width: 400px;">
            <h3 style="text-align: center;">修改用户信息</h3>
            <form action="${pageContext.request.contextPath}/updateUserServlet" method="post">

                <%--隐藏域，获取用户id ,必须在form表单中，可以在form表单中的任意位置--%>
                <input type="hidden" name="id" value="${user.id}">

                <div class="form-group">
                    <label for="name">姓名：</label>
                    <input type="text" class="form-control" id="name" name="name" value="${user.name}"
                           readonly="readonly" placeholder="请输入姓名"/>
                </div>

                <div class="form-group">
                    <label>性别：</label>
                    <c:if test="${user.gender == '男'}">
                        <input type="radio" name="gender" value="男" checked/>男
                        <input type="radio" name="gender" value="女"/>女

                    </c:if>
                    <c:if test="${user.gender == '女'}">
                        <input type="radio" name="gender" value="男"/>男
                        <input type="radio" name="gender" value="女" checked/>女

                    </c:if>
                </div>

                <div class="form-group">
                    <label for="age">年龄：</label>
                    <input type="text" class="form-control" id="age" name="age" value="${user.age}"
                           placeholder="请输入年龄"/>
                </div>

                <div class="form-group">
                    <label for="address">籍贯：</label>
                    <select id="address" name="address" class="form-control">

                        <c:if test="${user.address == '河南'}">

                            <option value="河南" selected>河南</option>
                            <option value="广东">广东</option>
                            <option value="广西">广西</option>
                            <option value="湖南">湖南</option>

                        </c:if>

                        <c:if test="${user.address == '广东'}">
                            <option value="河南">河南</option>
                            <option value="广东" selected>广东</option>
                            <option value="广西">广西</option>
                            <option value="湖南">湖南</option>

                        </c:if>

                        <c:if test="${user.address == '广西'}">
                            <option value="河南">河南</option>
                            <option value="广东">广东</option>
                            <option value="广西" selected>广西</option>
                            <option value="湖南">湖南</option>

                        </c:if>

                        <c:if test="${user.address == '湖南'}">
                            <option value="河南">河南</option>
                            <option value="广东">广东</option>
                            <option value="广西">广西</option>
                            <option value="湖南" selected>湖南</option>

                        </c:if>

                    </select>
                </div>

                <div class="form-group">
                    <label for="qq">QQ：</label>
                    <input id="qq" type="text" class="form-control" name="qq" value="${user.qq}" placeholder="请输入QQ号码"/>
                </div>

                <div class="form-group">
                    <label for="email">Email：</label>
                    <input id="email" type="text" class="form-control" name="email" value="${user.email}"
                           placeholder="请输入邮箱地址"/>
                </div>

                <div class="form-group" style="text-align: center">
                    <input class="btn btn-primary" type="submit" value="提交"/>
                    <input class="btn btn-default" type="reset" value="重置"/>
                   <%-- <input class="btn btn-default" type="button" value="返回"/>--%>
                    <a class="btn btn-default btn-sm"
                       href="javascript:history.go(-1)">返回
                    </a>
                </div>

            </form>
        </div>
    </body>
</html>
