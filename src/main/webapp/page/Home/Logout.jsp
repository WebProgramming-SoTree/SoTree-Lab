<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>

<html>
<head>
    <script>
        function showLogoutPopup() {
            alert("로그아웃 되었습니다.");
        }
    </script>
</head>
<body>

<%
    // 세션 가져오기
    session = request.getSession(false);

    // 세션이 존재하면 세션을 무효화하여 삭제
    if (session != null) {
        session.invalidate();
    }
%>

<script>
    // 로그아웃 후 팝업 창 띄우기
    showLogoutPopup();
    
    // 로그아웃 후 홈페이지 또는 다른 페이지로 리다이렉트
    setTimeout(function() {
        window.location.href = '<%= request.getContextPath() %>/page/Home/Home.jsp';
    }, 1000); // 1000ms(1초) 후에 리다이렉트
</script>

</body>
</html>
