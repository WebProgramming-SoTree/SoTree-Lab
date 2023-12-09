<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head><title>공지사항-세부</title></head>
<body>
<center><h2>게시글 내용</h2></center>
<center>
    <%
        int notice_num, refer_num = 0;
        String title = "", writer = "";
        Date notice_dat;
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        notice_num = Integer.parseInt(request.getParameter("notice_num"));

        try{
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/sotree?serverTimezone=UTC";
            conn = DriverManager.getConnection(url, "sotree", "0119");
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            //String sql = "select * from table_notice where notice_num = " + notice_num + "";
            String sql = "SELECT table_notice.*, table_users.name FROM table_notice INNER JOIN table_users ON table_notice.user_id = table_users.id WHERE notice_num = " + notice_num + "";
            rs = stmt.executeQuery(sql);
        }
        catch(Exception e){
            out.println("DB 연동 오류입니다.:" + e.getMessage());
        }

        while(rs.next()){
            notice_num = Integer.parseInt(rs.getString("notice_num"));
            title = rs.getString("title");
            //notice_date = rs.getDate("notice_date");
            writer = rs.getString("name");
            refer_num = Integer.parseInt(rs.getString("refer_num"));
        
    %>
    <table border="0" width="500">
        <tr>
            <td width="100">글 쓴 이:</td>
            <td><%= writer %></td>
        </tr>
        <tr>
            <td>글 제 목:</td>
            <td><%= title %></td>
        </tr>
        <tr>
            <td>작성 일자:</td>
            <td><%= rs.getDate("notice_date") %></td>
        </tr>
<%--        <tr>--%>
<%--            <td><img src="image/ball.gif">글 내 용:</td>--%>
<%--            <td><%= content %></td>--%>
<%--        </tr>--%>
    </table><br><br>
					<%
						}
					%>

<%--    <a href="board-insert.jsp?ref=<%= refer_num %>&flag=r">답글 쓰기</a>--%>

<%--    <a href="board-modify-pwd.jsp?id=<%= notice_num %>">게시글 수정</a>--%>

	<a href="../modify/deleteNotice.jsp?notice_num=<%= notice_num %>">게시글 삭제</a>

    <a href="../mainNotice.jsp">게시글 목록 보기</a>
</center>
</body>
</html>