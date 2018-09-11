<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.Part"%>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%
	MultipartParser parser = new MultipartParser(request, 1024*1024*100, true, true, "UTF-8");
	//FilePart fp = (FilePart)part;
	//String fn = fp.getFileName();
	int no = (Integer)session.getAttribute("no");
	//session.setAttribute("no", no+1);
	String writer = (String)session.getAttribute("writer");
	String title = (String)session.getAttribute("title");
	java.sql.Date leftdate = new java.sql.Date(System.currentTimeMillis());
	String content = (String)session.getAttribute("content");
	
	
%>
<%@ include file="/layout/top.jspf"%>


<%@ include file="/layout/bottom.jspf"%>