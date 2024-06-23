<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
    <script type="text/javascript" src="../resources/js/validation.js"></script>
    <title>식당 등록</title>
    <style>
        .form-label {
            font-weight: bold;
            color: #495057;
        }
        .form-control, .form-select {
            border-radius: 0.25rem;
            box-shadow: none;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 0.25rem;
            padding: 0.5rem 1rem;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
        .form-container {
            background-color: #f8f9fa;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .form-title {
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.5rem;
            font-weight: bold;
            color: #343a40;
        }
    </style>
</head>
<body>
    <fmt:setLocale value='<%=request.getParameter("language") %>' />
    <%@ include file="../menu.jsp" %>
    <div class="container py-4">
        <div class="form-container">
            <div class="form-title">식당 등록</div>
            <form name="newRestaurant" action="./processAddRestaurant.jsp" method="post" enctype="multipart/form-data">
                <div class="mb-3 row text-end">
                    <label for="restId" class="col-sm-2 col-form-label form-label">식당 코드</label>
                    <div class="col-sm-10">
                        <input type="text" id="restId" name="restId" class="form-control" required>
                    </div>
                </div>
                <div class="mb-3 row text-end">
                    <label for="name" class="col-sm-2 col-form-label form-label">식당명</label>
                    <div class="col-sm-10">
                        <input type="text" id="name" name="name" class="form-control" required>
                    </div>
                </div>
                <div class="mb-3 row text-end">
                    <label for="unitPrice" class="col-sm-2 col-form-label form-label">가격대</label>
                    <div class="col-sm-10">
                        <input type="text" id="unitPrice" name="unitPrice" class="form-control" required>
                    </div>
                </div>
                <div class="mb-3 row text-end">
                    <label for="category" class="col-sm-2 col-form-label form-label">분류</label>
                    <div class="col-sm-10">
                        <input type="text" id="category" name="category" class="form-control" required>
                    </div>
                </div>
                <div class="mb-3 row text-end">
                    <label for="address" class="col-sm-2 col-form-label form-label">주소</label>
                    <div class="col-sm-10">
                        <input type="text" id="address" name="address" class="form-control" required>
                    </div>
                </div>
                <div class="mb-3 row text-end">
                    <label for="description" class="col-sm-2 col-form-label form-label">상세 정보</label>
                    <div class="col-sm-10">
                        <textarea name="description" id="description" cols="50" rows="4" class="form-control" placeholder="10자 이상 적어주세요." required></textarea>
                    </div>
                </div>
                <div class="mb-3 row text-end">
                    <label for="restaurantImage" class="col-sm-2 col-form-label form-label">이미지</label>
                    <div class="col-sm-10">
                        <input type="file" name="restaurantImage" class="form-control" required>
                    </div>
                </div>
                <div class="mb-3 row  text-end">
                    <div class="col-sm-10 offset-sm-2">
                        <button type="button" class="btn btn-lg btn-primary w-40 btn-center" onclick="CheckAddRestaurant()">등록</button>
                    </div>
                </div>
            </form>
        </div>
        <%@ include file="../footer.jsp" %>
    </div>
</body>
</html>
