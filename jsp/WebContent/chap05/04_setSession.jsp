<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션에 값 설정하기</title>
</head>
<body>
<%  //자바 영역 -> 디버거를 사용할 수 있음
	session.setAttribute("id", "pinksung");
	session.setAttribute("pwd", "test1234");
	session.setAttribute("age", 20);
%>
<h3>세션 설정</h3>
</body>
</html>