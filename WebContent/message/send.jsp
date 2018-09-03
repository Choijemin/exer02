<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>
<%
	String logid =(String)session.getAttribute("logid");
%>
	<form action = "sdcheck.jsp" method = "post">
	<p>
		받을사람(*)<br/>
		<input type="text" name = "receiver" placeholder="write a receiver" style = "width: 220px; padding: 5px; font-family: ingerit;"/>
	</p>
	<p>
		보낼내용(*)<br/>
		<textarea name="senddate" style = "height: 300px; width: 220px; padding: 5px; resize: none; font-family: ingerit;" placeholder="write a message"></textarea>	
	</p>
	<button>전 송</button>&nbsp;&nbsp;<button type = "reset">다시 입력</button>
	</form>
<%@ include file="/layout/bottom.jspf"%>