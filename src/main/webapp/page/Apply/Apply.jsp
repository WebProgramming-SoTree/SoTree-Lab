<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="globals.css" />
    <link rel="stylesheet" href="Apply.css" />
    <link rel="stylesheet" href="../Nav/Nav.css" />
    <link rel="stylesheet" href="../Footer/Footer.css" />
    <meta name="viewport" content="width=divice-width">
    <meta charset="UTF-8">
    <title>Apply</title>
</head>
<body>
    <header>
        <%@include file="../Nav/Nav.jsp" %>
    </header>
    <%
        Connection conn = null;
        Statement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcurl = "jdbc:mysql://localhost:3306/sotree?serverTimezone=UTC";
            conn = DriverManager.getConnection(jdbcurl, "sotree", "0119");
            stmt = conn.createStatement();

            // 입력받은 정보를 변수에 저장
            String name = request.getParameter("name");
            String studentId = request.getParameter("studentId");
            String major = request.getParameter("major");
            String phone = request.getParameter("phone");

            // SQL 쿼리 작성 및 실행
            String insertSql = "INSERT INTO table_users (name, studentId, major, phone) VALUES ('" + name + "', " + studentId + ", '" + major + "', '" + phone + "')";
            stmt.executeUpdate(insertSql);
        }
        catch(Exception e){
            out.println("DB 연동 오류:"+e.getMessage());
        }
    %>
    <div class="wrapper">
        <div class="frame-wrapper">
            <div class="apply">지원하기</div>
            <form method="post" class="frame">   
                <div class="input-wrapper">
                    <p>이름</p>
                    <input type="text" name="name" class="input">
                </div>
                <div class="input-wrapper">
                    <p>학번</p>
                    <input type="text" name="studentId" class="input">
                </div>
                <div class="input-wrapper">
                    <p>학과</p>
                    <input type="text" name="major" class="input">
                </div>
                <div class="input-wrapper">
                    <p>전화번호</p>
                    <input type="text" name="phone" class="input">
                </div>
                <input type="submit" class="button" value="확인">
            </form>
        </div>
    </div>
    <%
        stmt.close();
        conn.close();
    %>
    <footer>
        <%@include file="../Footer/Footer.jsp" %>
    </footer>
</body>
</html>
