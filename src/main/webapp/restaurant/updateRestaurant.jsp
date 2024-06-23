<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>식당 정보 수정</title>
</head>
<body>
<%@include file="../menu.jsp"%>
	<div class="container py-4">
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="consainer-fluid py-5">
				<h1 class="display-5 fw-bold">식당 정보 수정</h1>
				<p class="col-md-8 fs-4">Restaurant Updating</p>
			</div>
		</div>
		<%@ include file="../dbconn.jsp"%>
		<%
		String restId = request.getParameter("id");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM restaurant WHERE r_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, restId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
		%>
		<div class="row align-items-md-stretch">
			<div class="col-md-5">
				<img src="../resources/images/<%=rs.getString("r_filename")%>"
					alt="image" style="width: 100%" />
			</div>
			<div class="col-md-7">
				<form name="newRestaurant" action="./processUpdateRestaurant.jsp"
					method="post" enctype="multipart/form-data">
					<div class="mb-3 row">
						<label class="col-sm-2">식당 코드</label>
						<div class="col-sm-5">
							<input type="text" name="restId" id="restId" class="form-control"
								value='<%=rs.getString("r_id")%>'>
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">식당명</label>
						<div class="col-sm-5">
							<input type="text" name="name" id="name" class="form-control"
								value='<%=rs.getString("r_name")%>'>
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">가격</label>
						<div class="col-sm-5">
							<input type="text" name="unitPrice" id="unitPrice"
								class="form-control" value='<%=rs.getString("r_unitPrice")%>'>
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">분류</label>
						<div class="col-sm-5">
							<input type="text" name="category" class="form-control"
								value='<%=rs.getString("r_category")%>'>
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">주소</label>
						<div class="col-sm-5">
							<input type="text" name="address" class="form-control"
								value='<%=rs.getString("r_address")%>'>
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">상세 정보</label>
						<div class="col-sm-8">
							<textarea name="description" id="description" rows="2" cols="50"
								class="form-control"><%=rs.getString("r_description")%></textarea>
						</div>
					</div>
					<div class="mb-3 row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-8">
							<input type="file" name="restaurantImage" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-primary" value="등록">
						</div>
					</div>
				</form>
			</div>
			<%
			}
			if (rs != null)
			rs.close();
			if (pstmt != null)
			pstmt.close();
			if (conn != null)
			conn.close();
			%>
		</div>
		<jsp:include page="../footer.jsp" />
	</div>
</body>
</html>