<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%@page import="javabean.BoardList"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="./makeNewNotice.css" rel="stylesheet" />
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>공지사항 작성</title>
</head>
<body>
	<center>
		<br> <br>
		<form method="POST" action="makeNewNoticeDB.jsp">
			<div class="headerNotice">
				<table border="0">
					<tr>
						<td>제 목:</td>
						<td><input type="text" name="title" size="50"
							class="inputTag"></td>
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
						<td><textarea name="content" cols="65" rows="4"
								class="inputTag"></textarea></td>
					</tr>
				</table>
				<br>
				<br>
			</div>
			<div></div>
			<br>
			<br> <input type="submit" value="등록하기"> <input
				type="reset" value="다시쓰기">
			<%
			String flag = request.getParameter("flag");
			if ("r".equals(flag)) {
			%>
			<input type="hidden" name="refer_num"
				value="<%=request.getParameter("refer_num")%>"> <input
				type="hidden" name="reply" value="y">
			<%
			} else
			%>
			<input type="hidden" name="reply" value="n">
		</form>

		<div class="modify">
			<a href="mainNotice.jsp">게시글 목록 보기</a>
		</div>
		<!-- 			<a href="" onclick="closePopup();"> 게시글 목록 보기 </a> -->
	</center>
</body>
</html>