<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ȸ�� ����</title>
</head>
<body style = "text-align: center"/>
<h3>ȸ�� ����</h3>
<table style = "margin : auto" border = "1">
<tr >
<td>
<form action="joincheck.jsp">
<p style = "text-align:Left">
	���̵�  : &nbsp;&nbsp;&nbsp;<input type = "text" min = "4" max = "12" name = "id"><br><br>
	��й�ȣ : <input type = "password" min = "4" max = "12" name = "pass"><br><br>
	�� �� :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = "text" min = "2" max = "10" name = "name"><br><br>
	���� : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <input type = "radio"  name = "gender" value="��" checked/><span class="up">��</span> 
		 <input type = "radio"  name = "gender" value="��"/><span class="up">��</span>
</p>
</td>
</tr>
</table>
<br>
<button>Ȯ ��</button>&nbsp;&nbsp;<button type = "reset">�ٽ� �Է�</button>
</form>
</body>
</html>