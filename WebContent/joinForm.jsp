<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Join Form</title>
    <script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<style>
#head, #foot {
	text-align: center;
	font-weight: bold;
}
</style>

</head>
<body>

<form action="join.test" method=post>
	<table border=1>
		<tr id=head>
			<td colspan="2">회 원 가 입
		</tr>
		<tr>
			<td>아이디:
			<td>
			<input type="text" name="id">
			<button type="button" id=idCheck>중복확인</button>
		</tr>
		<tr>
			<td>비밀번호:
			<td><input type="password" name="pw" id="pw">
			<span id="pwResult"></span>
		</tr>
		<tr>
			<td>비밀번호 확인:
			<td><input type="password" name="pwCheck" id="pwCheck">
			<span id="pwCheckResult"></span>
		</tr>
		<tr>
			<td>이름:
			<td><input type="text" name="name" id=name>
		</tr>
		<tr>
			<td>이메일:
			<td><input type="text" name="email" id=email>
		</tr>
		<tr>
			<td colspan="2" id=foot>
			<button type="button" id=join>가입하기</button>
			<button type="button" id=home>돌아가기</button>
			<button type="button" id=reset>리셋하기</button>
		</tr>
	</table>
	</form>
	
	<script>
		$("#join").on("click",function(){
			if($("#id").val()==""){
				alert("아이디를 입력해주세요.")
			}else if($("#pw").val()==""){
				alert("비밀번호를 입력해주세요.")
			}else if($("#name").val()==""){
				alert("이름을 입력해주세요.")
			}else if($("#email").val()==""){
				alert("이메일을 입력해주세요.")
			}else{
				$("form").submit();
			}
		})
		
		$("#home").on("click",function(){
			location.href="index.jsp";
		})
		
		$("#reset").on("click",function(){
			$("input").val("");
		})
		
		
		$("#pw").on("input",function(){
			var pw = $("#pw").val();
			var regex = /^[a-zA-Z0-9]{5,10}$/g;
			var result = regex.exec(pw);
			
			if(result == pw){
				$("#pwResult").text("사용가능");
				$("#pwResult").css("color","Green")
			}else{
				$("#pwResult").text("사용불가");
				$("#pwResult").css("color","Red")
			}
		})
		
		$("#pwCheck").on("input",function(){

			if($("#pw").val() ==  $("#pwCheck").val()){
				$("#pwCheckResult").text("일치");
				$("#pwCheckResult").css("color","Green")
			}else{
				$("#pwCheckResult").text("불일치");
				$("#pwCheckResult").css("color","red")
			}
		})
		
		
		
	</script>
</body>
</html>