<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL과 JSTL</title>
</head>
<body>
<!-- 표현언어(EL, Expression Language : 사용하기 편하다. -> 많이 사용 -->
${"Hello"} <br> <%-- EL --%>
<%="Hello" %> <br> <%-- 표현식 --%>
<%out.println("Hello"); %> <br> <%-- 스크립트 릿 --%>
<%-- 출력 결과는 모두 같다. --%>
</body>
</html>