<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javabean.BoardList"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="./detailNotice.css" rel="stylesheet" />
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>공지사항-세부</title>
</head>
<script type="text/javascript"> 
 	function closePopup() {

 		//window.location.replace("../mainNotice.jsp");
 		window.close();
 		response.sendRedirect("../mainNotice.jsp");
 		
 	}
</script>
<body>
	<center>
		<h2>게시글 내용</h2>
	</center>
	<center>
		<%
		int notice_num, refer_num = 0;
		int row_pin_num = 0, new_pin_num = 0, cnt;
		String title = "", writer = "", content = "";
		Date notice_date;
		Connection conn = null;
		Statement stmt = null;
		Statement stmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;

		String noticeNumParam = request.getParameter("notice_num");
		notice_num = (noticeNumParam != null && !noticeNumParam.isEmpty()) ? Integer.parseInt(noticeNumParam) : 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/sotree?serverTimezone=UTC";
			conn = DriverManager.getConnection(url, "sotree", "0119");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String sql = "SELECT table_notice.*, table_users.name FROM table_notice INNER JOIN table_users ON table_notice.user_id = table_users.id WHERE notice_num = "
			+ notice_num + "";
			rs = stmt.executeQuery(sql);

			stmt2 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String sql2 = "select count(*) as cnt, max(pin_num) as max_pin_num from table_pin";
			rs2 = stmt2.executeQuery(sql2);

		} catch (Exception e) {
			out.println("DB 연동 오류입니다.:" + e.getMessage());
		}

		while (rs2.next()) {
			cnt = Integer.parseInt(rs2.getString("cnt"));
			if (cnt != 0) {
				new_pin_num = Integer.parseInt(rs2.getString("max_pin_num"));
			}
		}

		BoardList boardList = new BoardList();
		while (rs.next()) {
			notice_num = Integer.parseInt(rs.getString("notice_num"));
			title = rs.getString("title");
			writer = rs.getString("name");
			refer_num = Integer.parseInt(rs.getString("refer_num"));
			content = rs.getString("content");

			boardList.setNoticeNum(notice_num);
			session.setAttribute("boardList", boardList);
		%>
		<div class="headerNotice">
			<table border="0" width="500" class="board-table">
			<tr>
				<td width="100"> 글 쓴 이:
				</td>
				<td><%=writer%></td>
			</tr>
			<tr>
				<td>글 제 목:</td>
				<td><%=title%></td>
			</tr>
			<tr>
				<td>글 내 용:</td>
				<td><%=content%></td>
			</tr>
			<tr>
				<td>작성 일자:</td>
				<td><%=rs.getDate("notice_date")%></td>
			</tr>
		</table>		
		</div>
		<br>
		<br>
		<%
		}

		BoardList boardList2 = (BoardList) session.getAttribute("boardList");
		notice_num = boardList2.getNoticeNum();

		if (request.getParameter("addPin") != null) {
		try {
			++new_pin_num;

			String insertPinSQL = "INSERT INTO table_pin (pin_num, notice_num) VALUES (?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(insertPinSQL);
			pstmt.setInt(1, new_pin_num);
			pstmt.setInt(2, notice_num);
			pstmt.executeUpdate();
			
			response.sendRedirect("../mainNotice.jsp");
		} catch (SQLException e) {
			out.println("SQL 오류입니다.:" + e.getMessage());
		}

		}

		stmt.close();
		stmt2.close();
		conn.close();
		rs.close();
		rs2.close();
		%>


			<div class="modify">
			<a href="../modify/modifyNotice.jsp?notice_num=<%=notice_num%>">게시글수정</a> 
		<a href="../modify/deleteNotice.jsp?notice_num=<%=notice_num%>">게시글 삭제</a> 
		<a href="" onclick="closePopup();">게시글 목록 보기</a> 
		<a href="?addPin=true" onclick="closePopup();">게시글 공지로 등록</a>
			</div>


	</center>
</body>
</html>