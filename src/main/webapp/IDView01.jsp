<%--
  Created by IntelliJ IDEA.
  User: linlin
  Date: 2017/9/1
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>查看信息</title>
</head>
<br>
<h1>常见问题检索</h1>
分类：${listf.cla.cname}<br/>
    添加时间：${listf.createdate}<br/>
    标题：${listf.title}<br/>
    内容：${listf.content}<br/>
</body>
</html>
