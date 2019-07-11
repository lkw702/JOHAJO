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
<style type="text/css">

	div.logo{
		position:relative;
		
		font-size: 40px;
		text-align: center;
		
	}
	div.myform{
		position: relative;
		width: 800px;
		border: 1px solid;
		margin:0 auto;
		background-color: #e1e3e4; 
	}
	
	div.field{
		position: relative;	 
		margin:0 auto;
		background-color: #fff; 
	}
	
	div.field.f1{
		position: relative;
		width:300px;
		text-align: center;
		font-size: 20px;
	}
	
	div.field.f1 p{
	    margin: 100px 0 20px;
    	padding: 20px;
    }
    
    div.field.f1 p span{
    	color:#FE9A2E;
    	font-weight: bold;
    }
    
    div.field.f2{
    	width: 500px;
    	height: auto;
    }
    
    div.field.f2 ul{
    	padding: 0;
    }
	
	div.field.f2 ul li{
	
		width: 50%;
		display: inline-block;
		list-style: none;
		line-height: 30px;
		border: 1px solid;

	}
	div.field.f2 ul li a{
		text-align: center;
		display: block;
	}


</style>
</head>
<body> 
	saveok :<c:out value="${saveok}" /><br>
	log_idx : <c:out value="${log_idx}" /><br>
	log_id <c:out value="${log_id}" /><br>
	log_name <c:out value="${log_name}" /><br>
	loginok <c:out value="${loginok}" /><br>
	
<c:out value="${mupdate}" />
<c:if test="${mupdate =='true'}">
<script type="text/javascript">
	alert("회원 정보 수정완료하였습니다.");
</script>
</c:if>
<%
	session.removeAttribute("mupdate");
%>
	
	
	
	<div class="myform">
		<div class="logo">
			MY PAGE
		</div>
	
		<div class=" field f1">
			<c:set  var="name" value="${log_name}" />
			<p>안녕하세요, <span>${name}</span>님 </p>
			
		</div>
	
		<div class="field f2">
			<ul>
				<li><a href="mypassfrom.do">회원정보 수정</a></li>
				<li><a href="myqnaList.do?idx=${log_idx}">1:1 문의하기</a></li>
				<li><a href="myReservList.do">나의 예약</a></li>
				<li><a href="myPointList.do">나의 리워즈</a></li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
	


</body>
</html>