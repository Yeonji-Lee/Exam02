<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		if("${result}" == "성공" ){
				alert("${result}");
				location.href="index.jsp";
			}else if("${result}" == "실패"){
				alert("${result}");
				location.href="join.jsp";
			}
	</script>
</body>
</html>