function CheckAddRestaurant() {
	var restId=document.getElementById("restId");
	var name=document.getElementById("name");
	var unitPrice=document.getElementById("unitPrice");
	var category=document.getElementById("category");
	var address=document.getElementById("address");
	var description=document.getElementById("description");
	
	// 식당 아이디 체크
	if (!check(/^[A-Z]FOOD[0-9]{1,4}$/, restId, "[식당코드]\n(K, C, J, W, F) + FOOD와 숫자를 조합하여 입력하세요.\n첫 글자는 반드시 (K, C, J, W, F) + FOOD로 시작하세요.")) return false;
	
	// 식당명 체크
	if (name.value.length < 1 || name.value.length > 50) {
		alert("[식당명]\n최소 1자에서 최대 50자까지 입력하세요.");
		name.focus();
		return false;
	}
	
	// 식당 가격대 체크
	if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
		alert("[가격]\n숫자만 입력하세요.");
		unitPrice.focus();
		return false;
	}
	
	if (unitPrice.value < 0) {
		alert("[가격]\n음수를 입력할 수 없습니다.");
		unitPrice.focus();
		return false;
	}
	
	if (category.value != "한식" && category.value != "일식" && category.value != "중식" && category.value != "양식"  && category.value != "분식") {
		alert("[분류]\n분류는 한식, 양식, 일식, 중식, 분식 중에서 입력하세요.");
		category.focus();
		return false;
	}
	
	if (address.value.length < 5) {
		alert("[주소]\n정확한 주소를 입력하세요.");
		address.focus();
		return false;
	}
	
	if (description.value.length < 5) {
		alert("[상세설명]\n최소 5자 이상 입력하세요.");
		description.focus();
		return false;
	}
	
	function check(regExp, e, msg) {
		if (regExp.test(e.value)) return true;
		alert(msg);
		e.focus();
		return false;
	}
	
	document.newRestaurant.submit()
}