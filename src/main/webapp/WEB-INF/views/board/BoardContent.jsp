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
	
	.myTable input {
		font-size: 11pt;
		font-weight: bold;
		color: dimgray;
	    padding-right: 9px;
	    padding-left: 9px;
	    border-radius: 7px;
	}
	
	.contentTable {
		width: 40%;
		margin-left: auto;
		margin-right: auto;
		margin-top: 4%;
		border-collapse: separate;
		border-spacing: 1px;
		text-align: left;
		line-height: 1.5;
	}
	
	.contentTable th {
		width: 20%;
		padding: 10px;
	    font-weight: bold;
	    border-bottom: 1px solid #ccc;
	    background-color: lightblue;
	    color: dimgray;
	    text-align: center;
	}
	
	.contentTable td {
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

	<table class="contentTable">
		<tr>
			<th>제목</th>
			<td>${vo.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.id }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${vo.writeDate }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${vo.count }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td style="white-space: pre;">${vo.content }</td>
		</tr>
		<tr>
			<td colspan="2" align="right" style="border-bottom: none;">
				<div>
					<input type="button" value="글쓰기" onclick="location.href='boardWriteForm.do?page=${page }';">
					<c:if test="${id eq vo.id }">
						<input type="button" value="수정" onclick="location.href='boardUpdateForm.do?no=${vo.no }&page=${page }';">
						<input type="button" value="삭제" onclick="location.href='boardDelete.do?no=${vo.no}';">
					</c:if>
					<input type="button" value="목록" onclick="location.href='boardList.do?page=${page }';">
				</div>
			</td>
		</tr>
	</table>


</body>
</html>