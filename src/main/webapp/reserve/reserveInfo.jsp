<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script type="text/javascript">
	function checkForm() {
		if (!document.newReserve.name.value) {
			alert("예약자명을 입력하세요.");
			return false;
		}
		
		var format = /^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		if (!format.test(document.newReserve.reserveDate.value))
		{
			alert("예약일을 형식에 맞춰 입력해주세요.\nEx) 2024-06-14");
			return false;
		}

		if (!document.newReserve.numberOfPerson.value) {
			alert("예약인원을 입력하세요.");
			return false;
		}
		
		else if (document.newReserve.numberOfPerson.value > 10 || document.newReserve.numberOfPerson.value < 1) {
			alert("예약인원은 1명 이상 10명 이하로만 가능합니다.");
			return false;
		}
		
		var format = /^([0][1][0-9])-([0-9][0-9][0-9][0-9])-([0-9][0-9][0-9][0-9])$/;
		if (!format.test(document.newReserve.phoneNumber.value)) {
			alert("전화번호를 형식에 맞춰 입력하세요.\nEx)010-1234-5678");
			return false;
		}
	}
</script>
<title>예약 정보</title>
</head>
<body>
<%@ include file="../menu.jsp" %>
<div class="container py-4">
	<%
		String memberId = (String)session.getAttribute("sessionId");
		if (memberId == null || memberId.trim().equals("")) {
			response.sendRedirect("../member/loginMember.jsp");
			return;
		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM member WHERE id='" + memberId + "'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		rs.next();
	%>
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">예약 정보</h1>
			<p class="col-md-8 fs-4">Reservation Info</p>
		</div>
	</div>
	
	<div class="row align-items-md-stretch">
		<form name="newReserve" action="./processReserveInfo.jsp" method="post" onsubmit="return checkForm()">
			<input type="hidden" name="restId" value="<%=request.getParameter("restId") %>">
			<div class="mb-3 row">
				<label class="col-sm-2">예약자명</label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control" value=<%=rs.getString("name") %>>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">예약일</label>
				<div class="col-sm-3">
					<input type="text" name="reserveDate" class="form-control" placeholder="(년-월-일)">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">예약인원</label>
				<div class="col-sm-3">
					<input type="text" name="numberOfPerson" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input type="text" name="phoneNumber" class="form-control" value=<%=rs.getString("phone") %> >
				</div>
			</div>
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10">
					<a href="../restaurant/restaurant.jsp?id=<%=request.getParameter("restId") %>" class="btn btn-secondary" role="button"> 이전 </a>
					<input type="submit" class="btn btn-primary" value="등록" />
					<a href="./reserveCancel.jsp" class="btn btn-secondary" role="button"> 취소 </a>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp" />
</div>
</body>
</html>