<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="submit.test" method="post">
	<input type="text" name="name">
	<input type="text" name="msg">
	<button>����</button>
	<input type=button value="���" id="listbtn">
	</form>
	<script>
		document.getElementById("listbtn").onclick=function(){
			location.href="list.test";
		}
	</script>
</body>
</html>