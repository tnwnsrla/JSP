<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서블릿 파라미터 열기</title>
<script type="text/javascript" src="js/param.js"></script>
</head>
<body>
	<form action="<%= request.getContextPath()%>/ParamServlet" method="get">
		아이디 : <input type="text" name="id" required><br>
		나 &nbsp; 이 : <input type="text" name="age" required><br>
		<input type="submit" value="전송" onclick="return check()">
	</form>
</body>
</html>