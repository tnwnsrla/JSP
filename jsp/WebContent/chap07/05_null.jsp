<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>null 값 처리 비교</title>
</head>
<body>
자바 코드 : <%=request.getParameter("id") %><br>
EL 식 : ${param.id}
</body>
</html>