<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서블릿-체크박스</title>
</head>
<body>
	<h2>악세서리</h2>
	관심분야를 선택하세요.<hr>
	<form method="post" action="<%=request.getContextPath() %>/CheckboxSerevlet">
		<input type="checkbox" name="item" value="신발">신발
		<input type="checkbox" name="item" value="가방">가방
		<input type="checkbox" name="item" value="벨트">벨트<br>
		<input type="checkbox" name="item" value="모자">모자
		<input type="checkbox" name="item" value="시계">시계
		<input type="checkbox" name="item" value="보석">보석<br>
		<input type="submit" value="전송">
	</form>
</body>
</html>