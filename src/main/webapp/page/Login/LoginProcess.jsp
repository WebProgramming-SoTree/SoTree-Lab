<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javabean.UserInfo"%>

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

        UserInfo userInfo = new UserInfo(); // 자바빈 객체 생성

        if (resultSet.next()) {
            // 로그인 성공
            // 가져온 정보를 자바빈 객체에 저장
            userInfo.setid(resultSet.getInt("id"));
            userInfo.setName(resultSet.getString("name"));
            userInfo.setStudentId(resultSet.getString("studentId"));
            userInfo.setMajor(resultSet.getString("major"));
            userInfo.setPhone(resultSet.getString("phone"));

            // 세션에 자바빈 객체 저장 (세션 이름은 "userInfo")
            session.setAttribute("userInfo", userInfo);

            response.sendRedirect("../Home/Home.jsp");
        } else {
            // 로그인 실패
            response.sendRedirect("./Fail.jsp");
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

