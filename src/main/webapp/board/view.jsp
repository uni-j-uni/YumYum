<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="mvc.model.BoardDTO"%>

<%
	BoardDTO notice = (BoardDTO) request.getAttribute("board");
	int num = ((Integer) request.getAttribute("num")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Review Board</title>
</head>
<body>
<jsp:include page="../menu.jsp" />
	<div class="container py-4">
	 <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">맛집 리뷰 게시판</h1>
        <p class="col-md-8 fs-4">Review Board</p>      
      </div>
    </div>
		<div class="row align-items-md-stretch   text-center">	 
		<form name="newUpdate" action="BoardUpdateAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"  method="post">
				<div class="mb-3 row">
				<label class="col-sm-2 control-label" >아이디</label>
				<div class="col-sm-3">
					<input name="id" class="form-control" value=" <%=notice.getId()%>">
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2 control-label" >제목</label>
				<div class="col-sm-5">
					<input name="subject" class="form-control" value=" <%=notice.getSubject()%>" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 control-label" >내용</label>
				<div class="col-sm-8" style="word-break: break-all;">
					<textarea name="content" class="form-control" cols="50" rows="5"> <%=notice.getContent()%></textarea>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 control-label" >주소</label>
				<div class="col-sm-5">
					<input name="address" class="form-control" value=" <%=notice.getAddress()%>" >
				</div>
			</div>
			<div id="map" style="width:100%;height:350px;"></div>
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<c:set var="userId" value="<%=notice.getId()%>" />
					<c:if test="${sessionId==userId}">
						<p>
							<a	href="./BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>"	class="btn btn-danger">삭제</a> 
							<input type="submit" class="btn btn-success" value="수정">
					</c:if>
					<a href="./BoardListAction.do?pageNum=<%=nowpage%>" class="btn btn-primary">목록</a>
				</div>
			</div>
		</form>
	
	</div>
	<jsp:include page="../footer.jsp" />
	</div>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=598e0a4157b9b125fff967a4a6f20660&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.6148855, 127.0133508), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('<%=notice.getAddress()%>', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
</html>