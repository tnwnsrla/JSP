<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서블릿-textarea</title>
</head>
<body>
	<form method="post" action="<%=request.getContextPath() %>/RadioServlet">
		성별 : <input type="radio" id="man" name="gender" value="남자" checked>
		      <label for="man">남자</label>
		      <input type="radio" id="woman" name="gender" value="여자">
		      <label for="woman">여자</label><br><br>
		메일정보수신여부 : <input type="radio" id="accept" name="chk_mail" value="yes" checked>
					  <label for="accept">수신</label>
					  <input type="radio" id="deny" name="chk_mail" value="no">
					  <label for="deny">거부</label><br><br>
		<label for="content">간단한 가입인사를 적어주세요^o^</label><br>
		<!-- textarea의 시작태그와 종료태그 사이에 공백이 있으면 안된다. 공백이 있으면 공백까지 서버로 전송이 되어 불필요한 데이터가 포함된다. -->
		<textarea id="content" name="content" rows="3" cols="35"></textarea><br>
		<input type="submit" value="전송">
	</form>
</body>
</html>