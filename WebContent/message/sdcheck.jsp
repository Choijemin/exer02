<%@page import="java.sql.Date"%>
<%@page import="java.util.*"%>
<%@page import="beans.*"%>
<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AccountDao dao= new AccountDao();
	String sender = (String)session.getAttribute("logid");
	String receiver = request.getParameter("receiver");
	String content = request.getParameter("senddate");
	String code = UUID.randomUUID().toString().split("-")[0];
	java.sql.Date senddate = new java.sql.Date(System.currentTimeMillis());
	java.sql.Date receivedate = new java.sql.Date(System.currentTimeMillis());
	
	int m = dao.getaddMessage(code, sender, receiver, content, senddate, receivedate);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style = "text-align: center">
<h3>메세지</h3>
<table style = "margin : auto" border = "1">
<tr>
<td>
<b><%= sender %></b>님  <b><%= receiver %></b>님에게 메세지를 전송했습니다.<br><br>
보낸 날짜 : <%= senddate %><br>
</td>
</tr>
</table>
<br>
<form action = "../index.jsp">
	<button> 홈으로 </button>
</form>
</body>
</html>