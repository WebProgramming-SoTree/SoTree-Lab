<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<script type="text/javascript"> 
 	function closePopup() {
 		var pop = window.close();
 	}
</script>
	<body>
		<%
		int notice_num;
		String title = "", content = "";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		notice_num = Integer.parseInt(request.getParameter("notice_num"));
		
		javabean.UserInfo user_info = (javabean.UserInfo) session.getAttribute("userInfo");	
		if (user_info == null) {
		%>
		<script>
        alert('로그인하지 않았습니다');
        window.close();
        //window.location.href = '../mainNotice.jsp';
    </script>
		<%
	}
	
	int user_id = (user_info != null) ? user_info.getid() : 0;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/sotree?serverTimezone=UTC";
			conn = DriverManager.getConnection(url, "sotree", "0119");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String sql = "SELECT table_notice.*, table_users.name FROM table_notice INNER JOIN table_users ON table_notice.user_id = table_users.id WHERE notice_num = " + notice_num + "";
			rs = stmt.executeQuery(sql);
		}
		catch(Exception e){
			out.println("DB 연동 오류입니다.:" + e.getMessage());
		}
		

		
		while(rs.next()){
			if(user_id != rs.getInt("table_notice.user_id"))
			{
		%>
		
		<script>
        alert('게시물 생성자가 아닙니다');
        window.close();
        //window.location.href = '../mainNotice.jsp';
    </script>
		<%
			}
			else
			{
		%>
		<center><h2>게시글 수정</h2><br><br>
		<form action="modifyNoticeDB.jsp" method="post">
			<table border="0">
				<tr>
					<td><input type="text" name="title" size="50" value="<%= rs.getString("title") %>"></td>
				</tr>
				<tr>
					<td><textarea name="content" cols="65" rows="4"><%= rs.getString("content") %></textarea></td>
				</tr>
			</table><br><br>
			
			<input type="hidden" name="notice_num" value="<%= request.getParameter("notice_num") %>">
			
			<input type="submit" value="등록하기">
			<input type="reset" value="다시쓰기">
		</form>
		
		<a href="../mainNotice.jsp" onclick="closePopup();">취소</a>
		</center>
		<%
			}
		}
		%>
	</body>
</html>