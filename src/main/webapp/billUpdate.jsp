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
                <li><a href="<%=path%>/ProviderServlet?action=list">供应商管理</a></li>
                <li><a href="<%=path%>/UserServlet?action=list">用户管理</a></li>
                <li><a href="<%=path%>/password.jsp">密码修改</a></li>
                <li><a href="<%=path%>/UserServlet?action=logout">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>账单管理页面 >> 订单添加页面</span>
        </div>
        <div class="providerAdd">
            <form action="<%=path%>/BillServlet?action=updates" method="post">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="providerId">订单编码：</label>
                    <input type="text" name="providerId" id="providerId" placeholder="322" value="${item.billCode}"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="providerName">商品名称：</label>
                    <input type="text" name="providerName" id="providerName" placeholder="123"  value="${item.productName}"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="people">商品单位：</label>
                    <input type="text" name="people" id="people" placeholder="北极"  value="${item.productUnit}"/>
                    <span>*</span>

                </div>
                <div>
                    <label for="phone">商品数量：</label>
                    <input type="text" name="phone" id="phone" placeholder="22"  value="${item.productCount}"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="address">总金额：</label>
                    <input type="text" name="address" id="address" placeholder="200"  value="${item.totalPrice}"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="fax">供应商：</label>
                    <input type="text" name="fax" id="fax" placeholder="北大"  value="${item.pro.proName}"/>
                    <span>*</span>
                </div>
                <div>
                    <label >是否付款：</label>
                    <input type="radio" name="zhifu" value="1" checked/>未付款
                    <input type="radio" name="zhifu" value="2"/>已付款
                </div>
                <div class="providerAddBtn">
                    <input type="submit" value="保存" />
                    <input type="button" value="返回" onclick="history.back(-1)"/>
                </div>
            </form>
        </div>

    </div>
</section>
<footer class="footer">
    版权归北大青鸟
</footer>
<script src="js/time.js"></script>

</body>
</html>