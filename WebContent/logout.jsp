<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%
	/* String logid = (String)request.getAttribute("logid");
	Cookie t = new Cookie("freepass", logid);
	t.setMaxAge(0);
	response.addCookie(t); */
	
	// 쿠키로 인증 유시 시켜둔 기능을 구현했을 때 유지해제를 사용자에게 제공하고 싶으면,
	// 사용자가 가진 쿠키를 삭제시켜줘야되는데, 이걸 명령을 통해서 브라우저 쿠키함을 
	// 비우게 하는 건 없고,
	
	Cookie c = new Cookie("freepass", "bomb");
	c.setPath(application.getContextPath());
	c.setMaxAge(0);
	response.addCookie(c);
	
	session.invalidate();
	// 인증정보를 없애줘야되는데, invalidate 시켜서 없애든, removeAttribute
	Thread.sleep(2000);
	response.sendRedirect(application.getContextPath()+"/login.jsp");		
%>