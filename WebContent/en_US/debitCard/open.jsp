<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/OnlineBank/css/header.css">
<script src="/OnlineBank/js/language.js"></script>
<style type="text/css">
   h3{
	   color:red;
   }
</style>


<title>Insert title here</title>
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
<div align="center">
    <h1> XXX Bank</h1>
	<table>
		<tr>
			<td><a href="open">open credit card</a></td>
			<td><a href="inquiry">inquiry</a></td>
			<td><a href="deposit">deposit</a></td>
			<td><a href="withdrawal">withdrawal</a></td>
		</tr>
	</table>
	
	<form action="../open" method="POST">

	<table>
	 		<tr><td><h2>开户</h2></td></tr>
	 		<tr>
	 			<td>customer’s name</td><td><input type="text"  name="customer_name"/></td>
	 		</tr>
	 		
	 		<tr>
	 			<td>customer’s ID</td><td><input type="text"  name="customer_id"/></td>
	 		</tr>
	 		
	 		<tr>
	 			<td>card PIN</td><td><input type="text"  name="PIN1"/></td>
	 		</tr>
	 		
	 		<tr>
	 			<td>card PIN again</td><td><input type="text"  name="PIN2"/></td>
	 		</tr>
	 		
	 		<tr>
	 		  <td><input type="submit" value="确认"></td>
	 		</tr>
	 		
	</table>
	</form>
	
	<h3><%
         if(request.getAttribute("msg")!=null){
        	   out.print(request.getAttribute("msg"));     
         }
   %>
   </h3>
	
</div>



</body>
</html>