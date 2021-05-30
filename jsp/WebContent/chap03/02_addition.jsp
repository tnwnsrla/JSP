<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	JSP 파일은 java 파일로 변환이 되고, 다시 .class 파일로 변경이 된다.
	02_addition.jsp -> 02_addition_jsp.java -> 02.addition_jsp.class
	일종의 서블릿이다. -> 궁극적으로는 서블릿으로 동작한다.(tomcat 내부적으로는)
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP-두 수의 합 출력</title>
</head>
<body>
<% 
// 위치는 어느곳에 존재하던지 관계없음 : 꼭 body 태그 안에 있을 필요는 없다.
// 스크립트 릿(scriptlit) : 자바문법
int num1 = 20;
int num2 = 10;
int add = num1 + num2;
out.print(num1 + "+" + num2 + "=" + add); //브라우조러 출력
%>
</body>
</html>