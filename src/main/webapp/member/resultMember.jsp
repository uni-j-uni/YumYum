<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보</title>
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .container {
            max-width: 800px;
            margin: 5% auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 20px 0px rgba(0,0,0,0.1);
            background-color: #ffffff;
        }
        .alert {
            padding: 1rem;
            margin-bottom: 1rem;
            border-radius: 10px;
            font-size: 1.2rem;
            font-weight: bold;
            text-align: center;
            animation: fadein 1s;
        }
        .alert-warning {
            background-color: #ffc107;
            color: #000000;
            border: 2px solid #ffc107;
        }
        .alert-success {
            background-color: #20c997;
            color: #ffffff;
            border: 2px solid #20c997;
        }
        .alert-danger {
            background-color: #dc3545;
            color: #ffffff;
            border: 2px solid #dc3545;
        }
        .header-text {
            font-size: 3rem;
            font-weight: bold;
            color: #343a40;
            text-align: center;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
        }
        .sub-text {
            font-size: 1.8rem;
            color: #6c757d;
            text-align: center;
            margin-bottom: 30px;
        }
        .btn-link {
            text-decoration: none;
            color: #ffffff;
        }
        .btn-welcome {
            background-color: #007bff;
            border-color: #007bff;
            padding: 10px 20px;
            font-size: 1.2rem;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .btn-welcome:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        @keyframes fadein {
            from { opacity: 0; }
            to   { opacity: 1; }
        }
    </style>
</head>
<body>
    <div class="container py-4">
        <div class="p-4 mb-4 bg-light rounded-3">
            <div class="container-fluid py-5">
                <%
                String msg = request.getParameter("msg");
                if (msg != null) {
                    if (msg.equals("0")) {
                %>
                <h1 class="header-text">회원 가입을 축하드립니다!</h1>
                <p class="sub-text">Thanks for join us</p>
                <%
                    } else if (msg.equals("1")) {
                %>
                <h1 class="header-text">환영합니다!</h1>
                <p class="sub-text">Welcome</p>
                <%
                    } else if (msg.equals("2")) {
                %>
                <h1 class="header-text">회원 정보가 수정되었습니다!</h1>
                <p class="sub-text">Edit Information</p>
                <%
                    }
                } else {
                %>
                <h1 class="header-text">저희 사이트를 이용해주셔서 </h1>
                <h1 class="header-text">감사합니다.</h1>
                <p class="sub-text">Delete Membership</p>
                <%
                }
                %>
            </div>
        </div>
        <div class="row align-items-md-stretch text-center">
            <div class="col-md-12">
                <%
                if (msg != null) {
                	String loginId = (String) session.getAttribute("sessionId");
                    if (msg.equals("0")) {
                        out.println("<div class='alert alert-success'>" + loginId + "님 회원가입을 축하드립니다.</div>");
                    } else if (msg.equals("1")) {
                        out.println("<div class='alert alert-success'>" + loginId + "님 환영합니다</div>");
                    } else if (msg.equals("2")) {
                        out.println("<div class='alert alert-warning'>" + loginId + "님의 정보가 수정되었습니다.</div>");
                    } 
                } else {
                    out.println("<div class='alert alert-danger'>회원정보가 삭제되었습니다.</div>");
                }
                %>
                <a href="../welcome.jsp" class="btn btn-welcome btn-lg text-white">메인화면으로 이동</a>
            </div>
        </div>
    </div>
<jsp:include page="../footer.jsp" />
</body>
</html>
