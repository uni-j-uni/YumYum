<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 400px;
            margin-top: 5%;
        }
        .form-signin {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 20px 0px rgba(0,0,0,0.1);
        }
        .form-signin-heading {
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }
        .form-floating {
            margin-bottom: 10px;
        }
        .center-btn {
            text-align: center;
        }
    </style>
</head>
<body>
<%@include file="../menu.jsp"%>
    <div class="container">
        <div class="text-center">
            <h1 class="display-5 fw-bold">로그인</h1>
            <p class="fs-4">Membership Login</p>
        </div>
        <div class="form-signin">
            <%
            String error = request.getParameter("error");
            if (error != null) {
                out.println("<div class='alert alert-danger' role='alert'>");
                out.println("아이디와 비밀번호를 확인해 주세요");
                out.println("</div>");
            }
            %>
            <form class="row g-3" action="processLoginMember.jsp" method="post">
                <div class="col-12">
                    <div class="form-floating">
                        <input type="text" class="form-control" name='id' id="floatingInput" placeholder="ID" required autofocus>
                        <label for="floatingInput">ID</label>
                    </div>
                </div>
                <div class="col-12">
                    <div class="form-floating">
                        <input type="password" class="form-control" name='password' placeholder="Password" required>
                        <label for="floatingPassword">Password</label>
                    </div>
                </div>
                <div class="col-12 center-btn">
                    <button class="btn btn-lg btn-primary btn-block" type="submit" >로그인</button>
                </div>
            </form>
        </div>
        <jsp:include page="../footer.jsp" />
    </div>
</body>
</html>
