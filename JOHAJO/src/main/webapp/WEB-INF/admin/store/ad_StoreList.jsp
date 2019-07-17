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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
<script>
	$(function(){
		$(".storeInsertBtn").click(function(){
			var url="storeInsert.pop";
			var option="width=300,height=250,resizable=no,scrollbars=no,status=no";
			window.open(url,"",option);
		});
		
		$(".storeUpDateBtn").click(function(){
			var idx=$(this).val();
			var url="storeUpData.pop?idx="+idx;
			var option="width=300,height=250,resizable=no,scrollbars=no,status=no";
			window.open(url,"",option);
		});
		
		$(".storeDeleteBtn").click(function(){
			var idx=$(this).val();
			if(confirm("삭제하시겠습니까?")){
				location.href='storeDelete.do?idx='+idx;
			}else{
			}
		});
		
	});
</script>
<style>
	table tr td{
		width:200px;
	}
	
</style>
</head>
<body>
	<table border="1" class="ad_storeList">
	<caption>STORE LIST <button class="storeInsertBtn">추가</button></caption>
	<tr>
		<th>지점명</th>
		<th>x좌표</th>
		<th>y좌표</th>
		<th>주소</th>
		<th>연락처</th>
		<th>서비스</th>
		<th>영업시간</th>
		<th>관리</th>
	</tr>
		<c:forEach var="dto" items="${list }">
		<tr>
			<td>
				${dto.name }
			</td>
			<td>
				${dto.xpoint }
			</td>
			<td>
				${dto.ypoint }
			</td>
			<td>
				${dto.addr }
			</td>
			<td>
				${dto.phone }
			</td>
			<td>
				${dto.service }
			</td>
			<td>
				${dto.ohours }
			</td>
			<td>
				<button value="${dto.idx }" class="storeUpDateBtn">수정</button>
				<button value="${dto.idx }" class="storeDeleteBtn">삭제</button>
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>