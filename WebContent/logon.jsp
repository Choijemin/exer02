<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="/error/default.jsp" %>
<%@ page import="beans.*" %>
<%@ page import="java.util.*" %>
<%
	String freepass = request.getParameter("keep");
	String logid =request.getParameter("logid");
	String logpass = request.getParameter("logpass");
	
	// 로그인 유지 버튼을 눌렀을 때, 쿠키가 저장되게...!
	if(freepass != null) {
		Cookie t = new Cookie("freepass", logid);
		String domain = t.getDomain();
		t.setMaxAge(60*60*24*30);
		response.addCookie(t);
	} else {
		
	}
	
	AccountDao dao= new AccountDao();
	Map acc = dao.getAccountById(logid);
	if(acc== null || !acc.get("pass").equals(logpass)) {
		response.sendRedirect(application.getContextPath()+"/login.jsp?mode=fail");	
	}else {
	session.setAttribute("auth", true);
	session.setAttribute("logid", logid);
	
	LoginLogDao ldao = new LoginLogDao();
	Map log = ldao.getLatesetLogById(logid);
	if(log != null) {
		session.setAttribute("latest", log.get("time"));
	}
	
	ldao.addLog(logid);
	response.sendRedirect(application.getContextPath()+"/");
	}
%>

