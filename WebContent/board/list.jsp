<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="beans.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	BoardDao dao = new BoardDao();
	List<Map> list = dao.getAllDatas();
	SimpleDateFormat df = new SimpleDateFormat("HH:mm");
%>
<%@ include file="/layout/top.jspf"%>
<hr>
	<h3>게시판</h3>
<p style="text-align: center"> 
	총 게시글 수 : <b><%=list.size() %></b>
</p>
<table style = "margin : auto" border = "1">
  <tr>
    <th>No.</th>
    <th>제목</th>
    <th>작성자</th>
    <th>시간</th>
    <th>추천수</th>
  </tr>
	<%for(int i = 0; i < list.size(); i++) {
		Map one = list.get(i);
	%>
  <tr>
    <td><%= one.get("NO") %></td>
    <td><a href="<%=application.getContextPath()%>/board/view.jsp?no=<%=one.get("NO")%>"><%= one.get("TITLE") %></a></td>
    <td><%= one.get("WRITER") %></td>
    <td><%=	df.format(one.get("LEFTDATE")) %></td>
    <td><%=	one.get("GOOD") %></td>
  </tr>
<% } %>
</table>
	<br><br>
	<a href="board.jsp"><button>글작성</button></a>
<%@ include file="/layout/bottom.jspf"%>