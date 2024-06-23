<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>페이지 오류</title>
</head>
<body>
<jsp:include page="/menu.jsp"/>
<div class="container py-4">
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="alert alert-danger">등록하려는 ID가 이미존재합니다.</h1>
		</div>
	</div>
	<div class="row align-items-md-stretch">
		<div class="col-md-12">
			<div class="h-100 p-5">
				<p> <%=request.getRequestURL()%></p>
				<p> <a href="/YumYum/welcome.jsp" class="btn btn-secondary"> 메인 화면 </a>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</div>
</body>
</html>