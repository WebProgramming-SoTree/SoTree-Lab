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
<link rel="stylesheet" href="../Nav/Nav.css" />
<link rel="stylesheet" href="../Footer/Footer.css" />
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>공지사항</title>
</head>

<script type="text/javascript">
  	function goDetailPopup(noticeNum) { 
  		var pop = window 
  				.open(
  						"./detailInfo/detailNotice.jsp?notice_num=" + noticeNum, 
  						"pop", 
  						"width=1000,height=500, scrollbars=yes, resizable=yes, top=200, left=300, location=no, toolbar=no, status=no, menubar=no"); 
  	}
</script>

<body>
	<header>
		<%@include file="../Nav/Nav.jsp"%>
	</header>


	<div class="frame-wrapper">
		<%
		int notice_num, refer_num;
		int rownum = 0, rownum2 = 0;
		Connection conn = null;
		Statement stmt = null;
		Statement stmt2 = null;
		String sql = null;
		String sql2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/sotree?serverTimezone=UTC";
			conn = DriverManager.getConnection(url, "sotree", "0119");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			sql = "SELECT table_notice.*, table_users.name FROM table_notice INNER JOIN table_users ON table_notice.user_id = table_users.id order by notice_num desc";
			rs = stmt.executeQuery(sql);

			stmt2 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			sql2 = "select table_pin.*, table_notice.title FROM table_pin INNER JOIN table_notice ON table_pin.notice_num = table_notice.notice_num order by pin_num desc";
			rs2 = stmt2.executeQuery(sql2);

		} catch (Exception e) {
			out.println("DB 연동 오류입니다.:" + e.getMessage());
		}
		rs.last();
		rownum = rs.getRow();
		rs.beforeFirst();

		rs2.last();
		rownum2 = rs2.getRow();
		rs2.beforeFirst();

		String[] title = new String[3]; // 배열 크기를 3으로 설정하고 있으니 필요에 따라 조절하세요.
		int temp = 0;

		while (rs2.next()) {
			if (temp == 3)
				break;
			title[temp] = rs2.getString("title");
			++temp;
		}
		%>
		<div class="headerNotice">
			<div class="notice">
				<img class="img_soTree" src="./resource/tree.png" />
				<div class="titleNotice">
					<%=title[0]%>
				</div>
			</div>
			<div class="notice">
				<img class="img_soTree" src="./resource/tree.png" />
				<div class="titleNotice">
					<%=title[1]%>
				</div>
			</div>
			<div class="notice">
				<img class="img_soTree" src="./resource/tree.png" />
				<div class="titleNotice">
					<%=title[2]%>
				</div>
			</div>
		</div>



		<div class="frame2">
			<div class="content-wrapper">
				<div class="Title">공지 사항</div>
			</div>
			<div style="top: 50px; flex-shrink: 0;">

				<h3 class="hrTitleText">
					총
					<%=rownum%>
					개의 게시물이 있습니다
				</h3>

				<div class="container">
					<form action="">
						<!-- 						<button id="btn_register" type="submit" class="btn_register" -->
						<!-- 							onclick="goPopup();">등록하기</button> -->
						<button id="btn_register" type="submit" class="btn_register"
							onclick="location=window.open('makeNewNotice.jsp')">등록하기</button>
					</form>
				</div>

				<div class="container2">
					<table class="board-table">
						<thead>
							<tr>
								<th scope="col" class="th-num">번호</th>
								<th scope="col" class="th-title">제목</th>
								<th scope="col" class="th-date">등록일</th>
								<th scope="col" class="th-writer">작성자</th>
							</tr>
						</thead>

						<%
						int displayedNoticeNum = rownum; // 총 행 수로 시작

						while (rs.next()) {

							notice_num = Integer.parseInt(rs.getString("notice_num"));
							refer_num = Integer.parseInt(rs.getString("refer_num"));
						%>


						<tbody>
							<tr>
								<td><%=displayedNoticeNum--%></td>
								<%-- 								<td><a href="./detailInfo/detailNotice.jsp?notice_num=<%=notice_num%>"><%=rs.getString("title")%></a></td> --%>
								<td><a href="" onclick="goDetailPopup(<%=notice_num%>)">
										<%=rs.getString("title")%></a></td>
								<td><%=rs.getDate("notice_date")%></td>
								<td><%=rs.getString("name")%></td>
								<%-- 							<td><%=refer_num%></td> --%>
							</tr>

						</tbody>
						<%
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
	</div>



	<footer>
		<%@include file="../Footer/Footer.jsp"%>
	</footer>
</body>
</html>