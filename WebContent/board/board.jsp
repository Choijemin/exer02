<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String logid  =(String)session.getAttribute("logid");
%>
<%@ include file="/layout/top.jspf"%>
<hr>
	작성자 : <b>[<%= logid %>]</b>
	
	<form action = "wrote.jsp"  method="post" enctype="multipart/form-data">
	<p>
		제목(*) :
		<input type="text" name = "title" placeholder="write a title" style = "width: 220px; padding: 5px; font-family: ingerit;"/> 
	</p>
	<p>
		<textarea name="content" style = "height: 300px; width: 500px; padding: 5px; resize: none; font-family: ingerit;" placeholder="글을 작성해주세요."></textarea>	
	</p>
	<p>
		<input type = "file" name = "attach/">
	</p>
	<button>전 송</button>&nbsp;&nbsp;<button type = "reset">다시 입력</button>
	</form>

<%@ include file="/layout/bottom.jspf"%>