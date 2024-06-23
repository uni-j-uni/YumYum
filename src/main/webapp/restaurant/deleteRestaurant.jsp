<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="../dbconn.jsp" %>
<%
	String restId=request.getParameter("id");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql="SELECT * FROM restaurant";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	if (rs.next()) {
		sql="DELETE FROM restaurant WHERE r_id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, restId);
		pstmt.executeUpdate();
	}
	else out.println("일치하는 도서가 없습니다.");
	
	if (rs!=null) rs.close();
	if (pstmt!=null) pstmt.close();
	if (conn!=null) conn.close();
	
	response.sendRedirect("editRestaurant.jsp?edit=delete");
%>