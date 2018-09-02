<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
</head>
<body style="text-align: center">
<h1>MY PAGE</h1>
<p align="right">
<small><%= name %>님</small>  | 
<a href="logout.jsp"><small>로그아웃</small></a> 
</p>
<hr>
<img src= "pro.png" width="250"><br>
<b>아이디 : </b><%= id %><br>
<b>이름 :</b> <%= name %>
</body>
</html>