<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.myTable {
		width: 20%;
		margin-left: auto;
		margin-right: auto;
		margin-top: 3%;
		border-collapse: separate;
		border-spacing: 1px;
		text-align: left;
		line-height: 1.5;
	}
	
	.myTable td {
		text-align: center;
		padding: 5px;
	}
	
	.myTable a:hover {
		color: cornflowerblue;
		font-weight: bold;
	}
	
	.myTable input, #writeBtn {
		font-size: 11pt;
		font-weight: bold;
		color: dimgray;
	    padding-right: 9px;
	    padding-left: 9px;
	    border-radius: 7px;
	}
	
	.writeTable {
		width: 40%;
		margin-left: auto;
		margin-right: auto;
		margin-top: 4%;
		border-collapse: separate;
		border-spacing: 1px;
		text-align: left;
		line-height: 1.5;
	}
	
	.writeTable th {
		width: 20%;
		padding: 10px;
	    font-weight: bold;
	    border-bottom: 1px solid #ccc;
	    background-color: lightblue;
	    color: dimgray;
	    text-align: center;
	}
	
	.writeTable td {
		padding: 8px;
	    vertical-align: top;
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
	function writeCheck() {
		if($("#title").val().trim() == "" || $("#title").val().trim() == null) {
			alert("제목을 입력해 주세요.");
			$("#title").focus();
			return false;
		} else if($("#content").val().trim() == "" || $("#content").val().trim() == null) {
			alert("내용을 입력해 주세요.");
			$("#content").focus();
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body>

	<% String id = (String)session.getAttribute("id"); %>
	
	<table class="myTable">
		<tr>
			<td>
				<span style="color: cornflowerblue;"><b><%=id %></b></span> &nbsp; 
				<a href="boardModifyInfoForm.do">내 정보 수정</a>
			</td>
		</tr>
		<tr>
			<td><a href="boardMyWriting.do">내가 쓴 글 보기</a></td>
		</tr>
		<tr>
			<td><input type="button" value="로그아웃" onclick="location.href='boardLogout.do';"></td>
		</tr>
	</table>
	
	<br>
	
	<form action="boardWrite.do" method="post" onsubmit="return writeCheck()">
		<table class="writeTable">
			<tr>
				<th>작성자</th>
				<td><%=id %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" id="title" style="width: 95%; border: none; outline: none;"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content" rows="13" style="width: 95%; resize: none; border: none; outline: none; font-family: 맑은 고딕;"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right" style="border-bottom: none;">
					<div>
						<input type="submit" value="확인">
						<input type="button" value="목록" onclick="location.href='boardList.do?page=${page }';">
					</div>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>