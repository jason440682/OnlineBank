<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script src="/OnlineBank/js/check_auth_code.js"></script>
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
					<dd><a onclick="language('zh_CN')">Chinese</a></dd> 
					<dd><a onclick="language('en_US')">English</a></dd> 
			</dl> 
		</li> 
</ul>
</div>
<h2>假装是中文</h2>
<div align="center">
    <h1> XXX Bank</h1>
	<table>
		<tr>
			<td><a href="/OnlineBank/debitCard/show/open">open</a></td>
			<td><a href="/OnlineBank/debitCard/show/inquiry">inquiry</a></td>
			<td><a href="/OnlineBank/debitCard/show/deposit">deposit</a></td>
			<td><a href="/OnlineBank/debitCard/show/withdrawal">withdrawal</a></td>
		</tr>
	</table>
	
	<p>deposit</p>
	<form action="/OnlineBank/debitCard/deposit"  id="form" method="POST">
		<table>
		 		<tr>
		 		<td>account number:</td>
		 		<td><input type="text"  name="card_num" />
		 		</tr>
		 		<tr>
		 		<td>deposit amount:</td>
		 		<td><input type="text"  name="amount"  id="amount"/>
		 		</tr>
		</table>
	 
	<input type="button" value="确认"  onclick="check()">
	</form>
	<h5><%
	              if(request.getAttribute("msg")!=null){
	            	  out.print(request.getAttribute("msg")) ;
	              }
	              %>
	 </h5>
</div>
 </body>
</html>