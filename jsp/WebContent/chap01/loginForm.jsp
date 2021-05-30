<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Form method 와 Servlet 관계</title>
</head>
<body>
<h2>로그인 폼</h2>
	<form action="<%=request.getContextPath()%>/loginPro" method="post">
		<label for="id">아이디: </label>
		<input type="text" id="id" name="id" size="20" required ><br>
		<label for="pw">비밀번호: </label>
		<input type="password" id="pw" name="pw" size="20" required><br>
		<p><input type="submit" value="로그인"></p>
	</form>
</body>
</html>