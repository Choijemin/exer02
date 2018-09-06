<%--특정 키에 해당하는 데이터 출력 --%>
<%@page import="beans.GoodLogDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="beans.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("logid");
	int no = Integer.parseInt(request.getParameter("no"));
	BoardDao board = new BoardDao();
	/*
	GoodLogDao good = new GoodLogDao();
	Map data = new HashMap();
	data.put("actor", id);
	data.put("target", no);
	int r = good.addGood(data);
	*/
	Map one = board.getOneByNo(no);
%>
<%@ include file="/layout/top.jspf"%>
<h3><<상세보기>></h3>
<% if(one == null) { %>
	<p>
		존재하지 않는 글입니다. 
	</p>
<%}else { %>
	<p style="text-align: center">
		<b style="font-size: large;"><%=one.get("TITLE") %></b>
	</p>
	<p style="text-align: center">
		<small><i>작성자</i> <%=one.get("WRITER") %> / <i>작성일</i> <%=one.get("LEFTDATE") %>  / <i>추천</i> <%=one.get("GOOD") %>
		<a href = "<%=application.getContextPath()%>/board/good.jsp?no=<%=one.get("NO")%>"><button>up</button></a></small>
	</p>
	<hr/>
	<p style="text-align: center; min-height: 300px; font-size: smaller;"> 
		<%= ((String)one.get("CONTENT")).replace("\n", "<br/>") %>
	</p>
	<hr/>
	<p style="text-align: center">
		<%if(one.get("ATTACH") != null) { %>
		첨부파일 :  <a href="<%=application.getContextPath() %><%=one.get("ATTACH") %>" download >다운로드</a>
		<%} %>
	</p>
<%} %>
<%@ include file="/layout/bottom.jspf"%>