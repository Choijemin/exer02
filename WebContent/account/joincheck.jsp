<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="beans.DummyDao" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	session.setAttribute("id", id);
	String pass = request.getParameter("pass");
	session.setAttribute("pass", pass);
	String name = request.getParameter("name");
	session.setAttribute("name", name);
	String gender = request.getParameter("gender");
	session.setAttribute("gender", gender);
	
	DummyDao dao = new DummyDao();
	int r = dao.addData(id, pass, name, gender);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body style= "text-align: center">
<h3>회원가입 완료!</h3>
<small><%= name %>님! 회원가입을 축하드립니다.</small>
<br><br>
<form action="login.jsp">
<table style = "margin : auto" border = "1">
<tr >
<td>
<p style = "text-align:center">
	ID : <%= id %><br>
	이름 : <%= name %><br>
	성별 : <%= gender %>
</p>
</td>
</tr>
</table>
<br>
<button>로그인</button>
</form>
</body>
</html>