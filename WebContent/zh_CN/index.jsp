<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
   h3{
	   color:red;
   }
</style>

<script src="/OnlineBank/js/language.js"></script>
<link rel="stylesheet" type="text/css" href="/OnlineBank/css/header.css">

<meta charset="UTF-8">
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
<h2>假装是中文</h2>
<div align="center">
<h2>login</h2>
<form action="/OnlineBank/administrator/login" method="POST">
    <table>
    <tr>
    	<td>account</td>
    	<td><input type="text" name="name" 
    	         <%  if(request.getAttribute("nameMsg")!=null){
                            	  out.print("  value= " + request.getAttribute("nameMsg"))	 ;
    	         		 }	 %>   /> </td>	
    </tr>
    <tr>
    	<td>password</td>
    	<td><input type="password" name="password"    /> </td>	
    </tr>
    <tr>
      <td><input type="submit" value="confirm"></td>
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