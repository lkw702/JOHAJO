<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- google map API -->
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?key=AIzaSyCzHxv7okfaTei_0eZFMzhSw6cnN-dITSg"></script>
<script src="<c:url value="/store/js/mapJS.js" />"></script>
<script>
	$(function(){
		map1();
});
	
	function selStore(){
		var a = $(".selStore").val().split(",");
		ajax2(a[0]);
	}
</script>
<style>

div.storlist{
	width: 1200px;
	position: relative;
	
}

#storeMap1 {
	width:80%; 
	height:400px; 
	clear:both;
	margin-left: 5%;
}

div.infostore{
	position:relative;
	font-size: 22pt;
	left: 4%;
	
}
.selStore1{
	display: none;
}
</style>
</head>
<body>
	<div>
		<select class="selStore" onchange="selStore()">
			<c:forEach var="dto" items="${list }">
				<option value="${dto.idx},${dto.name},${dto.xpoint},${dto.ypoint},${dto.addr},${dto.phone}" class="subselStore">${dto.name }</option>
			</c:forEach>
		</select>
		<select class="selStore1">
			<c:forEach var="dto" items="${list }">
				<option value="${dto.idx},${dto.name},${dto.xpoint},${dto.ypoint},${dto.addr},${dto.phone}" class="subselStore">${dto.name }</option>
			</c:forEach>
		</select>
	<form action="search.do" method="post">
		<input type="text" size="10" name="name">
		<input type="hidden" value="${totalCount}" id="total">
		<input type="submit" value="검색">
	</form>
	</div>
	<div id="storeMap1"></div><br>
	<div class="storlist"></div>
</body>
</html>