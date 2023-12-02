<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="globals.css" />
    <link rel="stylesheet" href="Home.css" />
    <link rel="stylesheet" href="../Nav/Nav.css" />
    <link rel="stylesheet" href="../Footer/Footer.css" />
    <meta name="viewport" content="width=divice-width">
    <meta charset="UTF-8">
    <title>Home</title>
  </head>
  <body>
      <header>
<%@include file="../Nav/Nav.jsp" %>
    </header>
    <div class="frame">
      <div class="overlap-group">
        <div class="group">
          <div class="rectangle"></div>
          <img class="ellipse" src="./resource/eclipse.svg" />
          <div class="div"></div>
          <div class="ellipse-2"></div>
          <div class="ellipse-3"></div>
        </div>
        <div class="frame-wrapper">
          <div class="div-2">
            <div class="div-wrapper"><div class="text-wrapper">Hello World?</div></div>
            <p class="p">
              알고리즘, 자료구조...복잡한 컴퓨터 전공으로 지친 당신에게 새로운 휴식처를 제공합니다. 쑥쑥 자라나는
              소나무처럼 함께 웃고, 공부하고, 출사하러 가요~!
            </p>
          </div>
        </div>
        <img class="element" src="./resource/tree.svg" />
        <div class="div-wrapper-2"><a class="text-wrapper-2" href="../Apply/Apply.jsp">지원하기</a></div>
      </div>
      </div>
        <div class="box">
         <div class="frame">
          <div class="text-wrapper-3">500+</div>
          <div class="text">출사 사진 수</div>
        </div>       
         <div class="frame">
          <div class="text-wrapper-3">124</div>
          <div class="text">23-2학기 인원 수</div>
        </div>       
        <div class="frame">
          <div class="text-wrapper-3">since 1970</div>
          <div class="text">역사 깊은 소모임</div>
        </div>
        <div class="frame">
          <div class="text-wrapper-3">2k+</div>
          <div class="text">관심도 상승 중</div>
        </div>
</div>
  </body>
</html>
