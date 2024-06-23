<%@page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <style>
        .space {
            width: 20px;
            height: auto;
            display: inline-block;
        }
        .bg-custom {
            background: linear-gradient(45deg, #ff6b6b, #f06595);
        }
        .bg-hero {
            background: url('resources/images/main3.gif') no-repeat center center;
            background-size: cover;
            height: 500px;
            position: relative;
            text-align: center;
        }
        .hero-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            text-shadow: 2px 2px 4px #000;
        }
        .btn-custom {
            background: linear-gradient(45deg, #e52d27, #b31217);
            border: none;
            margin-top: 20px;
        }
        .btn-custom:hover {
            background: linear-gradient(45deg, #b31217, #e52d27);
        }
        .footer {
            background-color: #f8f9fa;
            padding: 20px;
            margin-top: 20px;
            border-top: 1px solid #e9ecef;
        }
        @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }
        .fade-in {
            animation: fadeIn 2s ease-in-out;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Welcome</title>
</head>
<%! String tagline = "Welcome to yumyum!"; %>
<body>
<%@include file="menu.jsp"%>
    <div class="container py-4">  
        <div class="bg-hero" id="bgHero">
            <div class="hero-text fade-in">
                <h1 class="display-5 fw-bold">대한민국 No.1 맛집 서비스</h1>
                <h1 class="display-5 fw-bold">YumYum</h1>
                <button onclick="location.href='./restaurant/restaurants_lo.jsp'" class="btn btn-lg btn-custom text-white" type="button" >위치별 찾기</button>
                <div class="space"></div>
                <button onclick="location.href='./restaurant/restaurants_ca.jsp'" class="btn btn-lg btn-custom text-white" type="button">분류별 찾기</button>
            </div>
        </div>
        <div>
            <%@include file="footer.jsp"%>
        </div>
    </div>

    <script>
        function changeBackground() {
            var images = ['main1.gif', 'main2.gif', 'main3.gif', 'main4.gif', 'main5.gif', 'main6.gif', 'main7.gif', 'main8.gif', 'main9.gif', 'main10.gif']; // 이미지 경로들
            var randomIndex = Math.floor(Math.random() * images.length);
            var imageUrl = 'resources/images/' + images[randomIndex];
            document.getElementById('bgHero').style.backgroundImage = "url('" + imageUrl + "')";
        }
        changeBackground();
        setInterval(changeBackground, 3000);
    </script>
</body>
</html>
