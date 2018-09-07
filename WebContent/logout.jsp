<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%
	String logid = (String)request.getAttribute("logid");
	Cookie t = new Cookie("freepass", logid);
	t.setMaxAge(0);
	response.addCookie(t);
	
	session.invalidate();
	// 인증정보를 없애줘야되는데, invalidate 시켜서 없애든, removeAttribute
	Thread.sleep(2000);
	response.sendRedirect(application.getContextPath()+"/login.jsp");		
%>