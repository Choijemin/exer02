<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="beans.DummyDao" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%
	DummyDao dao = new DummyDao();
	String id = (String)session.getAttribute("id");
	String pass = (String)session.getAttribute("pass");
	List<Map<String, Object>> datas = dao.getAllDatas();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body style="text-align: center">
<h3>로그인</h3>
<form action="mypage.jsp">
<table style = "margin : auto" border = "1">
<tr>
<td>
<%
	// id가 데이터 베이스에 있는 지 체크?
	//if(datas.equals(id)) {
%>
<p>
	아이디 : &nbsp;&nbsp;&nbsp;<input type = "text" min = "4" max = "12" name = "id"><br>
	비밀번호 : <input type = "password" min = "4" max = "12" name = "pass"><br>
</p>
</td>
</tr>
</table>
<br>
<button>로그인</button>&nbsp;&nbsp;&nbsp;<button type = "reset">다시 입력</button>
<% //}else { %>
	<% //response.sendRedirect("login.jsp"); %>
<% //} %>
</form>
</body>
</html>