<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 객체의 메소드</title>
</head>
<body>
	<h3> 세션 정보를 얻어오는 메소드를 사용하기</h3>
	<%
		String id_str = session.getId();
		long lasttime = session.getLastAccessedTime(); //ms 단위
		long createtime = session.getCreationTime();
		long time_used = (lasttime - createtime) / 60000; // ms 단위를 분으로 변경
		int inactive = session.getMaxInactiveInterval() / 60; // 초 단위를 분 단위로 변경
		boolean b_new = session.isNew(); // 새로운 세션이 설정이 되었는지? 아니면 계속 연장인지?
	%>
	[1] 세션 ID는 [<%=session.getId() %>] 입니다.<br>
	<hr>
	[2] 당신이 웹 사이트에 머문 시간은 <%=time_used %> 분입니다.<br>
	<hr>
	[3] 세션의 유효 시간은 <%=inactive %> 분입니다. <br>
	<hr>
	[4] 세션이 새로 만들어졌나요?<br>
	<%
		if(b_new) {
			out.print("네, 새로운 세션을 만들었습니다.");
		} else {
			out.print("아니오, 새로운 세션을 만들지 않았습니다.");
		}
	%>
</body>
</html>