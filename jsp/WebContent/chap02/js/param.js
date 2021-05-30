/**
 * param.js 입력 파라미터 유효성 검사
 */

function check() {
	if(document.frm.id.value=="") {
		alert("아이디를 입력해 주세요.");
		document.frm.id.focus();
		return false;
	} else if(document.frm.age.value=="") {
		alert("나이를 입력해 주세요.");
		document.frm.age.focus();
		return false;
	} else if(isNaN(document.frm.age.value)) {
		alert("숫자로 입력해 주세요.");
		document.frm.age.focus();
		return false;
	} else{ return true; }
}