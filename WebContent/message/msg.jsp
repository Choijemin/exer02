<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="beans.*"%>
<%
	String sender = (String)session.getAttribute("sender");
	String receiver = (String)session.getAttribute("receiver");
	String content = (String)session.getAttribute("content");
	String id  =(String)session.getAttribute("logid");
	String code = (String)session.getAttribute("code");
	String senddate = (String)session.getAttribute("senddate");
	java.sql.Date receiverdate = new java.sql.Date(System.currentTimeMillis());
	SendDao dao= new SendDao();
	List<Map> msg = dao.getreciver(receiver);
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>쪽지함</title>
</head>
<body style="text-align: center">
<h2>쪽지함</h2>
<hr>
<%
	if(msg == null || msg.size() == 0) {
%>
		쪽지함이 비어있습니다.
	<% }%>
	<% 
		if(id.equals(receiver)) {
		for(int i = 0; i < msg.size(); i++) {
			Map<String, Object> mg = msg.get(i);
	%>
		<%= mg.get("sender") %>님이 <%= mg.get("receiver") %>님에게 메세지를 보냈습니다.<br>
		<%= mg.get("senddate") %><br>
		<%= mg.get("content") %>
		<% } %>	
	<% } %>

</body>
</html>