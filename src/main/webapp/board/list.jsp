<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<%
String sessionId = (String) session.getAttribute("sessionId");
List boardList = (List) request.getAttribute("boardlist");
int total_record = ((Integer) request.getAttribute("total_record")).intValue();
int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Review Board</title>
<script type="text/javascript">
	function checkForm() {
		if (${sessionId==null}) {
			alert("로그인이 필요합니다.");
			return false;
		}
		location.href = "./BoardWriteForm.do?id=<%=sessionId%>"
	}
</script>
</head>
<body>
<jsp:include page="../menu.jsp" />
	<div class="container py-4">
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-1">
            	<div class="row">
            		<div class="col-md-12 text-center position-relative">
             			<img src="resources/images/main_visual.jpg" class="img-fluid">
             			<div class="position-absolute top-50 start-50 translate-middle">
                        <h1 class="display-5 fw-bold text-white">맛집 리뷰 게시판</h1>
                        <h1 class="display-5 fw-bold text-white">Review Board</h1>
            			</div>
            		</div>
				</div>
			</div>
		</div>

		<div class="row align-items-md-stretch text-center">
			<form action="<c:url value="./BoardListAction.do"/>" method="post">
				<div class="text-end">
					<span class="badge text-bg-success">전체 글 : <%=total_record%>개</span>
				</div>
				<div style="padding-top: 20px">
					<table class="table table-hover text-center">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>조회</th>
							<th>글쓴이</th>
						</tr>
						<%
						for (int j = 0; j < boardList.size(); j++) {
							BoardDTO notice = (BoardDTO) boardList.get(j);
						%>
						<tr>
							<td><%=notice.getNum()%></td>
							<td><a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject()%></a></td>
							<td><%=notice.getRegistDate()%></td>
							<td><%=notice.getHit()%></td>
							<td><%=notice.getId()%></td>
						</tr>
						<%
						}
						%>
					</table>
				</div>
				<div align="center">
					<c:set var="pageNum" value="<%=pageNum%>" />
					<c:forEach var="i" begin="1" end="<%=total_page%>">
						<a href="<c:url value="./BoardListAction.do?pageNum=${i}" /> ">
							<c:choose>
								<c:when test="${pageNum==i}">
									<font color='4C5317'><b> [${i}]</b></font>
								</c:when>
								<c:otherwise>
									<font color='4C5317'> [${i}]</font>

								</c:otherwise>
							</c:choose>
						</a>
					</c:forEach>
				</div>
				<div class="py-3" align="right">
					<a href="#" onclick="checkForm(); return false;" class="btn btn-primary"> <i class="bi bi-pencil"></i> <strong>글쓰기</strong></a>
				</div>
				<div align="left">
					<select name="items" class="txt">
						<option value="subject">제목</option>
						<option value="content">본문</option>
						<option value="name">글쓴이</option>
					</select>
					<input name="text" type="text" /> <input type="submit" id="btnAdd" class="btn btn-primary " value="검색 " />
				</div>
			</form>
		</div>
		<jsp:include page="../footer.jsp" />
	</div>
</body>
</html>