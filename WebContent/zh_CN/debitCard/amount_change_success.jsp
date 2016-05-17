<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
		alert("Operate success");

</script>
<link rel="stylesheet" type="text/css" href="/OnlineBank/css/header.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>假装是中文</h2>
<h3>Operate success</h3>
<table>
<tr><td>type</td><td><%=request.getAttribute("type") %></td></tr>
<tr><td>customer account</td><td><%=request.getAttribute("card_num") %></td></tr>
<tr><td>balance</td><td><%=request.getAttribute("balance") %></td></tr>
</table>
<a href=" /OnlineBank/administrator/back">return</a>
</body>
</html>