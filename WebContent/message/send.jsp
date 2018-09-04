<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>
<%
	boolean hasErr = session.getAttribute("senterror")!=null;
	String receiver  =(String)session.getAttribute("logid");
%>
<h3>쪽지 보내기</h3>
	<%if(hasErr) { %>
		<small style="color: red">전송실패<br/> 수신자를 확인해주세요.</small>
	
	<%} %>
	
	<form action = "sdcheck.jsp" method = "post">
	<p>
		받을사람(*)<br/>
		<input type="text" name = "receiver" placeholder="write a receiver" style = "width: 220px; padding: 5px; font-family: ingerit;"/>
	</p>
	<p>
		보낼내용(*)<br/>
		<textarea name="content" style = "height: 300px; width: 220px; padding: 5px; resize: none; font-family: ingerit;" placeholder="write a message"></textarea>	
	</p>
	<button>전 송</button>&nbsp;&nbsp;<button type = "reset">다시 입력</button>
	</form>
<%@ include file="/layout/bottom.jspf"%>