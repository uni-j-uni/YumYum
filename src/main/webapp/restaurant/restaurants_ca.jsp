<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
    <title>식당 목록</title>
    <style>
        .category-buttons {
            text-align: center;
            margin-bottom: 20px;
        }
        .category-buttons button {
            margin: 0 5px;
        }
        .restaurant-card img {
            height: 200px;
            object-fit: cover;
        }
        .restaurant-card {
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .card-body {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }
        .card-text p {
            margin: 0;
        }
    </style>
</head>
<body>
 <%@ include file="../menu.jsp"%>
    <div class="container py-4">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="category-buttons">
                        <button type="button" onclick="setCategory('전체')" class="btn btn-danger">전체</button>
                        <button type="button" onclick="setCategory('한식')" class="btn btn-outline-danger">한식</button>
                        <button type="button" onclick="setCategory('일식')" class="btn btn-outline-danger">일식</button>
                        <button type="button" onclick="setCategory('중식')" class="btn btn-outline-danger">중식</button>
                        <button type="button" onclick="setCategory('양식')" class="btn btn-outline-danger">양식</button>
                        <button type="button" onclick="setCategory('분식')" class="btn btn-outline-danger">분식</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container py-4">
            <%@ include file="../dbconn.jsp" %>
            <div class="row">
                <%
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    String sql = "SELECT * FROM restaurant";
                    pstmt = conn.prepareStatement(sql);
                    rs = pstmt.executeQuery();
                    while (rs.next()) {
                %>
                <div class="col-md-4 restaurant" data-category="<%=rs.getString("r_category")%>">
                    <div class="card restaurant-card">
                        <img src="../resources/images/<%=rs.getString("r_filename")%>" class="card-img-top" alt="<%=rs.getString("r_name")%>">
                        <div class="card-body">
                            <h5 class="card-title"><b><%=rs.getString("r_name")%></b></h5>
                            <p class="card-text">
                                <%=rs.getString("r_category")%> | 즐겨찾기 수 : <%=rs.getString("r_scrapCount")%>
                                <br> 주소 : <%=rs.getString("r_address")%>
                            </p>
                            <a href="./restaurant.jsp?id=<%=rs.getString("r_id")%>" class="btn btn-outline-info">ℹ<strong>상세정보</strong>ℹ</a>
                        </div>
                    </div>
                </div>
                <%
                    }
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                %>
            </div>
            <%@ include file="../footer.jsp"%>
        </div>
    </div>
    <script type="text/javascript">
        function setCategory(category) {
            var elements = document.getElementsByClassName('restaurant');

            for (var i = 0; i < elements.length; i++) {
                var element = elements[i];
                if (category === '전체' || element.getAttribute('data-category') === category) {
                    element.style.display = 'block';	// 해당 카테고리이거나 '전체' 버튼이 클릭된 경우 보이기
                } else {
                    element.style.display = 'none';		// 그 외의 경우 숨기기
                }
            }
        }
    </script>
</body>
</html>
