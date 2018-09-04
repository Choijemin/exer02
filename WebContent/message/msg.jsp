<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="beans.*"%>
<%
	String sender = (String)session.getAttribute("logid");
	String receiver = (String)session.getAttribute("receiver");
	String content = (String)session.getAttribute("content");
	Date senddate = (Date)session.getAttribute("senddate");
	java.sql.Date receiverdate = new java.sql.Date(System.currentTimeMillis());
	SendDao dao= new SendDao();
	List<Map<String, Object>> msg = dao.getreciver(receiver);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
</head>
<body style="text-align: center">
<h2>쪽지함</h2>
<%= senddate %>
<%= sender %>님이 <%= receiver %>님에게 메세지를 보냈습니다. <br>
<%= content %>
</body>
</html>