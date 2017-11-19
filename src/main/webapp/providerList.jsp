<%--
  Created by IntelliJ IDEA.
  User: linlin
  Date: 2017/7/12
  Time: 16:54
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
                url:"/getProInfo",
                type:"post",
                data:{"pageIndex":index,"pageSize":pageSize,},
                success:function (data) {
                    alert(data)
                    //pageUtil
                    //模拟ajax去后端读取页数，获取数据并渲染列表的过程
                    $('#list-content').html('');
                    $.each(data.list,function (i,dom) {
                        alert(dom.proName)
                        $('#list-content').
                        append('<tr><td><input type="checkbox" name="id" value="'+dom.proCode+'"/></td><td>' + dom.proCode + '</td><td>' + dom.proName +'</td><td>' + dom.proContact+'</td><td>' + dom.proPhone +'</td><td>' + dom.proFax +'</td><td>' + dom.creationDate + '</td></tr>');
                    });
                    //渲染分页
                    if(data.totalPages>0){
                        $('#pagination').pagination({
                            total:data.pagetotalpages,//总记录数
                            pageSize:pageSize,//页面大小
                            pageNumber:index+1,//当前页码
                            pageList: [2, 5, 15, 20], //5表示页显示5条数据。10条是每页显示10条数据  15表示每页显示15条数据，20表示每页显示20条数据
                            onSelectPage:function(pageNumber,pageSize){
                                load(pageNumber-1,pageSize);
                            }
                        });
                        /* $('#pagination').pagination(data.totalRecords, {
                         current_page : index, //当前页索引
                         items_per_page : data.pageSize, //每页记录数
                         num_display_entries :3, //显示页码块数量
                         callback :load,
                         ellipse_text:"...",
                         num_edge_entries:2,
                         load_first_page : true,
                         prev_text : 'Previous',
                         next_text : 'Next'
                         });*/
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
                url:"/selectPro",
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



        };

    </script>
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
                <li><a href="<%=path%>/BillServlet?action=list">账单管理</a></li>
                <li id="active"><a href="<%=path%>/ProviderServlet?action=list">供应商管理</a></li>
                <li><a href="<%=path%>/UserServlet?action=list">用户管理</a></li>
                <li><a href="<%=path%>/password.jsp">密码修改</a></li>
                <li><a href="<%=path%>/UserServlet?action=logout">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>供应商管理页面</span>
        </div>
        <div class="search">
            <form method="post" action="<%=path%>/ProviderServlet?action=like">
            <span>供应商名称：</span>

            <input type="text" name="likename" placeholder="请输入供应商的名称"/>
            <input type="submit" value="查询"/>
            <a href="providerAdd.html">添加供应商</a>
        </form>
        </div>
        <!--供应商操作表格-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">供应商编码</th>
                <th width="20%">供应商名称</th>
                <th width="10%">联系人</th>
                <th width="10%">联系电话</th>
                <th width="10%">传真</th>
                <th width="10%">创建时间</th>
                <th width="30%">操作</th>
            </tr>
            <tbody id="list-content"></tbody>
    <%--        <c:forEach var="item" items="${Page.list2}">
            <tr>
                <td>${item.proCode}</td>
                <td>${item.proName}</td>
                <td>${item.proContact}</td>
                <td>${item.proPhone}</td>
                <td>${item.proFax}</td>
                <td>${item.creationDate}</td>
                <td>
                    <a href="<%=path%>/ProviderServlet?action=ById&id=${item.id}"><img src="img/read.png" alt="查看" title="查看"/></a>
                    <a href="<%=path%>/ProviderServlet?action=ById2&id=${item.id}"><img src="img/xiugai.png" alt="修改" title="修改"/></a>
                    <a href="#" class="removeProvider"><img src="img/schu.png" alt="删除" title="删除"/></a>
                </td>
            </tr>
            </c:forEach>--%>
        </table>
       <%-- <div style="text-align: center">
            <a href="<%=path%>/ProviderServlet?action=list&pageindex=1">首页</a> &nbsp;&nbsp;&nbsp;
            当前页:[${Page.pageindex} / ${Page.pagetotalpages}] &nbsp;&nbsp;&nbsp;
            <a href="<%=path%>/ProviderServlet?action=list&pageindex=${Page.pageindex-1}">上一页</a> &nbsp;&nbsp;&nbsp;
            <a href="<%=path%>/ProviderServlet?action=list&pageindex=${Page.pageindex+1}">下一页</a> &nbsp;&nbsp;&nbsp;
            <a href="<%=path%>/ProviderServlet?action=list&pageindex=${Page.pagetotalpages}">尾页</a>
        </div>--%>
    </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeProv">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain" >
            <p>你确定要删除该供应商吗？</p>
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