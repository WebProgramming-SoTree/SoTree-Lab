<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="./mainNotice.css" rel="stylesheet" />
<link rel="stylesheet" href="./photo.css" />
<link rel="stylesheet" href="../Nav/Nav.css" />
<link rel="stylesheet" href="../Footer/Footer.css" />
<link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;500;600;800&display=swap"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Noto Sans KR:wght@900&display=swap"
    />
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>photo</title>
</head>
<body>
<header>
		<%@include file="../Nav/Nav.jsp"%>
	</header>
    <div class="div">
      <img class="child" alt="" src="./public/rectangle-1083@2x.png" />

      <div class="item"></div>
      <div class="inner"></div>
      <div class="rectangle-div"></div>
      <a class="rectangle-a" href="./photoDetail1.html"> </a>
      <a class="child1" href="./photoDetail2.html"> </a>
      <a class="child2" href="./photoDetail.html"> </a>
      <div class="child3"></div>
      <div class="div1">롯데월드 출사</div>
      <div class="div2">에버랜드 출사</div>
      <div class="div3">ＭＴ</div>
      <div class="div4">소나무 활동 돌아보기</div>
      <div class="div5">소나무의 1년을 돌아볼까요?</div>
      <div class="c-o-m">C o m i n g S o o n</div>
    </div>
    <footer>
			<%@include file="../Footer/Footer.jsp"%>
		</footer>
  </body>