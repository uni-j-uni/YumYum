<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp"%>
<%
	String name = (String) request.getAttribute("name");
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Review Board</title>
</head>
<script type="text/javascript">
	function checkForm() {
		if (!document.newWrite.name.value) {
			alert("성명을 입력하세요.");
			return false;
		}
		if (!document.newWrite.subject.value) {
			alert("제목을 입력하세요.");
			return false;
		}
		if (!document.newWrite.content.value) {
			alert("내용을 입력하세요.");
			return false;
		}	
		if (!document.newWrite.address.value) {
			alert("주소를 입력하세요.");
			return false;
		}	
	}
</script>
<body>S
<div class="container py-4">
	<jsp:include page="../menu.jsp" />
	
	 <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">맛집 리뷰 게시판</h1>
        <p class="col-md-8 fs-4">Review Board</p>      
      </div>
    </div>
	<div class="row align-items-md-stretch   text-center">	 	
		<form name="newWrite" action="./BoardWriteAction.do"  method="post" onsubmit="return checkForm()">
			<input name="id" type="hidden" class="form-control" value="${sessionId}">
			<div class="mb-3 row">
				<label class="col-sm-2 control-label" >아이디</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" value="${sessionId}" placeholder="name">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 control-label" >제목</label>
				<div class="col-sm-5">
					<input name="subject" type="text" class="form-control" placeholder="subject">
				</div>
			</div>
		<div class="mb-3 row">
				<label class="col-sm-2 control-label" >내용</label>
				<div class="col-sm-8">
					<textarea name="content" cols="50" rows="5" class="form-control"placeholder="content"></textarea>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 control-label" >주소</label>
				<div class="col-sm-5">
					<input name="address" type="text" class="form-control" placeholder="address">
				</div>
			</div>
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10 ">
				 <input type="submit" class="btn btn-success" value="등록">				
					<input onclick="location.href='BoardListAction.do?pageNum=1'" type="reset" class="btn btn-danger" value="취소">
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp" />
	</div>
</body>
</html>