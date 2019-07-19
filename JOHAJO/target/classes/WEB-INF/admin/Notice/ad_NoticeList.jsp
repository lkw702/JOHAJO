<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- Latest compiled JavaScript -->
<<<<<<< HEAD
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>     
<style>
	ul li{
		list-style: none;
		float: left;
	}
</style>
</head>
<body>
	<div class="l_div1" id="l_div1">
		${totalCount}개의 글
		<button onclick="location.href='notice_insertform.do'">글 쓰기</button>
		<table border="1">
			<caption>공개 공지사항</caption>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>관리</th>
			</tr>
			<c:forEach var="dto" items="${list}" varStatus="index">
				<c:if test="${dto.hide==1}">
				<tr>
					<td align="center">${totalCount-index.index}</td>
						
					<td align="center">
						<a href="noticelist_content.do?idx=${dto.idx}&pageNum=${currentPage}">${dto.title}</a>
					</td>
					<td align="center">
						<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd"/>
					</td>
					<td colspan="2">
						<button type="button" onclick="location.href='noticeUpdataForm.do?idx=${dto.idx }&pageNum=${currentPage}'">수정</button>
						<button type="button" onclick="location.href='noticedelete.do?idx=${dto.idx }&pageNum=${currentPage}'">삭제</button>
					</td>
				</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
	<!-- 페이지번호 출력 -->
		<div style="width: 600px; text-align: center; margin-left: 200px;">
			<ul>
				<c:if test="${startPage>1}">
					<li>
						<a href="ad_NoticeList.do?pageNum=${startPage-1}">◁</a>
					</li>
				</c:if>
				
				<c:forEach var="pp" begin="${startPage}" end="${endPage}">
				<li>
					<c:if test="${pp==currentPage}">
						<a href="ad_NoticeList.do?pageNum=${pp}" style="color: tomato;">${pp}</a>
					</c:if>
					<c:if test="${pp!=currentPage}">
						<a href="ad_NoticeList.do?pageNum=${pp}" >${pp}</a>
					</c:if>
				</li>
				</c:forEach>
				
				<c:if test="${endPage<totalPage}">
					<li>
						<a href="ad_NoticeList.do?pageNum=${endPage+1}">▷</a>
					</li>
				</c:if>
			</ul>
		</div>
=======
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 

</head>
<body>

>>>>>>> refs/heads/master
</body>
</html>