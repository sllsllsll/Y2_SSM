<%--
  Created by IntelliJ IDEA.
  User: linlin
  Date: 2017/7/12
  Time: 18:36
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

        /**
         * 批量删除
         */
        function del() {
            $("#all").click(function () {
                if (this.checked) {
                    $("[type='checkbox'].ace").prop("checked", true);
                } else {
                    $("[type='checkbox'].ace").prop("checked", false);
                }
            });
            //获取选中的id
$("#getValue").click(function () {
    var vals="";
    $("[type='checkbox'].ace").each(function () {
        if($(this).prop("checked")==true){
            vals+=$(this).val()+",";
        }
    });
    alert(vals);
    if(vals.length>0){

        $.ajax({
            type:"POST",
            async:false,//异步请求  默认为true,设置为false的话,suncess之后，才会继续执行  下面的js
            //data:"name="+123,
            data:{ "vars": vals },// 你的form表单ID
            //请求控制器
            url:"${pageContext.request.contextPath}/userdel",
            traditional: true,
            //返回值（用于判断）
            success:function(date){
                alert(date);
            },
            error:function(date){
                alert(date);
            }

        });
        location.reload();
    }else{
        alert("请至少选中一项！");
    }
});


        }

        /**
         * 修改
         */
        function update(id) {
            var id = $("#checkid").val();
            var path = "<%=path%>/userUpdateId?id=" + id;
            location.href = path;
        }

        /**
         * Ajax分页显示
         */
        jQuery.noConflict();
        jQuery(function ($) {
            load(0);
            function load(index) {
                $.ajax({
                    url: "/getUserinfo",
                    type: "post",
                    data: {"pageIndex": index},
                    success: function (data) {
                        $("#list-content").html('');
                        $.each(data.list, function (i, dom) {
                            $('#list-content').append('<tr><td><input  class="ace" type="checkbox" id="checkid" value="' + dom.id + '"/></td>' + '<td>' + dom.userCode + '</td><td>' + dom.userName + '</td><td>' + (dom.gender===1?"男":"女") +
                                '</td><td>' + dom.birthday + '</td><td>' + dom.phone + '</td>' + '<td>' + (dom.userRole===1?"经理":"管理员") +
                                '</td><td><a href="<%=path%>/userViewId?id=' + dom.id + '">'
                                + '<img src="img/read.png" alt="查看" title="查看">' + '</a>' + '<a href="<%=path%>/userUpdateId?id=${dom.id}"><img src="img/xiugai.png" alt="修改" title="修改"/></a>'
                                + '<a href="<%=path%>/userdel?id=${dom.id}" ><img src="img/schu.png" alt="删除" title="删除"/></a>' + '<tr>')
                        });
                        //渲染页面
                        $('#pagination').pagination(data.pagetotalpages, {
                            current_page: index, //当前页索引
                            items_per_page: data.pagesize,//每页记录数
                            num_display_entries: 2, //显示页码块数量
                            callback: load,
                            load_first_page: true,
                            prev_text: 'Previous',
                            next_text: 'Next'
                        })
                    }

                })
            }
        })


        /**
         *分页查询
         */
     jQuery.noConflict();
     function getinfo() {
         load(0);
         function load(index) {
             $.ajax({
                 url: "/getinfo",
                 type: "post",
                 data: {"pageIndex": index,"userName":$("#userNames").val()},
                 success: function (data) {
                     $("#list-content").html('');
                     $.each(data.list, function (i, dom) {
                         $('#list-content').append('<tr><td><input  class="ace" type="checkbox" id="checkid" value="' + dom.id + '"/></td>' + '<td>' + dom.userCode + '</td><td>' + dom.userName + '</td><td>' + (dom.gender===1?"男":"女")  +
                             '</td><td>' + dom.birthday + '</td><td>' + dom.phone + '</td>' + '<td>' + (dom.userRole===1?"经理":"管理员")  +
                             '</td><td><a href="<%=path%>/userViewId?id=' + dom.id + '">'
                             + '<img src="img/read.png" alt="查看" title="查看">' + '</a>' + '<a href="<%=path%>/userUpdateId?id=${dom.id}"><img src="img/xiugai.png" alt="修改" title="修改"/></a>'
                             + '<a href="<%=path%>/userdel?id=${dom.id}" ><img src="img/schu.png" alt="删除" title="删除"/></a>' + '<tr>')
                     });
                     //渲染页面
                     $('#pagination').pagination(data.pagetotalpages, {
                         current_page: index, //当前页索引
                         items_per_page: data.pagesize,//每页记录数
                         num_display_entries: 1, //显示页码块数量
                         callback: load,
                         load_first_page: true,
                         prev_text: 'Previous',
                         next_text: 'Next'
                     })
                 }

             })
         }
     }


    </script>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>超市账单管理系统</h1>
    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b">${username}</span> , 欢迎你！</p>
        <a href="<%=path%>/logout">退出</a>
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
                <li><a href="<%=path%>/logout">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面</span>
        </div>
        <div class="search">
            <span>用户名：</span>

            <form method="post">
                <input type="text" name="userName" id="userNames" placeholder="请输入用户名"/>
                <input type="button" value="查询" onclick="getinfo()"/>
            </form>

            <a href="<%=path%>/userAdd.jsp">添加用户</a>
            <a <%--href="<%=path%>/userAdd.jsp"--%> onclick="update(id)">修改用户</a>
            <a  id="getValue" onclick="del()">批量删除用户</a>
            <a href="<%=path%>/downloadFile">导出报表</a>
        </div>
        <!--用户-->

        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%"><input type="checkbox" id="all"/></th>
                <th width="10%">用户编码</th>
                <th width="20%">用户名称</th>
                <th width="10%">性别</th>
                <th width="10%">年龄</th>
                <th width="10%">电话</th>
                <th width="10%">用户类型</th>
                <th width="30%">操作</th>
            </tr>
            <tbody id="list-content"></tbody>
            <%--     <c:forEach var="item" items="${Page.list}">
                 <tr>
                 <td>${item.userCode}</td>
                 <td>${item.userName}</td>
                     <c:if test="${item.gender eq 1}">
                     <td align="center">女</td>
                     </c:if>
                     <c:if test="${item.gender eq 2}">
                         <td align="center">男</td>
                     </c:if>
                 <td>${item.birthday}</td>
                 <td>${item.phone}</td>
                     <c:if test="${item.userRole eq 1}">
                         <td align="center">经理</td>
                     </c:if>
                     <c:if test="${item.userRole eq 2}">
                         <td align="center">管理员</td>
                     </c:if>
                     <c:if test="${item.userRole eq 3}">
                         <td align="center">普通用户</td>
                     </c:if>

     <td><a href="<%=path%>/userViewId?id=${item.id}"><img src="img/read.png" alt="查看" title="查看"/></a>
         <a href="<%=path%>/userUpdateId?id=${item.id}"><img src="img/xiugai.png" alt="修改" title="修改"/></a>
         <a href="<%=path%>/userdel?id=${item.id}" ><img src="img/schu.png" alt="删除" title="删除"/></a>
     </td>
     </tr>
                 </c:forEach>
                 --%>
        </table>
        <div class="pagination" id="pagination" style="margin:4px 0 0 0"></div>
        <%--  <div style="text-align: center">
              <a href="<%=path%>/userLimit?pageindex=1">首页</a> &nbsp;&nbsp;&nbsp;
              当前页:[${Page.pageindex} / ${Page.pagetotalpages}] &nbsp;&nbsp;&nbsp;
              <a href="<%=path%>/userLimit?pageindex=${Page.pageindex-1}">上一页</a> &nbsp;&nbsp;&nbsp;
              <a href="<%=path%>/userLimit?pageindex=${Page.pageindex+1}">下一页</a> &nbsp;&nbsp;&nbsp;
              <a href="<%=path%>/userLimit?pageindex=${Page.pagetotalpages}">尾页</a>
          </div>--%>
    </div>


</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该用户吗？</p>
            <a href="" id="yes">确定</a>
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
