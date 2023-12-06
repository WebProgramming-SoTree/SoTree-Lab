<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="globals.css" />
    <link rel="stylesheet" href="Success.css" />
    <link rel="stylesheet" href="../../Nav/Nav.css" />
    <link rel="stylesheet" href="../../Footer/Footer.css" />
    <meta name="viewport" content="width=divice-width">
    <meta charset="UTF-8">
    <title>Apply-Success</title>
</head>
<body>
    <header>
        <%@include file="../../Nav/Nav.jsp" %>
    </header>
    <div class="wrapper">
        <div class="frame-wrapper">
			<div class="apply">회원가입</div>
			<div class="frame">
				<img class="image" src="../resource/check.svg">
				<div class="success-text">가입이<br>완료되었습니다.</div>
			</div>
        </div>
    </div>
    <footer>
        <%@include file="../../Footer/Footer.jsp" %>
    </footer>
</body>
</html>