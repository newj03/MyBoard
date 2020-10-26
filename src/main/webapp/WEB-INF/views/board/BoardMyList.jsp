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
	
	.boardTable {
		width: 45%;
		margin-left: auto;
		margin-right: auto;
		margin-top: 4%;
		border-collapse: separate;
		border-spacing: 1px;
		text-align: left;
		line-height: 1.5;
	}
	
	.boardTable th {
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	    background-color: lightblue;
	    color: dimgray;
	    text-align: center;
	}
	
	.boardTable td {
		padding: 5px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
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
			<td><a href="boardList.do">목록 보기</a></td>
		</tr>
		<tr>
			<td><input type="button" value="로그아웃" onclick="location.href='boardLogout.do';"></td>
		</tr>
	</table>
	
	<br>
	
	<table class="boardTable">
		<tr>
			<th style="width: 6%;">no</th>
			<th style="width: 50%;">제목</th>
			<th style="width: 15%;">작성자</th>
			<th style="width: 20%;">작성일</th>
			<th style="width: 9%;">조회</th>
		</tr>
		<c:if test="${empty list }">
			<tr>
				<td colspan="5">존재하는 게시물이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty list }">
			<c:forEach var="vo" items="${list }">
				<tr>
					<td align="center">${vo.no }</td>
					<td><a href="boardMyContent.do?no=${vo.no }&page=${page }">${vo.title }</a></td>
					<td align="center">${vo.id }</td>
					<td align="center">${vo.writeDate }</td>
					<td align="center">${vo.count }</td>
				</tr>
			</c:forEach>
				<tr>
					<td colspan="5" align="center" style="border-bottom: none;">
						<c:if test="${startPage > pageBlock }">
							<a href="boardMyWriting.do?page=${startPage - 10 }">[이전]</a>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
							<c:if test="${i == page }">
								[${i }]
							</c:if>
							<c:if test="${i != page }">
								<a href="boardMyWriting.do?page=${i }">[${i }]</a>
							</c:if>
						</c:forEach>
						<c:if test="${endPage < pageCount }">
							<a href="boardMyWriting.do?page=${startPage + 10 }">[다음]</a>
						</c:if>
					</td>
				</tr>
		</c:if>
	</table>

</body>
</html>