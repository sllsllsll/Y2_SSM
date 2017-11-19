<%--
  Created by IntelliJ IDEA.
  User: linlin
  Date: 2017/7/12
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>超市账单管理系统</h1>

    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b">${username}</span> , 欢迎你！</p>
        <a href="login.html">退出</a>
    </div>
</header>
<!--时间-->
<section class="publicTime">
    <span id="time">2015年1月1日 11:11  星期一</span>
    <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
</section>
<!--主体内容-->
<section class="publicMian ">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li id="active"><a href="<%=path%>/BillServlet?action=list">账单管理</a></li>
                <li ><a href="<%=path%>/ProviderServlet?action=list">供应商管理</a></li>
                <li><a href="<%=path%>/UserServlet?action=list">用户管理</a></li>
                <li><a href="<%=path%>/password.jsp">密码修改</a></li>
                <li><a href="<%=path%>/UserServlet?action=logout">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>账单管理页面 >> 信息查看</span>
        </div>
        <div class="providerView">
            <p><strong>订单编号：</strong><span>${item.billCode}</span></p>
            <p><strong>商品名称：</strong><span>${item.productName}</span></p>
            <p><strong>商品单位：</strong><span>${item.productUnit}</span></p>
            <p><strong>商品数量：</strong><span>${item.productCount}</span></p>
            <p><strong>总金额：</strong><span>${item.totalPrice}</span></p>
            <p><strong>供应商：</strong><span>${item.pro.proName}</span></p>
            <p><strong>是否付款：</strong>
                <c:if test="${item.isPayment eq 1}">
            <span align="center">未付款</span>
            </c:if>
            <c:if test="${selectIdBill.isPayment eq 2}">
                <span align="center">已付款</span>
            </c:if></p>

            <a href="billList.html">返回</a>
        </div>
    </div>
</section>
<footer class="footer">
    版权归北大青鸟
</footer>
<script src="js/time.js"></script>

</body>
</html>
