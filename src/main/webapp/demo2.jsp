
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"  %>
<%@ page import="java.util.Date" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<link rel="stylesheet" href="ajaxjs/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="ajaxjs/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="ajaxjs/jquery.pagination.js"></script>
<script type="text/javascript">
//模拟数据
var arr = [];
for(var i = 0; i < 100; i++){
	var date = new Date();
	arr.push({
		number: i + 1,
		_date: date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds()
	});
}

$(function(){
	//渲染分页
	$('#pagination').pagination(arr.length, {
		current_page : 0,
		items_per_page : 10,
		num_display_entries : 3,
		callback : function(page_id){
			//模拟ajax去后端读取页数，获取数据并渲染列表的过程
			$('#list-content').html('');
			for(var i = 0; i < 10; i++){
				$('#list-content').append('<tr><td>' + arr[page_id * 10 + i].number + '</td><td>' + arr[page_id * 10 + i]._date + '</td></tr>');
			}
		},
		load_first_page : true,
		prev_text : '上一页',
		next_text : '下一页'
	});
});
</script>
</head>

<body>
<div class="row-fluid">
	<div class="span4 offset4">
		<div class="hero-unit">
			<h2>Ajax分页，无刷新</h2>
		</div>
		<table class="table table-bordered">
			<tr>
				<th style="width:20%">编号</th>
				<th>日期</th>
			</tr>
			<tbody id="list-content"></tbody>
			<tfoot>
				<tr>
					<td colspan="3">
						<div class="pagination" id="pagination" style="margin:4px 0 0 0"></div>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>
</body>
</html>
