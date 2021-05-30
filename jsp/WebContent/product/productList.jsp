<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link rel="stylesheet" type="text/css" href="css/shopping.css">
</head>
<body>
	<div id="wrap" align="center">
		<h1>상품 리스트 - 관리자 페이지</h1>
		<table class="list">
			<tr> <td colspan="5" style="border: white; text-align: right">
				 <a href="ProductWrite.do">상품 등록</a></td></tr>
		 	<tr> <th>번호</th>
		 		 <th>이름</th>
		 		 <th>가격</th>
		 		 <th>수정</th>
		 		 <th>삭제</th></tr>
		 	<c:forEach var="product" items="${productList}">
		 		<tr class="record">
		 			<td>${product.code}</td>
		 			<td>${product.name}</td>
		 			<td>${product.price}원</td>
		 			<td><a href="ProductUpdate.do?code=${product.code}">상품수정</a></td>
		 			<td><a href="ProductDelete.do?code=${product.code}">상품삭제</a></td>
		 		</tr>
		 	</c:forEach>
		
		</table>
	</div>
</body>
</html>