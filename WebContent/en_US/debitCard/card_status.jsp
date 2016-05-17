<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="model.DebitCard" %>    
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
    	<td>Card Number</td>
    	<td>Customer Name</td>
    	<td>Balance</td>
    	<td>Online Bank Status</td>
    </tr>
     
      <%
            List<DebitCard> cards=(List<DebitCard>) request.getAttribute("cards");
    
            String customer_name=(String)request.getAttribute("customer_name");
            DebitCard card;
             for(int i=0;i<cards.size();i++){
            	  card=cards.get(0);
            	  out.print("<tr>");
            	  out.print("<td>"+card.getStr("card_num")+"</td>");
            	  out.print("<td>"+customer_name+"</td>");
            	  out.print("<td>"+card.getDouble("amount")+"</td>");
            	  out.print("<td>"+card.getStr("status")+"</td>");
            	  out.print("</tr>");
             }
    
      %>
    
   
    </table>
</div>
<a href=" /OnlineBank/administrator/back">return</a>
</body>
</html>