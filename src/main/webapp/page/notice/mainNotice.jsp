<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="./mainNotice.css" rel="stylesheet" />
<title>공지사항</title>
</head>
<body>
	<div class="headerNotice">
		<div class="img_soTree"></div>
		<div class="titleNotice">2023년 제 1회 대동연화</div>

		<div class="img_soTree"></div>
		<div class="titleNotice">냉장고 이용 수칙</div>

		<div class="img_soTree"></div>
		<div class="titleNotice">두 번째 출사 공지</div>
	</div>

	<div class="Title">공지 사항</div>
	<div style="position: relative; top: 50px;">

		<h3 class="hrTitleText">총 5개의 게시물이 있습니다</h3>

		<div class="container">
			<form action="">
				<button id="btn_register" type="submit" class="btn_register" onclick="location=window.open('makeNewNotice.jsp')">등록하기</button>
			</form>
		</div>

		<div id="board-list">
			<div class="container">
				<table class="board-table">
					<thead>
						<tr>
							<th scope="col" class="th-num">번호</th>
							<th scope="col" class="th-title">제목</th>
							<th scope="col" class="th-date">등록일</th>
							<th scope="col" class="th-writer">작성자</th>
							<th scope="col" class="th-seeNum">조회수</th>
						</tr>
					</thead>

					<%
						int notice_num, refer_num;
						int rownum = 0;
						Connection conn = null;
						Statement stmt = null;
						String sql = null;
						ResultSet rs = null;
				
						try{
							Class.forName("com.mysql.jdbc.Driver");
							String url = "jdbc:mysql://localhost:3306/sotree?serverTimezone=UTC";
							conn = DriverManager.getConnection(url, "sotree", "0119");
							stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
							sql = "select * from table_notice order by refer_num desc, notice_num asc ";
							rs = stmt.executeQuery(sql);
						}
						catch(Exception e){
							out.println("DB 연동 오류입니다.:" + e.getMessage());
						}
						rs.last();
						rownum = rs.getRow();
						rs.beforeFirst();
						
						while(rs.next()){
							notice_num = Integer.parseInt(rs.getString("notice_num"));
							refer_num = Integer.parseInt(rs.getString("refer_num"));
					%>

					<tbody>
						<tr>
							<td><%= notice_num %></td>
							<td><a href="detailNotice.jsp?id=<%=notice_num%>"><%= rs.getString("title") %></a></td>
							<td><%= rs.getString("notice_date") %></td>
							<td><%= rs.getString("writer") %></td>
							<td><%= refer_num %></td>
						</tr>
							
					</tbody>
					<%
						String id = rs.getString("id");
						String passwd = rs.getString("passwd");
						}
					%>
				</table>
				<%
					stmt.close();
					conn.close();
				%>
			</div>
		</div>
	</div>
</body>
</html>