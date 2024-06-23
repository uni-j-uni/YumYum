<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp"%>

<%
	String restId = request.getParameter("restId");
	long scrap = 0;
	
	if (restId == null || restId.trim().equals("")) {
		response.sendRedirect("welcome.jsp");
		return;
	}
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql1 = "SELECT * FROM restaurant WHERE r_id='" + restId + "'";
	pstmt = conn.prepareStatement(sql1);
	rs = pstmt.executeQuery();
	
	while (rs.next()) {
		scrap = rs.getLong("r_scrapCount");
		String sql2 = "DELETE FROM scrap WHERE r_id='" + restId + "'";
		pstmt = conn.prepareStatement(sql2);
		pstmt.executeUpdate();
	}
	
	String sql3 = "UPDATE restaurant SET r_scrapCount=(?) WHERE r_id='" + restId + "'";
	pstmt = conn.prepareStatement(sql3);
	pstmt.setLong(1, scrap - 1);
	pstmt.executeUpdate();
	
	response.sendRedirect("scrap.jsp");
%>