<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <script>
        function showLogoutPopup() {
            alert("회원정보가 일치하지 않습니다.");
        }
    </script>
    <title>Login-Fail</title>
</head>
<body>
<script>
    // 로그아웃 후 팝업 창 띄우기
    showLogoutPopup();
    
    // 로그아웃 후 홈페이지 또는 다른 페이지로 리다이렉트
    setTimeout(function() {
        window.location.href = '<%= request.getContextPath() %>/page/Login/Login.jsp';
    }, 1000); // 1000ms(1초) 후에 리다이렉트
</script>
</body>
</html>