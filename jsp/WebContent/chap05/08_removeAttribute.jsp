<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션에 저장된 특정 객체 삭제하기</title>
</head>
<body>
	<%
		session.setAttribute("s_name1", "세션에 저장된 첫 번째 값입니다.");
		session.setAttribute("s_name2", "세션에 저장된 두 번째 값입니다.");
		session.setAttribute("s_name3", "세션에 저장된 세 번째 값입니다.");
		out.print("<h3> >> 세션 값을 삭제 하기 전 << </h3>");
		Enumeration names;
		names = session.getAttributeNames();
		while(names.hasMoreElements()) {
			String name = names.nextElement().toString();
			String value = session.getAttribute(name).toString();
			out.println(name + ":" + value + "<br>");
		}
		
		// 이름을 지정하여 세션에 저장된 겍체를 제거합니다.
		session.removeAttribute("s_name2");
		out.print("<hr><h3> >> 세션 값을 삭제한 후 << </h3>");
		names = session.getAttributeNames();
		while(names.hasMoreElements()) {
			String name = names.nextElement().toString();
			String value = session.getAttribute(name).toString();
			out.println(name + ":" + value + "<br>");
		}
	%>
</body>
</html>