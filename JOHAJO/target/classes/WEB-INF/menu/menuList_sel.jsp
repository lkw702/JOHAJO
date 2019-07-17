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
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/menu.css"/>

	</head>
	<body>
			<div class="menu_list">
				<div class="menu_left">
				menu_left
					<div class="menu_mmain">
						<a href="menusel.do?kind=3">main<img src="http://www.aitwb.org/upload/centers_img/no-image-available.jpg"></a>
					</div>
						<div class="menu_left2">
						menu_left2
							<div class="menu_soup">
							<a href="menusel.do?kind=2">soup<img src="http://www.aitwb.org/upload/centers_img/no-image-available.jpg"></a>
							</div>
							<div class="menu_dess">
							<a href="menusel.do?kind=5">dess<img src="http://www.aitwb.org/upload/centers_img/no-image-available.jpg"></a>
							</div>
						</div>
				</div>
				
				<div class="menu_right">
				menu_right
					<div class="menu_appe">
					<a href="menusel.do?kind=1">appe<img src="http://www.aitwb.org/upload/centers_img/no-image-available.jpg"></a>
					</div>
						<div class="menu_right2">
						menu_right2
							<div class="menu_drink">
							<a href="menusel.do?kind=6">drink<img src="http://www.aitwb.org/upload/centers_img/no-image-available.jpg"></a>
							</div>
							<div class="menu_side">
							<a href="menusel.do?kind=4">side<img src="http://www.aitwb.org/upload/centers_img/no-image-available.jpg"></a>
							</div>
						</div>
				</div>
				
			</div>
	</body>
</html>
