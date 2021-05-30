<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int age=Integer.parseInt(request.getParameter("age"));
	if(age <= 19) { // 미성년이면 다시 이전사이트로 이동
%>
<script type="text/javascript">
alert("19세 미만이므로 입장 불가능")
history.go(-1)
</script>
<%
	} else { // 성인이면, 05_forwardResult.jsp로 이동
		request.setAttribute("name", "성윤정");
		RequestDispatcher dispatcher = request.getRequestDispatcher("05_forwardResult.jsp");
		dispatcher.forward(request, response);
	}
%>