<%--
  Created by IntelliJ IDEA.
  User: linlin
  Date: 2017/9/1
  Time: 13:38
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
    <title>显示所有</title>
    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.min.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jQuery1.11.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
    <script type="text/javascript">

        window.onload = function () {
            var otab = document.getElementById('mytable');
            var thiscolor = '';
            for (var i = 0; i < otab.tBodies[0].rows.length; i++) {
                otab.tBodies[0].rows[i].onmouseover = function () {
                    thiscolor = this.style.background;
                    this.style.background = '#00FFFF';
                };
                otab.tBodies[0].rows[i].onmouseout = function () {
                    this.style.background = thiscolor;
                };
                if (i % 2) {
                    otab.tBodies[0].rows[i].style.background = '';
                }
                else {
                    otab.tBodies[0].rows[i].style.background = '#FFFF00';
                }
            }
        };
        $(function () {

            function  aa(name) {

                $.ajax({
                    url:"${pageContext.request.contextPath}/first?title="+name,
                    type:"get",
                    async:false,
                    success:function (data) {
                      //  alert(data.length);
                        $("#mytable").html('');
                        var html;
                        if(data.length>0){
                            html=" <tr> <td>编号</td><td>标题</td><td>分类</td><td>创建时间</td></tr>";
                            $.each(data,function (i,dom) {
                                html+='<tr><td>'+dom.id+'</td><td><a  href="<%=path%>/ListViews?title='+dom.title+'">'+dom.title+ '</a></td><td>'+dom.cla.cname+'</td><td>'+dom.createdate+'</td></tr>';

                            })
                        }else{
                         var qq=$("#mytext").val();
                            html="<h2>没有找到";
                            html+=qq;
                            html+="相关的内容</h2>";
                            html+="<h2>请修改关键字后重试</h2>"
                        }


                        $("#mytable").append(html);

                    }
                });
                $("#mytable tr:even").css("background","pink");
            }
            aa("");

            $("#mybtn").click(function () {
                var name=$("#mytext").val();
                aa(name);
            });

        })


    </script>
</head>
<body>
<h1>常见问题检索</h1>
<form method="post" action="<%=path%>/ListLikeA">
请输入查询关键字:<input  name="title" id="mytext"/>
  <%--  <input type="submit" value="查询" />--%>
    <input type="button" value="查询" id="mybtn"/>
</form>
<a id="names"></a>
<a href="<%=path%>/classIDName">添加常见问题</a>
<table id="mytable" align="center">
  <%--  <tr>
        <td width="10%">编号</td>
        <td width="20%">标题</td>
        <td width="10%">分类</td>
        <td width="10%">创建时间</td>
    </tr>
    <c:forEach items="${listL}" var="item">
    <tr>
        <td width="10%">${item.id}</td>
        <td width="20%" name="title"><a  href="<%=path%>/ListViews?title=${item.title}">${item.title}</a></td>
        <td width="10%">${item.cla.cname}</td>
        <td width="10%">${item.createdate}</td>
    </tr>
    </c:forEach>--%>
</table>
</body>
</html>
