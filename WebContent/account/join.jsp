<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body style = "text-align: center"/>
<h3>회원 가입</h3>
<table style = "margin : auto" border = "1">
<tr >
<td>
<form action="joincheck.jsp">
<p style = "text-align:Left">
	아이디  : &nbsp;&nbsp;&nbsp;<input type = "text" min = "4" max = "12" name = "id"><br><br>
	비밀번호 : <input type = "password" min = "4" max = "12" name = "pass"><br><br>
	이 름 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = "text" min = "2" max = "10" name = "name"><br><br>
	성별 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <input type = "radio"  name = "gender" value="남" checked/><span class="up">남</span> 
		 <input type = "radio"  name = "gender" value="여"/><span class="up">여</span>
</p>
</td>
</tr>
</table>
<br>
<button>확 인</button>&nbsp;&nbsp;<button type = "reset">다시 입력</button>
</form>
</body>
</html>