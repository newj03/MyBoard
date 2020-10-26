<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		width: 30%;
		margin-left: auto;
		margin-right: auto;
		margin-top: 15%;
		border-collapse: separate;
		border-spacing: 1px;
	}
	
	table input {
		width: 90%;
		margin-left: 3%;
		border: none;
		outline: none;
	}
	
	td {
		font-weight: bold;
		color: dimgray;
		border-bottom: 1px solid #ccc;
	}
	
	div input {
		font-size: 11pt;
		font-weight: bold;
		color: dimgray;
	    padding-right: 9px;
	    padding-left: 9px;
	    border-radius: 7px;
	}
</style>
<script src="<c:url value='/resources/js/jquery-3.1.1.js'/>"></script>
<script>
	function login() {
		var id = $("#id").val();
		var pw = $("#pw").val();
		if(id.trim() == null || id.trim() == "") {
			alert("아이디를 입력해 주세요.");
			$("#id").focus();
		} else if(pw.trim() == null || pw.trim() == "") {
			alert("비밀번호를 입력해 주세요.");
			$("#pw").focus();
		} else {
			$.ajax({
				type: "post",
				url: "boardLogin.do",
				data: {
					id : id,
					pw : pw
				},
				success: function(result) {
					if(result == "success") {
						location.href="boardList.do?page=1";
					} else if(result == "pwFail") {
						alert("비밀번호가 틀렸습니다.");
						$("#pw").focus();
					} else if(result == "signUp") {
						alert("존재하지 않는 회원입니다.");
						$("#id").val("");
						$("#pw").val("");
						$("#id").focus();
					}
				}
			});
		}
	}
</script>
</head>
<body>

	<table>
		<tr>
			<td align="center" style="width: 45%; background-color: lavender; padding: 7px;">아이디</td>
			<td><input type="text" id="id" name="id">
		</tr>
		<tr>
			<td align="center" style="width: 45%; background-color: lavender; padding: 7px;">비밀번호</td>
			<td><input type="password" id="pw" name="pw">
		</tr>
	</table>
	
	<br>
	
	<div align="center">
		<input type="button" value="로그인" onclick="login();">
		<input type="button" value="회원가입" onclick="location.href='/controller/boardSignUpForm.do';">
	</div>

</body>
</html>