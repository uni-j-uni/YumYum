<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" %>
<%@ page import="mvc.model.BoardDTO"%>
<%
    String sessionId = (String) session.getAttribute("sessionId");
%>

<header class="pb-3 mb-4 border-bottom bg-custom">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/YumYum/welcome.jsp" class="d-flex align-items-center text-white text-decoration-none">
                <img src="/YumYum/resources/images/Logo.png" width="150" height="45" class="me-2">   
            </a>
            <ul class="nav nav-pills ms-auto">
                <c:choose>
                    <c:when test="${sessionId.startsWith('admin')}">
                        <li class="nav-item">
                            <span class="nav-link">[관리자 님]</span>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value='/restaurant/addRestaurant.jsp'/>" class="nav-link"> <i class="bi bi-plus-circle"></i>식당 등록</a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value='/restaurant/editRestaurant.jsp?edit=update'/>" class="nav-link"> <i class="bi bi-pencil-square"></i>식당 수정</a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value='/restaurant/editRestaurant.jsp?edit=delete'/>" class="nav-link"> <i class="bi bi-trash"></i>식당 삭제</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/member/logoutMember.jsp'/>"> <i class="bi bi-box-arrow-right"></i>로그아웃</a>
                        </li>
                    </c:when>
                    <c:when test="${empty sessionId}">
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/member/loginMember.jsp'/>"> <i class="bi bi-box-arrow-in-right"></i>로그인</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/member/addMember.jsp'/>"> <i class="bi bi-person-plus"></i>회원 가입</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a href="<c:url value='/BoardListAction.do?pageNum=1'/>" class="nav-link"> <i class="bi bi-card-list"></i>맛집 게시판</a>
                        </li>
                        <li class="nav-item">
                            <span class="nav-link">[${sessionId}님]</span>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/member/logoutMember.jsp'/>"> <i class="bi bi-box-arrow-right"></i>로그아웃</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/member/myPage.jsp'/>"> <i class="bi bi-person-circle"></i>마이페이지</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</header>

<style>
    .bg-custom {
        background: linear-gradient(45deg, #FF5733, #C70039);
        padding: 10px 0;
    }
    .font-custom {
        font-family: 'Arial', sans-serif;
        font-weight: bold;
    }
    .nav-link {
        color: white !important;
        transition: color 0.3s ease;
    }
    .nav-link:hover {
        color: #ffd700 !important;
    }
</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
