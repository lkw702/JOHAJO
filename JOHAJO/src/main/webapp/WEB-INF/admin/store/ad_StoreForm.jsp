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
<script type="text/javascript">
	$(function(){
		$(".storeSubBtn").click(function(){
			window.close();
		});
	});
	function close_Event(){
		opener.parent.location='ad_StoreList.do';
		window.close();
	}
</script>
</head>
<body>
	<form action="storeInsert.do" method="post">
		지점명:<input name="name" type="text"><br>
		x좌표:<input name="xpoint" type="text"><br>
		y좌표:<input name="ypoint" type="text"><br>
		주소:<input name="addr" type="text"><br>
		전화:<input name="phone" type="text"><br>
		영업시간:<input name="ohours" type="text"><br>
		서비스:<input name="service1" type="text"><br>
		<input type="submit" value="저장" onclick="close_Event()">
		<input type="button" value="닫기" class="storeSubBtn">
	</form>
</body>
</html>