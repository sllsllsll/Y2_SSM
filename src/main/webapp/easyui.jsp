
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>商品出库</title>
    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/jquery-easyui-1.5.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/jquery-easyui-1.5.3/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/jquery-easyui-1.5.3/demo/demo.css">
    <script type="text/javascript" src="/jquery-easyui-1.5.3/jquery.min.js"></script>
    <script type="text/javascript" src="/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
</head>
<body>
    <div class="easyui-panel" style="padding:5px">
        <ul class="easyui-tree">
            <c:forEach var="item" items="${listcates}">
                <li>
                    <span>${item.catename}</span>
                    <ul>
                <c:forEach var="item2" items="${item.cate}">
                        <li data-options="state:'closed'">
                            <span>${item2.catename}</span>
                        </li>
                </c:forEach>
                    </ul>
                </li>

            </c:forEach>
        </ul>
    </div>




</div>
</body>
</html>
