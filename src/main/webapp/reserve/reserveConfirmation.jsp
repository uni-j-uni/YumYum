<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import ="java.net.URLDecoder" %>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp"%>

<%
	String memberId=(String)session.getAttribute("sessionId");
	request.setCharacterEncoding("UTF-8");
	
	String reserve_restId="";
	String reserve_name="";
	String reserve_reserveDate="";
	String reserve_numberOfPerson="";
	String reserve_phoneNumber="";
	
	Cookie[] cookies=request.getCookies();
	
	if (cookies!=null) {
		for (int i=0; i < cookies.length; i++) {
			Cookie thisCookie=cookies[i];
			String n=thisCookie.getName();
			if (n.equals("Reserve_restId")) reserve_restId=URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Reserve_name")) reserve_name=URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Reserve_reserveDate")) reserve_reserveDate=URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Reserve_numberOfPerson")) reserve_numberOfPerson=URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Reserve_phoneNumber")) reserve_phoneNumber=URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
	PreparedStatement pstmt = null;
	ResultSet rs1 = null, rs2 = null;
	
	String sql1 = "SELECT * FROM restaurant WHERE r_id='" + reserve_restId + "'";
	pstmt = conn.prepareStatement(sql1);
	rs1 = pstmt.executeQuery();
	while(rs1.next()) {
	
	String sql2 = "SELECT * FROM reserve WHERE reserveId='" + reserve_restId + "'";
	pstmt = conn.prepareStatement(sql2);
	rs2 = pstmt.executeQuery();
	if (rs2.next() == true) response.sendRedirect("../restaurant/restaurant.jsp?id=" + reserve_restId);
	else {
%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>예약 정보</title>
</head>
<body>
<%@ include file="../menu.jsp" %>
<div class="container py-4">
	<div class="row align-items-md-stretch alert alert-info">
		<div class="text-center">
			<h1>예약 확인</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<br> 예약자명 : <% out.println(reserve_name); %>
				<br> 예약인원 : <% out.println(reserve_numberOfPerson); %>명
				<br> 전화번호 : <% out.println(reserve_phoneNumber); %>
			</div>
			<div class="col-4" align="right">
				<p><em>예약일 : <% out.println(reserve_reserveDate); %></em>
			</div>
		</div>
		<div class="py-5">
			<table class="table table-hover">
			<tr>
				<th class="text-center">식당</th>
				<th class="text-center">주소</th>
			</tr>
			<tr>
			<td class="text-center"><em><%=reserve_restId %></em></td>
			<td class="text-center"><%=rs1.getString("r_address") %></td>
			</tr>
			<tr>
			<td> </td>
			<td> </td>
			</tr>
			</table>
			<a href="./reserveInfo.jsp?restId=<%=reserve_restId %>" class="btn btn-secondary" role="button"> 이전 </a>
			<a href="./reserveComplete.jsp" class="btn btn-success" role="button" 
			onClick=<%
				String sql3 = "INSERT INTO reserve VALUES(?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql3);
				pstmt.setString(1, memberId) ;
				pstmt.setString(2, reserve_restId);
				pstmt.setString(3, reserve_name);
				pstmt.setString(4, reserve_reserveDate);
				pstmt.setString(5, reserve_numberOfPerson);
				pstmt.setString(6, reserve_phoneNumber);
				pstmt.executeUpdate();
				}}
			%>> 예약 완료 </a>
			<a href="./reserveCancel.jsp" class="btn btn-secondary" role="button"> 취소 </a>
		</div>
	</div>
</div>
</body>
</html>