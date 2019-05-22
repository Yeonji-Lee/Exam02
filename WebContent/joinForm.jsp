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
			<td colspan="2">ȸ �� �� ��
		</tr>
		<tr>
			<td>���̵�:
			<td>
			<input type="text" name="id">
			<button type="button" id=idCheck>�ߺ�Ȯ��</button>
		</tr>
		<tr>
			<td>��й�ȣ:
			<td><input type="password" name="pw" id="pw">
			<span id="pwResult"></span>
		</tr>
		<tr>
			<td>��й�ȣ Ȯ��:
			<td><input type="password" name="pwCheck" id="pwCheck">
			<span id="pwCheckResult"></span>
		</tr>
		<tr>
			<td>�̸�:
			<td><input type="text" name="name" id=name>
		</tr>
		<tr>
			<td>�̸���:
			<td><input type="text" name="email" id=email>
		</tr>
		<tr>
			<td colspan="2" id=foot>
			<button type="button" id=join>�����ϱ�</button>
			<button type="button" id=home>���ư���</button>
			<button type="button" id=reset>�����ϱ�</button>
		</tr>
	</table>
	</form>
	
	<script>
		$("#join").on("click",function(){
			if($("#id").val()==""){
				alert("���̵� �Է����ּ���.")
			}else if($("#pw").val()==""){
				alert("��й�ȣ�� �Է����ּ���.")
			}else if($("#name").val()==""){
				alert("�̸��� �Է����ּ���.")
			}else if($("#email").val()==""){
				alert("�̸����� �Է����ּ���.")
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
				$("#pwResult").text("��밡��");
				$("#pwResult").css("color","Green")
			}else{
				$("#pwResult").text("���Ұ�");
				$("#pwResult").css("color","Red")
			}
		})
		
		$("#pwCheck").on("input",function(){

			if($("#pw").val() ==  $("#pwCheck").val()){
				$("#pwCheckResult").text("��ġ");
				$("#pwCheckResult").css("color","Green")
			}else{
				$("#pwCheckResult").text("����ġ");
				$("#pwCheckResult").css("color","red")
			}
		})
		
		
		
	</script>
</body>
</html>