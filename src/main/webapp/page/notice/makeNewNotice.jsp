<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@page import="javabean.BoardList"%>
<html>
	<head><title>공지사항 작성</title></head>
	<body>
		<center>
			<h2>게시판</h2>
			<form method="POST" action="makeNewNoticeDB.jsp">
			<table border="0">
				<tr>
					<td>제 목:</td>
					<td><input type="text" name="title" size="50"></td>
				</tr>
				<%
				try {
							BoardList boardList = new BoardList();
							Date reg_date = new Date(System.currentTimeMillis());
							
							boardList.setRegDate(reg_date);
							session.setAttribute("boardList", boardList);
							
						} catch (Exception e) {
							e.printStackTrace();
						}
				%>
				<tr>
					<td valign="top">글 내 용:</td>
					<td><textarea name="content" cols="65" rows="4"></textarea> </td>
				</tr>
			</table><br><br>
			
			<input type="submit" value="등록하기">
			<input type="reset" value="다시쓰기">
			<%
				String flag = request.getParameter("flag");
				if("r".equals(flag)){%>
						<input type="hidden" name="refer_num" value="<%= request.getParameter("refer_num") %>">
						<input type="hidden" name="reply" value="y">
			<%	} else  %>
						<input type="hidden" name="reply" value="n">
			</form>
			
			<a href="mainNotice.jsp">게시글 목록 보기</a><br>
		</center>
	</body>
</html>