<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp"%>
<html>
<%
	String memberId = (String)session.getAttribute("sessionId");
%>
<head>
    <title>즐겨찾기</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-g0de1qaXWLn0pDqF+BrYwLOelks8O2xJlG8ppRGoi3bGQx5oFrFl6oX8F1e4JL5R6CH3ZM4S+YggWZ6iYikl0Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .btn-back {
            margin-top: 20px;
        }
        .page-title {
            color: #FFD700;
            font-weight: bold;
            margin-bottom: 30px;
        }
        .table-container {
            margin-top: 30px;
        }
        .table-actions {
            width: 80px;
        }
        .btn-back {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <%@ include file="../menu.jsp"%>
    <div class="container">
        <div class="row">
            <div class="col">
                <h2 class="page-title"><i class="bi bi-bookmark-plus-fill"></i>즐겨찾기</h2>
                <div class="table-container">
                    <table class="table table-striped table-hover">
                        <thead class="table-primary">
                            <tr>
                                <th scope="col">식당코드</th>
                                <th scope="col">식당명</th>
                                <th scope="col">식당 주소</th>
                                <th scope="col" class="table-actions">삭제</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                PreparedStatement pstmt = null;
                                ResultSet rs1 = null, rs2 = null;
                                
                                String sql1 = "SELECT * FROM scrap WHERE m_id=?";
                                pstmt = conn.prepareStatement(sql1);
                                pstmt.setString(1, memberId);
                                rs1 = pstmt.executeQuery();
                                while (rs1.next()) {
                                    String r_id = rs1.getString("r_id");
                                    String sql2 = "SELECT * FROM restaurant WHERE r_id=?";
                                    pstmt = conn.prepareStatement(sql2);
                                    pstmt.setString(1, r_id);
                                    rs2 = pstmt.executeQuery();
                                    while (rs2.next()) {
                            %>
                            <tr>
                                <td><%= r_id %></td>
                                <td><a href="../restaurant/restaurant.jsp?id=<%= r_id %>"><%= rs1.getString("r_name") %></a></td>
                                <td><%= rs2.getString("r_address") %></td>
                                <td><a href="./removeScrap.jsp?restId=<%= r_id %>" class="btn btn-sm btn-outline-danger"><i class="fas fa-trash-alt"></i>삭제</a></td>
                            </tr>
                            <%
								}}
                            %>
                        </tbody>
                    </table>
                </div>
                <a href="../member/myPage.jsp" class="btn btn-secondary"> <i class="bi bi-arrow-90deg-left"></i> 이전화면 </a>
            </div>
        </div>
        <jsp:include page="../footer.jsp" />
    </div>
</body>
</html>
