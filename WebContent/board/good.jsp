<%@page import="java.util.List"%>
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
	Map data = new HashMap();
	data.put("actor", id);
	data.put("target", no);
	
	GoodLogDao good = new GoodLogDao();
	int r = good.addGood(data);
	if (r == 1) {
		BoardDao board = new BoardDao();
		board.increaseGoodByNo(no);
		response.sendRedirect(application.getContextPath() + "/board/view.jsp?no=" + no);
	} else {	
	%>
	<h1>《추천하기》</h1>
<p>이미 삭제된 글, 혹은 추천하신글입니다.</p>
<a href="<%= application.getContextPath() %>/board/list.jsp"><button>게시판</button></a>
<a href="<%= application.getContextPath() %>/index.jsp"><button>홈으로</button></a>
<%
	}
%>
<%@ include file="/layout/bottom.jspf"%>