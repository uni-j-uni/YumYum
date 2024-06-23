<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<head>
<style>
* {
	padding: 0;
	margin: 0;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
	font-size: 14px;
}

.menu {
	width: 100%;
	overflow: hidden;
	margin: 0 auto;
}

.menu>li {
	width: 7.69%;
	float: left;
	text-align: center;
	line-height: 40px;
	background-color: #ec5353;
}

.menu a {
	color: #fff;
}

.submenu a {
	text-align: left;
	padding-left: 0px;
	font-size: 8px;
	white-space: nowrap;
}

.submenu>li {
	line-height: 50px;
	background-color: #f29886;
}

.submenu {
	height: 0;
	overflow: hidden;
}

.menu>li:hover {
	background-color: #f29886;
	transition-duration: 0.5s;
}

.menu>li:hover .submenu {
	height: auto;
	mex-height: 320px;
	transition-duration: 1s;
	overflow-y: auto;
}
</style>
</head>
<body>
	<ul class="menu">
		<li><a >서울</a>
			<ul class="submenu">
				<li><a href="#">도봉구|강북구</a></li>
				<li><a href="#">노원구|성북구</a></li>
				<li><a href="#">동대문구</a></li>
				<li><a href="#">종로구|중랑구</a></li>
				<li><a href="#">성동구|광진구</a></li>
				<li><a href="#">중구|용산구</a></li>
				<li><a href="#">은평구|서대문구</a></li>
				<li><a href="#">마포구|강동구</a></li>
				<li><a href="#">관악구|영등포구</a></li>
				<li><a href="#">송파구|강남구</a></li>
				<li><a href="#">서초구|동작구</a></li>
				<li><a href="#">구로구|금천구</a></li>
			</ul></li>
		<li><a >부산</a>
			<ul class="submenu">
				<li><a href="#">기장군</a></li>
				<li><a href="#">금정구|해운대구</a></li>
				<li><a href="#">북구|동래구</a></li>
				<li><a href="#">연제구|수영구</a></li>
				<li><a href="#">부산진구|사상구</a></li>
				<li><a href="#">남구|동구|중구</a></li>
				<li><a href="#">서구|사하구|영도구</a></li>
				<li><a href="#">강서구</a></li>
			</ul></li>
		<li><a href="#">대구</a>
			<ul class="submenu">
				<li><a href="#">군위군</a></li>
				<li><a href="#">동구|북구</a></li>
				<li><a href="#">서구|중구</a></li>
				<li><a href="#">남구|수성구</a></li>
				<li><a href="#">달서구|달성군</a></li>
			</ul></li>
		<li><a href="#">인천</a>
			<ul class="submenu">
				<li><a href="#">중구|동구</a></li>
				<li><a href="#">미추홀구|연수구</a></li>
				<li><a href="#">남동구|부평구</a></li>
				<li><a href="#">계양구|서구</a></li>
				<li><a href="#">강화군|옹진군</a></li>
			</ul></li>
		<li><a href="#">광주</a>
			<ul class="submenu">
				<li><a href="#">동구</a></li>
				<li><a href="#">서구</a></li>
				<li><a href="#">남구</a></li>
				<li><a href="#">북구</a></li>
				<li><a href="#">광산구</a></li>
			</ul></li>
		<li><a href="#">대전</a>
			<ul class="submenu">
				<li><a href="#">중구</a></li>
				<li><a href="#">서구</a></li>
				<li><a href="#">유성구</a></li>
				<li><a href="#">대덕구</a></li>
				<li><a href="#">동구</a></li>
			</ul></li>
		<li><a href="#">울산</a>
			<ul class="submenu">
				<li><a href="#">중구</a></li>
				<li><a href="#">남구</a></li>
				<li><a href="#">동구</a></li>
				<li><a href="#">북구</a></li>
				<li><a href="#">울주군</a></li>
			</ul></li>
		<li><a href="#">경상</a>
			<ul class="submenu">
				<li><a href="#">포항</a></li>
				<li><a href="#">구미</a></li>
				<li><a href="#">안동</a></li>
				<li><a href="#">밀양</a></li>
				<li><a href="#">거제</a></li>
			</ul></li>
		<li><a href="#">경기</a>
			<ul class="submenu">
				<li><a href="#">김포|고양</a></li>
				<li><a href="#">파주|양주</a></li>
				<li><a href="#">동두천|연천|포천</a></li>
				<li><a href="#">구리|남양주|의정부</a></li>
				<li><a href="#">가평|양평</a></li>
				<li><a href="#">여주|이천</a></li>
				<li><a href="#">광주|하남|성남</a></li>
				<li><a href="#">용인|수원</a></li>
			</ul></li>
		<li><a href="#">강원</a>
			<ul class="submenu">
				<li><a href="#">춘천</a></li>
				<li><a href="#">원주</a></li>
				<li><a href="#">강릉</a></li>
				<li><a href="#">속초</a></li>
				<li><a href="#">양양</a></li>
			</ul></li>
		<li><a href="#">충청</a>
			<ul class="submenu">
				<li><a href="#">보령</a></li>
				<li><a href="#">아산</a></li>
				<li><a href="#">충주</a></li>
				<li><a href="#">청주</a></li>
				<li><a href="#">서산</a></li>
			</ul></li>
		<li><a href="#">전라</a>
			<ul class="submenu">
				<li><a href="#">전주</a></li>
				<li><a href="#">여수</a></li>
				<li><a href="#">목포</a></li>
				<li><a href="#">나주</a></li>
				<li><a href="#">함평</a></li>
			</ul></li>
		<li><a href="#">제주</a>
			<ul class="submenu">
				<li><a href="#">제주시</a></li>
				<li><a href="#">서귀포시</a></li>
			</ul></li>
	</ul>
</body>
