<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="/login.jsp" %>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*" %>
<%
	if(session.getAttribute("auth")==null){
		throw new RuntimeException();
	}
	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm MM.dd.YYYY");
	String logid =(String)session.getAttribute("logid");
	Date latest =(Date)session.getAttribute("latest");
%>
<%@ include file="/layout/top.jspf"%>
<p style="text-align: right;">
	〔<b><%=logid %></b>, LogOn / <small>마지막로그인 : 
		<%=latest==null ? "-": sdf.format(latest) %></small>〕	
</p>
<hr>
<p style="text-align: right;">
	<a href="<%=application.getContextPath()%>/message/msg.jsp"><button type="button">쪽지함</button></a>	
	<a href="<%=application.getContextPath()%>/message/send.jsp"><button type="button">쪽지보내기</button></a>	
	<a href="<%=application.getContextPath()%>/account/change.jsp"><button type="button">비밀번호변경</button></a>	
	<a href="<%=application.getContextPath()%>/logout.jsp"><button type="button">로그아웃</button></a>	
</p>
<p>
	<img src="<%=application.getContextPath()%>/image/pro.png" style="width: 10%; border-radius: 30px"/>
</p>
<%@ include file="/layout/bottom.jspf"%>