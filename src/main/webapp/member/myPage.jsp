<%@page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            background-color: #f0f0f0;
        }
        .btn-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 20px;
            max-width: 300px;
            margin: auto;
        }
        .btn {
            width: 100%;
            max-width: 250px;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>MyPage</title>
</head>
<body>
    <div>
        <%@include file="../menu.jsp"%>
    </div>
    <div class="container py-4">
        <div class="btn-container">
            <button onclick="location.href='../reserve/reserveComplete.jsp'" class="btn btn-lg btn-danger" type="button"> <i class="bi bi-calendar-check"></i> <strong>예약 내역</strong> </button>
            <button onclick="location.href='../scrap/scrap.jsp'" class="btn btn-lg btn-warning" type="button"> <i class="bi bi-bookmark-star-fill"></i> <strong>즐겨찾기 목록</strong> </button>
            <button onclick="location.href='./updateMember.jsp'" class="btn btn-lg btn-info" type="button"> <i class="bi bi-pencil"></i> <strong>내 정보 수정</strong> </button>
        </div>
    </div>
    <div>
        <%@include file ="../footer.jsp" %>
    </div>
</body>
</html>
