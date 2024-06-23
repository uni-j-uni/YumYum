<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
    <title>정보 편집</title>
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
        }
        .card-text p {
            margin: 0;
        }
    </style>
    <script type="text/javascript">
        function deleteConfirm(id) {
            if (confirm("해당 식당을 삭제합니다!!") == true) location.href = "./deleteRestaurant.jsp?id=" + id;
            else return;
        }
    </script>
</head>
<%
    String edit = request.getParameter("edit");
%>
<body>
    <%@ include file="../menu.jsp" %>
    <div class="container py-4">
        <%@ include file="../dbconn.jsp" %>
        <div class="row align-items-md-stretch text-center">
            <%
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                String sql = "SELECT * FROM restaurant";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                while (rs.next()) {
            %>
            <div class="col-md-4">
                <div class="card restaurant-card h-100 p-2 rounded-3">
                    <img src="../resources/images/<%=rs.getString("r_filename") %>" class="card-img-top" alt="<%=rs.getString("r_name") %>" />
                    <div class="card-body">
                        <h5 class="card-title"><b><%=rs.getString("r_name") %></b></h5>
                        <p class="card-text">
                            <%=rs.getString("r_category") %>
                        </p>
                        <%
                            if (edit.equals("update")) {
                        %>
                        <a href="./updateRestaurant.jsp?id=<%=rs.getString("r_id") %>" class="btn btn-success" role="button">수정 &raquo;</a>
                        <%
                            } else if (edit.equals("delete")) {
                        %>
                        <a href="#" onclick="deleteConfirm('<%=rs.getString("r_id") %>')" class="btn btn-danger" role="button">삭제 &raquo;</a>
                        <%
                            }
                        %>
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
        <%@ include file="../footer.jsp" %>
    </div>
</body>
</html>
