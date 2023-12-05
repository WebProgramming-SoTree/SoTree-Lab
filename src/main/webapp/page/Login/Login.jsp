<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="globals.css" />
    <link rel="stylesheet" href="Login.css" />
    <link rel="stylesheet" href="../Nav/Nav.css" />
    <link rel="stylesheet" href="../Footer/Footer.css" />
    <meta name="viewport" content="width=device-width">
    <meta charset="UTF-8">
    <title>Apply</title>
</head>
<body>
    <header>
        <%@include file="../Nav/Nav.jsp" %>
    </header>
    <div class="wrapper">
        <div class="frame-wrapper">
            <div class="apply">로그인</div>
            <form method="post" class="frame" action="LoginProcess.jsp">   
                <div class="input-wrapper">
                    <p>이름</p>
                    <input type="text" name="name" class="input">
                </div>
                <div class="input-wrapper">
                    <p>학번</p>
                    <input type="text" name="studentId" class="input">
                </div>
                <input type="submit" class="button" value="확인">
            </form>
        </div>
    </div>
    <footer>
        <%@include file="../Footer/Footer.jsp" %>
    </footer>
</body>
</html>
