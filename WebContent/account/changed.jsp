<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.*" %>
<%
	String newPass = request.getParameter("pass");
	String logid =(String)session.getAttribute("logid");
	AccountDao dao= new AccountDao();
	int n = dao.setOnesPass(logid, newPass);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body style="text-align: center">
<form action="../login.jsp">
<h3>비밀번호 변경</h3>

비밀 번호 변경이 완료되었습니다.

<br><br>
<button>확 인</button>
</form>
</body>
</html>