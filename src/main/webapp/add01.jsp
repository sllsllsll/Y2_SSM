<%--
  Created by IntelliJ IDEA.
  User: linlin
  Date: 2017/9/1
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jQuery1.11.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
<script type="text/javascript">

    $(function () {
        $("#classidd").blur(function () {
            var nickname=$(this).val();
            if(nickname==""){
             alert('分类是空')
            }

        });

        $("#titleid").blur(function () {
            var dd=$(this).val();
            if(dd==""){
                alert('标题是空')
            }

        });

        $("#conid").blur(function () {
            var ss=$(this).val();
            if(ss==""){
                alert('内容是空')
            }

        });
    })
</script>
<html>
<head>
    <title>添加</title>
</head>
<body>
<h1>添加常见问题</h1>
<form method="post" action="<%=path%>/addList">
分类：  <select name="classid" id="classidd" >
    <c:forEach items="${listclass}" var="iteme">
        <option>请选择</option>
        <option value="${iteme.id}">${iteme.cname}</option>
    </c:forEach>
</select>
标题:<input name="title" id="titleid"/>
内容：<input name="content" id="conid"/>
<input type="submit" value="保存"/>
</form>
</body>
</html>
