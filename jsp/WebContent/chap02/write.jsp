<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SmartEditor2</title>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
$(function(){
nhn.husky.EZCreator.createInIFrame({
oAppRef: oEditors,
elPlaceHolder: "ir1",
//SmartEditor2Skin.html 파일이 존재하는 경로
sSkinURI: "../se2/SmartEditor2Skin.html",
htParams : {
	65
	// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	bUseToolbar : true,
	// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	bUseVerticalResizer : true,
	// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	bUseModeChanger : true,
	fOnBeforeUnload : function(){ }
	},
	fOnAppLoad : function(){
	//textarea 내용을 에디터상에 바로 뿌려주고자 할때 사용
	oEditors.getById["ir1"].exec("PASTE_HTML", ["ㅎㅇ 시작하자마자 이문구 작성됨."]);
	},
	fCreator: "createSEditor2"
	});
	})
	function submitContents(elClickedObj) {
	//id가 smarteditor인 textarea에 에디터에서 대입
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	// 이부분에 에디터 validation 검증
	try { //폼 submit
	elClickedObj.form.submit();
	} catch(e) { }
}
</script>
</head>
<body>
	<form id="frm" method="post" action="<%=request.getContextPath() %>/SmarteditorServlet">
		성별 : <input type="radio" id="man" name="gender" value="남자" checked>
		      <label for="man">남자</label>
		      <input type="radio" id="woman" name="gender" value="여자">
		      <label for="woman">여자</label><br><br>
		메일정보수신여부 : <input type="radio" id="accept" name="chk_mail" value="yes" checked>
					  <label for="accept">수신</label>
					  <input type="radio" id="deny" name="chk_mail" value="no">
					  <label for="deny">거부</label><br><br>
		<label for="ir1">간단한 가입인사를 적어주세요^o^</label><br>
		<textarea name="ir1" id="ir1" rows="10" cols="100" style="width: 766px; 
		height: 412px; display:none;"></textarea><br>
		<input type="submit" value="전송" onclick="submitContents(this)">
		</form>
</body>
</html>