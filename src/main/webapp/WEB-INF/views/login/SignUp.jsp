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
		width: 45%;
		margin-left: auto;
		margin-right: auto;
		margin-top: 10%;
		border-collapse: separate;
		border-spacing: 1px;
		text-align: left;
		line-height: 1.5;
	}
	
	th {
		width: 30%;
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	    background-color: lavender;
	    color: dimgray;
	}
	
	td {
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	}
	
	div input, #idOverlap {
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
	var idck = 0;
	var pwck = 0;
	
	function idOverlapCheck() {
		var id = $("#id").val().trim();
		if(id == "" || id == null) {
			alert("아이디를 입력해주세요!");
			$("#id").val("");
			$("#id").focus();
		} else {
			$.ajax({
				type: "post",
				url: "boardIdOverlap.do",
				data: {id : id},
				success: function(result) {
					if(result == "no") {
						$("#idCheck").text("사용할 수 있는 아이디입니다.");
						$("#idCheck").css("color", "purple");
						idck = 1;
					} else {
						$("#idCheck").text("중복된 아이디입니다.");
						$("#idCheck").css("color", "red");
						$("#id").val('');
						$("#id").focus();
					}
				}
			});
		}
	}
	
	$(document).ready(function(){
		$("#pw").keyup(function() {
			var pw = $("#pw").val();
			var pw2 = $("#pw2").val();
			
			if(pw == pw2) {
				$("#pwCheck").text("비밀번호가 일치합니다.");
				$("#pwCheck").css("color", "purple");
				pwck = 1;
			} else {
				$("#pwCheck").text("비밀번호가 다릅니다.");
				$("#pwCheck").css("color", "red");
			}
		});
		
		$("#pw2").keyup(function() {
			var pw = $("#pw").val();
			var pw2 = $("#pw2").val();
			if(pw == "" || pw == null) {
				alert("비밀번호를 먼저 입력해주세요!");
				$("#pw2").val('');
				$("#pw").focus();
			} else {
				if(pw == pw2) {
					$("#pwCheck").text("비밀번호가 일치합니다.");
					$("#pwCheck").css("color", "purple");
					pwck = 1;
				} else {
					$("#pwCheck").text("비밀번호가 다릅니다.");
					$("#pwCheck").css("color", "red");
				}
			}
		});
	});
	
	function signUpCheck() {
		if($("#id").val().trim() == "" || $("#id").val().trim() == null) {
			alert("아이디를 입력해 주세요.");
			$("#id").focus();
			return false;
		} else if($("#pw").val().trim() == "" || $("#pw").val().trim() == null) {
			alert("비밀번호를 입력해 주세요.");
			$("#pw").focus();
			return false;
		} else if($("#pw2").val().trim() == "" || $("#pw2").val().trim() == null) {
			alert("비밀번호를 한번 더 입력해 주세요.");
			$("#pw2").focus();
			return false;
		} else if($("#name").val().trim() == "" || $("#name").val().trim() == null) {
			alert("이름을 입력해 주세요.");
			$("#name").focus();
			return false;
		} else if($("#tel").val().trim() == "" || $("#tel").val().trim() == null) {
			alert("전화번호를 입력해 주세요.");
			$("#tel").focus();
			return false;
		} else if($("#address").val().trim() == "" || $("#address").val().trim() == null) {
			alert("주소를 입력해 주세요.");
			$("#address").focus();
			return false;
		} else if(idck == 0) {
			alert("아이디 중복확인을 해주세요!");
			return false;
		} else if(pwck == 0) {
			alert("비밀번호를 확인해주세요!");
			return false;
		} else {
			alert("회원가입이 완료되었습니다.")
			return true;
		}
	}
</script>
</head>
<body>
	
	<form action="boardSignUp.do" method="post" onsubmit="return signUpCheck();">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" id="id" name="id" style="width: 50%; border: none; outline: none;">
					<input type="button" id="idOverlap" value="중복확인" onclick="idOverlapCheck();"> <br>
					<div id="idCheck" style="font-weight: bold;"></div>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="pw" name="pw" style="width: 50%; border: none; outline: none;"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" id="pw2" name="pw2" style="width: 50%; border: none; outline: none;"> <span id="pwCheck" style="font-weight: bold;"></span></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" id="name" name="name" style="width: 50%; border: none; outline: none;"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" id="tel" name="tel" style="width: 50%; border: none; outline: none;"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" id="address" name="address" style="width: 90%; border: none; outline: none;"></td>
			</tr>
		</table>
		
		<br>
		
		<div align="center">
			<input type="submit" value="회원가입">
			<input type="button" value="취소" onclick="location.href='loginForm.do';">
		</div>
	</form>

</body>
</html>