<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Process</title>
</head>
<body>
    <%
        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String jdbcurl = "jdbc:mysql://localhost:3306/sotree?serverTimezone=UTC";
            connection = DriverManager.getConnection(jdbcurl, "sotree", "0119");
            statement = connection.createStatement();

            String query = "SELECT * FROM table_users WHERE name='" + name + "' AND studentId='" + studentId + "'";
            resultSet = statement.executeQuery(query);

            if (resultSet.next()) {
                // 로그인 성공
                response.sendRedirect("../Home/Home.jsp");
            } else {
                // 로그인 실패
                response.sendRedirect("./Fail/Fail.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
