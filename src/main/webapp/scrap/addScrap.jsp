<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp"%>

<%
	String restId = request.getParameter("restId");
	String name = null;
	long scrap = 0;
	String memberId = (String)session.getAttribute("sessionId");
	
	if (memberId == null || memberId.trim().equals("")) {
		out.println("<script>alert('로그인 후 추가 가능합니다.'); history.back(); </script>");
		return;
	}
	
	if (restId == null || restId.trim().equals("")) {
		out.println("<script>alert('해당 식당을 찾을 수 없습니다.');</script>");
		response.sendRedirect("../welcome.jsp");
		return;
	}
	
	PreparedStatement pstmt = null;
	ResultSet rs1 = null, rs2 = null;
	
	String sql1 = "SELECT * FROM restaurant WHERE r_id='" + restId + "'";
	pstmt = conn.prepareStatement(sql1);
	rs1 = pstmt.executeQuery();
	while (rs1.next()) {
		name = rs1.getString("r_name");
		scrap = rs1.getLong("r_scrapCount");
	}
	
	String sql2 = "SELECT * FROM scrap WHERE r_id='" + restId + "' AND m_id='" + memberId + "'";
	pstmt = conn.prepareStatement(sql2);
	rs2 = pstmt.executeQuery();
	
	if (rs2.next() == false) {
		String sql3 = "INSERT INTO scrap VALUES(?,?,?)";
		pstmt = conn.prepareStatement(sql3);
		pstmt.setString(1, restId);
		pstmt.setString(2, name);
		pstmt.setString(3, memberId);
		pstmt.executeUpdate();
		
		String sql4 = "UPDATE restaurant SET r_scrapCount=(?) WHERE r_id='" + restId + "'";
		pstmt = conn.prepareStatement(sql4);
		pstmt.setLong(1, scrap + 1);
		pstmt.executeUpdate();
	}
	
	if (pstmt != null) pstmt.close();
	if (conn != null) conn.close();
	
	response.sendRedirect("../restaurant/restaurant.jsp?id=" + restId);
%>