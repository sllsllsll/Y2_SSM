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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jQuery1.11.1.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
    <%--  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
/*
        /!**
         * Ajax分页显示
         *!/
        jQuery.noConflict();
        jQuery(function ($) {
            load(0);
            function load(index) {
                $.ajax({
                    url: "/billLimits",
                    type: "POST",
                    dataType:'JSON',
                    data: {"pageIndex": index},
                    success: function (data) {
                        $("#list-content").html('');
                        $.each(data.listbill, function (i, dom) {
                            alert(dom.totalPrice);
                            $('#list-content').append('<tr></td>' + '<td>' + dom.billCode + '</td><td>' + dom.productName + '</td><td>' + dom.pro.proName +
                                '</td><td>' + dom.totalPrice + '</td><td>' + dom.isPayment + '</td>' + '<td>' + dom.creationDate +
                                '</td><td><a href="/userViewId?id=' + dom.id + '">'
                                + '<img src="img/read.png" alt="查看" title="查看">' + '</a>' + '<a href="/userUpdateId?id="><img src="img/xiugai.png" alt="修改" title="修改"/></a>'
                                + '<a href="/userdel?id=" ><img src="img/schu.png" alt="删除" title="删除"/></a>' + '<tr>')
                        });
                        //渲染页面
                        $('#pagination').pagination(data.pagetotalpages, {
                            current_page: index, //当前页索引
                            items_per_page: data.pagesize,//每页记录数
                            num_display_entries: 4, //显示页码块数量
                            callback: load,
                            load_first_page: true,
                            prev_text: 'Previous',
                            next_text: 'Next'
                        })
                    }
                })
            }
        })
*/

/*
//模糊查询
$("#btnSelect").click(function () {
    load(0);
});
$("[name=userName]").keyup(function (event) {
    if(event.keyCode==13){
        $("#btnSelect").focus();
    }
});

//加载数据
load(0,2);
function  load(index,pageSize) {
    $.ajax({
        url:"/selectUser",
        type:"post",
        data:{"pageIndex":index,"pageSize":pageSize,"productName":$("[name=productName]").val()},
        "productUnit":$("[name=productUnit]").val(),"isPayment":$("[name=isPayment]").val(),
        success:function (data) {
            //pageUtil
            //模拟ajax去后端读取页数，获取数据并渲染列表的过程
            $('#list-content').html('');
            $.each(data.listbill,function (i,dom) {
                $('#list-content').
                append('<tr><td><input type="checkbox" name="id" value="'+dom.billCode+'"/></td><td>' + dom.billCode + '</td><td>' + dom.pro.proName +
                '</td><td>' + dom.totalPrice + '</td><td>' + dom.isPayment + '</td>' + dom.productName +'</td><td>' + dom.creationDate +'</td></tr>');
            });
            //渲染分页
            if(data.totalPages>0){
                $('#pagination').pagination({
                    total:data.pagetotalpages,//总记录数
                    pageSize:pageSize,//页面大小
                    pageNumber:index+1,//当前页码
                    pageList: [2, 5, 15, 20], //5表示页显示5条数据。10条是每页显示10条数据  15表示每页显示15条数据， g20表示每页显示20条数据
                    onSelectPage:function(pageNumber,pageSize){
                        load(pageNumber-1,pageSize);
                    }
                });
                /!* $('#pagination').pagination(data.totalRecords, {
                 current_page : index, //当前页索引
                 items_per_page : data.pageSize, //每页记录数
                 num_display_entries :3, //显示页码块数量
                 callback :load,
                 ellipse_text:"...",
                 num_edge_entries:2,
                 load_first_page : true,
                 prev_text : 'Previous',
                 next_text : 'Next'
                 });*!/
            }else{
                $('#pagination').html("<span style='color:red;font-size: 18px'>没有检索到结果~~~~~！！！！！！</span>");
            }


        }
    });
}
//带条件查询
function  load2(index) {
    var userName=$("[name=userName]").val();
    $.ajax({
        url:"/selectUser",
        type:"post",
        data:{"pageIndex":index,"userName":userName},
        success:function (data) {
            //pageUtil
            //模拟ajax去后端读取页数，获取数据并渲染列表的过程
            $('#list-content').html('');
            $.each(data.list,function (i,dom) {
                $('#list-content').
                append('<tr><td><input type="checkbox"/></td><td>' + dom.userCode + '</td><td>' + dom.userName +'</td><td>' + (dom.gender===1?"男":"女") +'</td><td>' + jsGetAge(dom.birthday) +'</td><td>' + dom.phone +'</td><td>' + dom.userType + '</td></tr>');
            });
            //渲染分页

            $('#pagination').pagination(data.totalRecords, {
                current_page: index, //当前页索引
                items_per_page: data.pageSize, //每页记录数
                num_display_entries: 3, //显示页码块数量
                callback: load2,
                ellipse_text: "...",
                num_edge_entries: 2,
                load_first_page: true,
                prev_text: 'Previous',
                next_text: 'Next'
            });

        }
    });
}



});
*/




    </script>
        </head>
