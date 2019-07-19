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
<link href="<c:url value="/css/admin_event.css"/>" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		$(".adevent_tr").on("click", function(){
			var idx=$(this).attr("idx");
			//var pageNum=$(this).attr("pageNum");
			var count=$(this).attr("count");
			$.ajax({
	            type:'get',
	            url:'ad_eventOneData.do',
	            data:{"idx":idx,"count":count},
	            success:function(redata){
	            	var str="";
	            $(redata).find("calendar").each(function(){
	            	
	            });
	            }
		});
	})
</script>
</head>
<body>
	<table>
		<caption>이벤트 리스트</caption>
		<c:forEach var="dto" items="${list}" varStatus="i">
		<tr class="adevent_tr" idx="${dto.idx}" count="${i.count }">
			<td>${i.count }</td>
			<td><img class="adevent_list_img" src="image/${dto.title_img}"></td>
			<td>${dto.title}</td>
			<div class="${i.count }"></div>
		</tr>
		</c:forEach>
	</table>
</body>
</html>