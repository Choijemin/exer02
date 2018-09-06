<%@page import="org.apache.ibatis.annotations.One"%>
<%@page import="beans.BoardDao"%>
<%@page import="beans.SendDao"%>
<%@page import="oracle.net.ns.SessionAtts"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="beans.GoodLogDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/top.jspf"%>
    
<%
	String id = (String)session.getAttribute("logid");
	int no = Integer.parseInt(request.getParameter("no"));
	GoodLogDao gld = new GoodLogDao();
	Map data = new HashMap();
	data.put("actor", id);
	data.put("target", no);
	int r = gld.addGood(data);	
%>
<% 
	response.sendRedirect(application.getContextPath()+"/board/view.jsp?no="+ no);
%>
<%@ include file="/layout/bottom.jspf"%>