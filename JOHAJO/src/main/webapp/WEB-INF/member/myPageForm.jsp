<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>     
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
</head>
<body>
<P>페이지 상단에 <%@ page session="true" %> 선언함</P>
	<%-- saveok :<c:out value="${saveok}" />
	idok : <c:out value="${idok}" />
	loginok <c:out value="${loginok}" />
	userLogin <c:out value="${userLogin.getName()}" /><br> --%>
	

	<div>
		MY PAGE
	</div>
	<div>
		<c:set  var="id" value="${userLogin.getName()}" />
		안녕하세요, <span>${id}</span>님 
	</div>
	<div>
		<ul>
			<li>
				<span><a href="myInfofrom.do">회원정보 수정</a></span>
			</li>
			<li>
				<span><a href="myqnaList.do">고객의 소리</a></span>
			</li>
		</ul>
		<ul>
			<li>
				<span><a href="myReserv.do">나의 예약</a></span>
			</li>
			<li>
				<span><a href="myPoint.do">나의 리워즈</a></span>
			</li>
		</ul>
	</div>


</body>
</html>