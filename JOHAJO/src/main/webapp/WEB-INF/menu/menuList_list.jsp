<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.menulist_list{
		border: 1px solid gray;
		width:700px;
		
	}
	#menulist_img{
		width: 300px;
	}
</style>
<script type="text/javascript">
$(function(){
	$(".menulist_list").click(function(){
		var idx = $(this).attr("idx");
		console.log(idx);
		window.open('http://localhost:9000/JOHAJO/menusel1.do?idx='+idx, 'testWindow', 'width=1000, height=1000', '_blank');
	});

});
</script>
</head>
<body>

	<div id="menu_list">
	<div id="largeview">s</div>	
		<c:forEach var="dto" items="${list}" >	
				<table class="menulist_list" idx="${dto.idx}">
				    <tr> 
				    	<td>
				    	<img id="menulist_img" class="menu_img" src="http://www.aitwb.org/upload/centers_img/no-image-available.jpg">
				    	</td>
				    	<td >${dto.idx}</td>
				    	<td>${dto.fname}</td>
				    	<td>${dto.calorie}</td>
				    	<td>${dto.price}</td>			    	
				    </tr>
				</table>
		</c:forEach>
		
	</div>
</body>
</html>