<%@ page contentType="text/html; charset=utf-8"%>
<%@ page errorPage="exceptionNoRestId.jsp"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp"%>

<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>식당 상세 정보</title>
<script type="text/javascript">
   function addToScrap() {
      if (confirm("식당을 즐겨찾기에 추가하시겠습니까?")) document.addForm.submit();
      else document.addForm.reset();
   }
</script>
</head>
<body>
<%@ include file="../menu.jsp"%>
	<div class="container py-4">
		<%
			String id = request.getParameter("id");
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM restaurant WHERE r_id='" + id + "'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
		%>
		<div class="row align-items-md-stretch text-center">
			<div class="col-md-5">
				<img src="../resources/images/<%=rs.getString("r_fileName")%>" style="width: 70%">
			</div>
			<div class="col-md-6">
				<h3><b><%=rs.getString("r_name")%></b></h3>
				<p><%=rs.getString("r_description")%>
				<p> <b>식당코드 : </b><span class="badge text-bg-danger"><%=rs.getString("r_id")%></span>
				<p> <b>분류</b> : <%=rs.getString("r_category")%>
				<p> <b>즐겨찾기 수</b> : <%=rs.getString("r_scrapCount")%>
				<p> <b>주소</b> : <%=rs.getString("r_address")%>
				<h4> 가격 : <%=rs.getString("r_unitPrice")%>원대 </h4>
				<div id="map" style="width: 100%; height: 350px;"></div>
				<p>
				<form name="addForm" action="../scrap/addScrap.jsp?restId=<%=rs.getString("r_id")%>" method="post">
                    <button type="button" class="btn btn-warning" onclick="addToScrap()"><i class="bi bi-bookmark-plus-fill"></i> 즐겨찾기 추가</button>
                    <a href="../reserve/reserveInfo.jsp?restId=<%=rs.getString("r_id")%>" class="btn btn-success"><i class="bi bi-pencil"></i> 예약하기</a>
                    <a href="javascript:history.back();" class="btn btn-secondary"><i class="bi bi-arrow-90deg-left"></i> 이전화면</a>
                </form>
			</div>
		</div>
		<%@ include file="../footer.jsp"%>
	</div>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=598e0a4157b9b125fff967a4a6f20660&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'),
    mapOption = {
        center: new kakao.maps.LatLng(37.6148855, 127.0133508), // 지도의 중심좌표(서경대 북악관)
        level: 1 	// 지도의 확대 레벨
    };  

var map = new kakao.maps.Map(mapContainer, mapOption);			// 지도 생성 
var geocoder = new kakao.maps.services.Geocoder();				// 주소-좌표 변환 객체 생성
geocoder.addressSearch('<%=rs.getString("r_address")%>', function(result, status) { 
     if (status === kakao.maps.services.Status.OK) {
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        var marker = new kakao.maps.Marker({					// 결과값으로 받은 위치를 마커로 표시
            map: map,
            position: coords
        });

        var infowindow = new kakao.maps.InfoWindow({			// 해당 장소에 대한 이름 표시
            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=rs.getString("r_name")%></div>'
        });
        infowindow.open(map, marker);
        map.setCenter(coords);			// 지도를 결과값으로 받은 위치로 이동
    } 
});    
</script>
<%
	}
%>
</html>