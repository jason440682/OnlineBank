<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/OnlineBank/css/header.css">
<script src="/OnlineBank/js/language.js"></script>
</head>
<body>
<div class="header">
<ul>
		<li class="lan"> 
			<span class="Darrow"></span> 
			<a href="#">language</a> 
			<dl> 
				<dt><span class="arrow"></span></dt> 
				<dd><a onclick="language('chinese')">Chinese</a></dd> 
			<dd><a onclick="language('english')">English</a></dd> 
			</dl> 
		</li> 
</ul>
</div>
<h1>XXX Online Bank</h1>
        <div align="center">
         		<table>
         		 		<tr>
         		 			<td>customer's name</td>
         		 			<td><%=request.getAttribute("customer_name") %></td>
         		 		</tr>
         		 		<tr>
         		 			<td>card_num</td>
         		 			<td><%=request.getAttribute("card_num") %></td>
         		 		</tr>
         		 		<tr>
         		 			<td><a href=" /OnlineBank/administrator/back">return</a></td>
         		 		</tr>
         		</table>
        </div>

</body>
</html>