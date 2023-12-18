<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head><title>공지사항-삭제</title></head>
<body>
	<%
	int notice_num;
	String notice_user_id = "", sql, sql1;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	notice_num = Integer.parseInt(request.getParameter("notice_num"));
	
	javabean.UserInfo user_info = (javabean.UserInfo) session.getAttribute("userInfo");
	if (user_info == null) {
		%>
		<script>
        alert('로그인하지 않았습니다');
        window.location.href = '../mainNotice.jsp';
    </script>
		<%
	}
	
	int user_id = (user_info != null) ? user_info.getid() : 0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/sotree?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "sotree", "0119");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		sql = "SELECT table_notice.*, table_users.name FROM table_notice INNER JOIN table_users ON table_notice.user_id = table_users.id WHERE notice_num = " + notice_num + "";
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
        window.location.href = '../mainNotice.jsp';
    </script>
	<%
		}
		else{
			sql1 = "delete from table_notice where notice_num = " + notice_num + ";";
			try{
				stmt.executeUpdate(sql1);
			}
			catch(Exception e){
				out.println("DB 연동 오류입니다.:" + e.getMessage());
			}
	%>
	<center><h2>게시글이 삭제되었습니다.</h2>
		<a href="../mainNotice.jsp">게시글 목록 보기</a>
	</center>
	<%
			break;
		}
	}
	%>
	</body>
</html>