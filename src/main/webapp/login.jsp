<%--
  Created by IntelliJ IDEA.
  User: linlin
  Date: 2017/7/12
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"  %>
<%@ page import="java.util.Date" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>系统登录 - 超市账单管理系统</title>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body class="login_bg">
<section class="loginBox">
    <header class="loginHeader">
        <h1>超市账单管理系统</h1>
    </header>
    <section class="loginCont">
        <form class="loginForm" action="<%=path%>/islogin" method="post">
            <div class="inputbox">
                <label for="user">用户名：</label>
                <input id="user" type="text" name="userCode" value="1" placeholder="请输入用户名" required/>
            </div>
            <div class="inputbox">
                <label for="mima">密码：</label>
                <input id="mima" type="password" name="userPassword" value="1" placeholder="请输入密码" required/>
            </div>
            <div class="subBtn">
                <input type="submit" value="登录" />
                <input type="reset" value="重置"/>
            </div>
        </form>
    </section>
</section>

</body>
</html>