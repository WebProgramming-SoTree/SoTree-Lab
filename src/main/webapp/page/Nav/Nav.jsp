<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javabean.UserInfo" %>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="Nav.css" />
    <meta charset="UTF-8">
  </head>
  <body>
    <header class="header">
      <div id="logo">
        <a href="<%= request.getContextPath() %>/page/Home/Home.jsp">
        <img class="logo" alt="로고" src="<%= request.getContextPath() %>/page/Nav/logo.png" width="50px" height="50px"/>
        </a>
      </div>
      
      <div class="menu-bar">
        <ul>
          <li>
            <a href="<%= request.getContextPath() %>/page/Home/Home.jsp">소나무</a>
            <div class="sub-menu" style="background:#fff; top:35px"> 
             <ul>
              <li><a href="<%= request.getContextPath() %>/page/Home/Home.jsp#photo">Photo</a></li>
              <li><a href="<%= request.getContextPath() %>/page/Home/Home.jsp#about">About</a></li>
              <li><a href="<%= request.getContextPath() %>/page/Home/Home.jsp#member">Members</a></li>
            </ul>           
            </div>
          </li>
          <li>
            <a href="#">활동사진</a>
            <div class="sub-menu" style="background:#fff; top:35px">
            <ul>
              <li><a href="<%= request.getContextPath() %>/page/photo/photo.jsp">2023</a></li>
              <li><a href="#">Before</a></li>
            </ul>
            </div>
          </li>
          <li>
            <a href="#">공지사항</a>
            <div class="sub-menu" style="background:#fff; top:35px">
            <ul>
              <li><a href="<%= request.getContextPath() %>/page/notice/mainNotice.jsp">공지</a></li>
              <li><a href="#">Q&A</a></li>
            </ul>
            </div>
          </li>
        </ul>
      </div>
      
      <div class="login-wrapper">
	    <%
	        UserInfo userInfo = (UserInfo)session.getAttribute("userInfo");
	        if (userInfo != null) {
	    %>
	        <div class="user-name"><%= userInfo.getName() %> 님</div>
	        <div class="button">
	            <a class="logout" href="<%= request.getContextPath() %>/page/Home/Logout.jsp">로그아웃</a>
	        </div>
	    <%
	        } else {
	    %>
	        <div class="button">
	            <a class="login" href="<%= request.getContextPath() %>/page/Login/Login.jsp">로그인</a>
	        </div>
	    <%
	        }
	    %>
      </div>
      </header>
  </body>
</html>