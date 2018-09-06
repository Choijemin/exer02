<%@page import="oracle.net.aso.a"%>
<%@page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.Part"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="beans.*" %>
<%@ include file="/layout/top.jspf"%>

<%
	Map data = new HashMap();
	MultipartParser parser = new MultipartParser(request, 1024*1024*100, true,true,"UTF-8");
	Part part;
	while( (part= parser.readNextPart() ) != null) {
		if(part.isParam()) {
	ParamPart param = (ParamPart)part;
	if(param.getName().equals("title")) {
		data.put("title", param.getStringValue());
	} else if(param.getName().equals("content")) {
		data.put("content", param.getStringValue());
	} else {
		
	}
	//data.put(param.getName(), param.getValue());
		}else {
	FilePart file = (FilePart)part;
	String fileName = file.getFileName();
	long curr = System.currentTimeMillis();
	File dir = new File(application.getRealPath("/storage"), String.valueOf(curr));
	dir.mkdirs();
	file.writeTo(dir);
	String attach = "/storage/"+curr+"/"+fileName;
	
	data.put("attach", attach);
		}
	}
	data.put("writer", session.getAttribute("logid"));
	System.out.println(data);
	BoardDao dao = new BoardDao();
	int r = dao.addBoard(data);
%>
<%
	if(r==1) {
%>	
 	<b>글작성을 완료하였습니다.</b><br>
 	<small>홈으로 돌아가고 싶으시면, <b>[홈으로]</b>를 눌러주세요.</small><br>
 	<small>게시판으로 가고싶으시면, <b>[게시판]</b>을 눌러주세요.</small>
	<% } %>
	<br><br>
	<a href="<%= application.getContextPath()%>/index.jsp"><button>홈으로</button></a>
	<a href="<%= application.getContextPath()%>/board/list.jsp"><button>게시판</button></a>
<%@ include file="/layout/bottom.jspf"%>