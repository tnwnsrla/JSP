<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션에 설정된 모든 값 얻어오기</title>
</head>
<body>
	<h3>세션에 설정된 모든 값 얻어오기</h3>
<%  // name 을 모르고 이름과 값의 쌍을 구할 때 사용
	Enumeration<String> names = session.getAttributeNames();
	while(names.hasMoreElements()) { // 요소가 있는지?
		String name = names.nextElement().toString(); // 요소의 값을 가져오기 Object -> String;
		String value = session.getAttribute(name).toString(); // 요소의 값 value를 가져오기
		out.println(name + ":" + value + "<br>");
	}
%>
</body>
</html>