<body>
<header class="publicHeader">
    <h1>超市账单管理系统</h1>
    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> ${username}</span> , 欢迎你！</p>
        <a href="login.html">退出</a>
    </div>
</header>
<section class="publicTime">
    <span id="time">2015年1月1日 11:11  星期一</span>
    <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
</section>
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
            <span>账单管理页面</span>
        </div>
        <div class="search">
   <form  method="post" action="<%=path%>/userLikeNameLimit">
            <span>商品名称：</span>
            <input type="text" name="productName" id="productNames" placeholder="请输入商品的名称"/>
            <span>供应商：</span>
            <select name="productUnit" id="productUnits">
                <option value="">--请选择--</option>
                <c:forEach items="${list}" var="item">
                <option value="${item.productUnit}">${item.productUnit}</option>
                </c:forEach>
            </select>
            <span>是否付款：</span>
            <select name="isPayment" id="isPayments">
                <option value="">--请选择--</option>
                <option value="2">已付款</option>
                <option value="1">未付款</option>
            </select>
<input type="submit" value="查询"/>
      <%-- <input type="button" value="查询" onclick="getinfo()"/>--%>
     </form>

            <a href="<%=path%>/billAdd.jsp">添加订单</a>

        </div>
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">账单编码</th>
                <th width="20%">商品名称</th>
                <th width="10%">供应商</th>
                <th width="10%">账单金额</th>
                <th width="10%">是否付款</th>
                <th width="10%">创建时间</th>
                <th width="30%">操作</th>
            </tr>
            <tbody id="list-content"></tbody>
<c:forEach var="item" items="${Page.listbill}">
            <tr>
                <td>${item.billCode}</td>
                <td>${item.productName}</td>
                <td>${item.pro.proName}</td>
                <td>${item.totalPrice}</td>
                <c:if test="${item.isPayment eq 1}">
                    <td align="center">未付款</td>
                </c:if>
                <c:if test="${item.isPayment eq 2}">
                    <td align="center">已付款</td>
                </c:if>
                <td>${item.creationDate}</td>
                <td>
                    <a href="<%=path%>/billLimit?id=${item.id}"><img src="img/read.png" alt="查看" title="查看"/></a>
                    <a href="<%=path%>/billLimit?id=${item.id}"><img src="img/xiugai.png" alt="修改" title="修改"/></a>
                    <a href="<%=path%>/billLimit?id=${item.id}" class="removeBill"><img src="img/schu.png" alt="删除" title="删除"/></a>
                </td>
            </tr>
</c:forEach>
        </table>
        <div style="text-align: center">
            <a href="<%=path%>/billLimit?pageindex=1">首页</a> &nbsp;&nbsp;&nbsp;
            当前页:[${Page.pageindex} / ${Page.pagetotalpages}] &nbsp;&nbsp;&nbsp;
            <a href="<%=path%>/billLimit?pageindex=${Page.pageindex-1}">上一页</a> &nbsp;&nbsp;&nbsp;
            <a href="<%=path%>/billLimit?pageindex=${Page.pageindex+1}">下一页</a> &nbsp;&nbsp;&nbsp;
            <a href="<%=path%>/billLimit?pageindex=${Page.pagetotalpages}">尾页</a>
        </div>
        </table>
    </div>
</section>

<div class="zhezhao"></div>
<div class="remove" id="removeBi">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该订单吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<footer class="footer">
    版权归北大青鸟
</footer>

<script src="js/jquery.js"></script>
<script src="js/js.js"></script>
<script src="js/time.js"></script>

</body>
</html>
