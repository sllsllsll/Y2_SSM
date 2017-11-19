<%--
  Created by IntelliJ IDEA.
  User: linlin
  Date: 2017/7/12
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.min.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jQuery1.11.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
    <script type="text/javascript">

        $(function () {
            $("#btn").click(function () {
                var str=$('#yourformid').serialize();
              //  alert(str);
                $.ajax({
                    type:"POST",
                    url:"${pageContext.request.contextPath}/userupdateUser",
                    data:str,
                    success:function(data) {
                        if(data!=1){
                            alert("修改成功！")
                        }else{
                            alert("修改失败！")
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>超市账单管理系统</h1>

    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> ${username}</span> , 欢迎你！</p>
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
                <li><a href="<%=path%>/BillServlet?action=list">账单管理</a></li>
                <li><a href="<%=path%>/ProviderServlet?action=list">供应商管理</a></li>
                <li id="active"><a href="<%=path%>/UserServlet?action=list">用户管理</a></li>
                <li><a href="<%=path%>/password.jsp">密码修改</a></li>
                <li><a href="<%=path%>/UserServlet?action=logout">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户修改页面</span>
        </div>
        <div class="providerAdd">
            <form <%--method="post" action="<%=path%>/userupdateUser?id=${UpdateById.id}"--%> id="yourformid" action="#">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div>
                    <label for="userName">用户名称：</label>
                    <input type="text" name="userName" id="userName" value="${UpdateById.userName}"/>
                    <span>*</span>
                </div>

                <div>
                    <label>用户性别：</label>
                    <select name="gender">
                        <c:if test="${UpdateById.gender eq 2}">
                            <option value="2" selected>男</option>
                        </c:if>
                        <c:if test="${UpdateById.gender eq 1}">
                            <option value="1" selected>女</option>
                        </c:if>
                        <option value="2">男</option>
                        <option value="1">女</option>
                    </select>

                </div>
                <div>
                    <label for="data">出生日期：</label>
                    <input type="text" name="birthday" id="data"
                           value="${UpdateById.birthday}"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="userphone">用户电话：</label>
                    <input type="text" name="phone" id="userphone"
                           value="${UpdateById.phone}"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="userAddress">用户地址：</label>
                    <input type="text" name="address" id="userAddress"
                           value="${UpdateById.address}"/>
                </div>

                <div>
                    <label>用户类别：</label>
                    <input type="radio" value="2" name="userRole"/>管理员
                    <input type="radio" value="1" name="userRole" checked/>经理
                </div>
                <div class="providerAddBtn">
                  <%--  <input type="submit" value="保存"/>--%>
                    <input type="button" id="btn" value="修改"/>
                    <input type="button" value="返回"/>
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
