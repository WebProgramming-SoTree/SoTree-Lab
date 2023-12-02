<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
<div class="frame-wrapper">
<form class="frame">
	<div class="apply">지원하기</div>
	<div class="form">
		이름: <input type="text" name="name" class="input">
	</div>
	<div class="form">
		학번: <input type="text" name="studentID" class="input">
	</div>
		<div class="form">
		학과: <input type="text" name="major" class="input">
	</div>
</form>
</div>
<footer>
<%@include file="../Footer/Footer.jsp" %>
</footer>
  </body>
</html>