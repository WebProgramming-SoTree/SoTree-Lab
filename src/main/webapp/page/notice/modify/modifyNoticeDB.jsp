<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
	<body>
		<%
		int notice_num;
		String title = "", content = "";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		notice_num = Integer.parseInt(request.getParameter("notice_num"));
		title = request.getParameter("title");
		content = request.getParameter("content");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/sotree?serverTimezone=UTC";
			conn = DriverManager.getConnection(url, "sotree", "0119");
			stmt = conn.createStatement();
			String sql_update = "update table_notice set title = '" + title + "', content = '" + content + "' where notice_num = " + notice_num;
			stmt.executeUpdate(sql_update);
		}
		catch(Exception e){
			out.println("DB 연동 오류입니다.:" + e.getMessage());
		}
		%>
		
		<center><h2>게시글이 수정되었습니다.</h2>
		<a href="../detailInfo/detailNotice.jsp?notice_num=<%=notice_num%>">작성한 글 확인</a>
		<a href="../mainNotice.jsp">게시글 목록 보기</a>
		</center>
	</body>
</html>