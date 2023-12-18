<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
	
	<div class="frame-wrapper">
		<div class="frame">
			<div class="background">
				<div class="rectangle"></div>
				<img class="tree" src="./resource/tree.svg">
				<img class="eclipse" src="./resource/eclipse.svg">
				<div class="eclipse2"></div>
				<div class="eclipse3"></div>
				<div class="eclipse4"></div>
				<div class="eclipse5"></div>
				<div class="text-wrapper">
					<div class="text1">Hello World?</div>
					<p class="text2">알고리즘, 자료구조...복잡한 컴퓨터 전공으로 지친 당신에게
					새로운 휴식처를 제공합니다. 쑥쑥 자라나는 소나무처럼 함께
					웃고, 공부하고, 출사하러 가요~!
					</p>
					<div><a class="apply-button" href="<%= request.getContextPath() %>/page/Apply/Apply.jsp">지원하기</a></div>
				</div>							
			</div>
		</div>
		
		<div class="frame2">
			<div class="content-wrapper">
				<div class="content">
					<div class="text3">
					500+
					</div>
					<div class="text4">
					출사 사진 수
					</div>
				</div>
				<div class="content">
					<div class="text3">
					124
					</div>
					<div class="text4">
					23-2학기 인원 수
					</div>
				</div>
				<div class="content">
					<div class="text3">
					since1970
					</div>
					<div class="text4">
					역사 깊은 소모임
					</div>
				</div>
				<div class="content">
					<div class="text3">
					2k+
					</div>
					<div class="text4">
					관심도 상승 중
					</div>
				</div>													
			</div>
		</div>
		<div class="frame-wrapper2">
			<div class="frame-photo" id="photo">
			  <div class="photo-contents">
			    <div class="title-photo">Photo</div>
			    <img class="photo active" id="photo1" src="./resource/home1.jpg">
			    <img class="photo" id="photo2" src="./resource/home2.jpg">
			    <img class="photo" id="photo3" src="./resource/home3.jpg">
			    <img class="photo" id="photo3" src="./resource/home4.jpg">
			    <img class="arrow left" onclick="prevPhoto()" src="./resource/left.svg">
			    <img class="arrow right" onclick="nextPhoto()" src="./resource/right.svg">
			  </div>
			
			  <script>
			    var currentPhoto = 1;
			
			    function prevPhoto() {
			      if (currentPhoto > 1) {
			        currentPhoto--;
			      } else {
			        currentPhoto = 4;
			      }
			      updatePhoto();
			    }
			
			    function nextPhoto() {
			      if (currentPhoto < 4) {
			        currentPhoto++;
			      } else {
			        currentPhoto = 1;
			      }
			      updatePhoto();
			    }
			
			    function updatePhoto() {
			      var photos = document.querySelectorAll('.photo');
			      photos.forEach((photo, index) => {
			        if (index + 1 === currentPhoto) {
			          photo.classList.add('active');
			        } else {
			          photo.classList.remove('active');
			        }
			      });
			    }
			  </script>
			</div>
			
			<div class="frame-about" id="about">	
				<div class="about-contents">
					<div class="title-about">About</div>
					<p class="text-about">소나무는 1970년에 시작된 컴퓨터공학과 사진 동아리입니다.</p>
					<p class="text2-about">활동 내용<br><br>
					-한강, 축제 등으로 출사<br>
					-개강총회, 종강총회 진행<br>
					-원하는 과목 스터디 진행<br>
					-다양한 학술정보와 선배들과의 교류
					</p>
					<img class="image-about" src="./resource/soRoom.png">		
				</div>
			</div>
		</div>
		
		
		<div class="frame-member" id="member">
			<div class="member-contents">
				<div class="title-member">Member</div>
				<img class="image-member" src="./resource/member.jpg">
				<div class="text-member"><h2>2023년 2학기 운영진</h2><br>
				회장: 김민정(컴퓨터공학과)<br><br>
				부회장: 박지현(컴퓨터공학과)<br><br>
				총무: 윤민웅(컴퓨터공학과)<br><br>
				</div>
			</div>
		</div>
	</div>
	<footer>
	<%@include file="../Footer/Footer.jsp" %>
	</footer>
  </body>
</html>
