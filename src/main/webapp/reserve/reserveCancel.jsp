<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>예약 취소</title>
</head>
<body>
<%@ include file="../menu.jsp" %>
<div class="container py-4">
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">예약 취소</h1>
			<p class="col-md-8 fs-4">Order Cancellation</p>
		</div>
	</div>
	<div class="row align-items-md-stretch">
		<h2 class="alert alert-danger">예약이 취소되었습니다.</h2>
	</div>
	<div class="container">
		<p> <a href="../welcome.jsp" class="btn btn-success">메인 화면</a>
	</div>
	<%@ include file="../footer.jsp" %>
</div>
</body>
</html>