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
   <h2>Session 사용</h2>
	
	<P>페이지 상단에 <%@ page session="true" %> 선언함</P>
	saveok :<c:out value="${saveok}" />
	idok : <c:out value="${idok}" />
	loginok <c:out value="${loginok}" />
	userLogin <c:out value="${userLogin.getName()}" /><br>
	
	<button type="button" onclick="location.href='userLogout.do'">${userLogin.getName()} 님 로그아웃하기</button>
	
</body>
</html>