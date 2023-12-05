<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="globals.css" />
    <link rel="stylesheet" href="Fail.css" />
    <link rel="stylesheet" href="../../Nav/Nav.css" />
    <link rel="stylesheet" href="../../Footer/Footer.css" />
    <meta name="viewport" content="width=divice-width">
    <meta charset="UTF-8">
    <title>Fail</title>
</head>
<body>
    <header>
        <%@include file="../../Nav/Nav.jsp" %>
    </header>
    <div class="wrapper">
        <div class="frame-wrapper">
			<div class="login">로그인</div>
			<div class="frame">
				<img class="image" src="../resource/fail.svg">
				<div class="fail-text">로그인 실패</div>
			</div>
        </div>
    </div>
    <footer>
        <%@include file="../../Footer/Footer.jsp" %>
    </footer>
</body>
</html>