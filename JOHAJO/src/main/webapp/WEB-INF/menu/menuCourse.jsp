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
<script type="text/javascript">
	$(function(){
		$(".course_btn").click(function(){
			var idx = $(this).attr("idx");
			location.href="menucourse.do?idx="+idx;
		});
	});
</script>
</head>
<body>
	<div class="course">
		<div class="course_select">
			<button class="course_btn" idx="4">A</button>
			<button class="course_btn" idx="5">B</button>
			<button class="course_btn" idx="6">C</button>
		</div>
		<div class="course_menu">
			${dto.appe}<br>
			${dto.soup}<br>
			${dto.main}<br>
			${dto.side}<br>
			${dto.des}<br>
			${dto.drink}<br>
			${dto.tot_pri}<br>
		</div>
			
	</div>
</body>
</html>
