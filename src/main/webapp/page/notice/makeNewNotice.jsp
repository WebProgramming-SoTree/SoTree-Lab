<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
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
				<tr>
					<td>작성 날짜:</td>
					<td><input type="text" name="notice_date" size="30"></td>
				</tr>
				<tr>
					<td>작 성 자 :</td>
					<td><input type="text" name="writer" size="10"></td>
				</tr>
				<!-- <tr>
					<td valign="top">글 내 용:</td>
					<td><textarea name="content" cols="65" rows="4"></textarea></td>
				</tr> -->
				<tr>
					<td>아이디:</td>
					<td><input type="text" name="id" size="10" maxlength="8"></td>
				</tr>
				<tr>
					<td>패스워드:</td>
					<td><input type="password" name="passwd" size="10" maxlength="8"></td>
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