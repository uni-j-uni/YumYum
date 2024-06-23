<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
    <script type="text/javascript">
        function checkForm() {
            if (!document.newMember.id.value) {
                alert("아이디를 입력하세요.");
                return false;
            }

            if (!document.newMember.password.value) {
                alert("비밀번호를 입력하세요.");
                return false;
            }

            if (document.newMember.password.value != document.newMember.password_confirm.value) {
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
            
            if (!document.newMember.name.value) {
                alert("이름을 입력하세요.");
                return false;
            }
            
            if (!document.newMember.mail1.value) {
                alert("메일을 입력하세요.");
                return false;
            }
            
            var format = /^([0][1][0-9])-([0-9][0-9][0-9][0-9])-([0-9][0-9][0-9][0-9])$/;
            if (!format.test(document.newMember.phone.value)) {
                alert("전화번호를 형식에 맞춰 입력하세요.\nEx)010-1234-5678");
                return false;
            }
            
            if (!document.newMember.address.value) {
                alert("주소를 입력하세요.");
                return false;
            }
            
            if (document.newMember.address.length > 20) {
                alert("주소가 너무 깁니다. 상세 주소를 제외한 지역만 입력해주세요.");
                return false;
            }
        }
    </script>
    <title>회원 가입</title>
</head>
<body>
<jsp:include page="../menu.jsp" />
    <div class="container py-4">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h1 class="display-5 fw-bold text-center mb-0">회원 가입</h1>
                <p class="text-center mb-0">Membership Joining</p>
            </div>
            <div class="card-body">
                <form name="newMember" action="processAddMember.jsp" method="post" onsubmit="return checkForm()">
                    <div class="mb-3 row">
                        <label for="id" class="col-sm-3 col-form-label text-end">아이디</label>
                        <div class="col-sm-6">
                            <input name="id" type="text" class="form-control" id="id" placeholder="아이디 입력 (관리자의 아이디는 admin으로 시작)">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="password" class="col-sm-3 col-form-label text-end">비밀번호</label>
                        <div class="col-sm-6">
                            <input name="password" type="password" class="form-control" id="password" placeholder="비밀번호 입력">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="password_confirm" class="col-sm-3 col-form-label text-end">비밀번호 확인</label>
                        <div class="col-sm-6">
                            <input name="password_confirm" type="password" class="form-control" id="password_confirm" placeholder="비밀번호 확인">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="name" class="col-sm-3 col-form-label text-end">이름</label>
                        <div class="col-sm-6">
                            <input name="name" type="text" class="form-control" id="name" placeholder="이름 입력">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-3 col-form-label text-end">생년월일</label>
                        <div class="col-sm-6">
                            <div class="row">
                                <div class="col-sm-4">
                                    <input type="text" name="birthyy" maxlength="4" class="form-control" placeholder="년(4자)">
                                </div>
                                <div class="col-sm-4">
                                    <select name="birthmm" class="form-select">
                                        <option value="">월</option>
                                        <option value="01">1</option>
                                        <option value="02">2</option>
                                        <option value="03">3</option>
                                        <option value="04">4</option>
                                        <option value="05">5</option>
                                        <option value="06">6</option>
                                        <option value="07">7</option>
                                        <option value="08">8</option>
                                        <option value="09">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                    </select>
                                </div>
                                <div class="col-sm-4">
                                    <input type="text" name="birthdd" maxlength="2" class="form-control" placeholder="일">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="mail1" class="col-sm-3 col-form-label text-end">이메일</label>
                        <div class="col-sm-6">
                            <div class="row">
                                <div class="col-sm-6">
                                    <input type="text" name="mail1" maxlength="50" class="form-control" id="mail1" placeholder="이메일">
                                </div>
                                @
                                <div class="col-sm-4">
                                    <select name="mail2" class="form-select">
                                    	<option value="naver.com">skuniv.ac.kr</option>
                                        <option value="naver.com">naver.com</option>
                                        <option value="daum.net">daum.net</option>
                                        <option value="gmail.com">gmail.com</option>
                                        <option value="nate.com">nate.com</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="phone" class="col-sm-3 col-form-label text-end">전화번호</label>
                        <div class="col-sm-6">
                            <input name="phone" type="text" class="form-control" id="phone" placeholder="전화번호 입력 (Ex: 010-1234-5678)">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="address" class="col-sm-3 col-form-label text-end">주소</label>
                        <div class="col-sm-6">
                            <input name="address" type="text" class="form-control" id="address" placeholder="주소 입력">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-sm-3">
                        </div>
                        <div class="col-sm-6">
                            <button type="submit" class="btn btn-primary me-2">등록</button>
                            <button type="reset" class="btn btn-secondary" onclick="location.href='../welcome.jsp'">취소</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <jsp:include page="/footer.jsp" />
    </div>
</body>
</html>
