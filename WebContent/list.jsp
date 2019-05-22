<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1px">
		<tr>
			<td>이름
			<td>메세지
		</tr>
	<c:forEach var="list" items="${dtos }">
		<tr>
			<td>${list.name }
			<td>${list.msg }
		</tr>
	</c:forEach>
	</table>
</body>
</html>