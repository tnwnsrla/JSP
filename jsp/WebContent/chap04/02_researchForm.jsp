<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 요청 파라미터</title>
</head>
<body>
	<h2>설문 조사</h2>
	<form action="02_research.jsp" method="post">
	<!-- 입력 양식을 만들 때 정형화된 입력 틀을 만드는 방법 :
			1. table 사용
			2. ul, li 사용
			<filedset> <legend> -->
		<table>
			<tr><td>이름 : </td>
				<td><input type="text" name="name" size="20"></td></tr>
			<tr><td>성별 : </td>
				<td><input type="radio" id="male" name="gender" value="male" checked="checked">
					<label for="male">남자</label>
					<input type="radio" id="female" name="gender" value="female">
					<label for="female">여자</label></td>
			</tr>
			<tr>
				<td>좋아하는 계절:</td>
				<td><input type="checkbox" id="spring" name="season" value="1">
					<label for="spring">봄</label>
					<input type="checkbox" id="summer" name="season" value="2" checked="checked">
					<label for="summer">여름</label>
					<input type="checkbox" id="autumn" name="season" value="3">
					<label for="autumn">가을</label>
					<input type="checkbox" id="winter" name="season" value="4">
					<label for="winter">겨울</label></td>
			</tr>
			<tr align="center"><td><input type="submit" value="전송"></td>
				<td><input type="reset" value="취소"></td>
			</tr>	
		</table>
	</form>
</body>
</html>