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
	
	/* $("button.use").click(function(){
		var id = $(this).prev().find("#user").val();
		
		$("#id", parent.opener.document).val(id);
		
		opener.mJoinForm.id.value=id;
		//console.log($("#user").val());
		//alert("성공"+$("#user").val());
		window.close();
	});
	
	$("button.close").click(function(){
		var userId = $(this).prev().find("#user").val();
		$("#id", parent.opener.document).val("");
		
		location.href="idCheck.pop?id="+userId;
		//window.close();
	}); */
});
</script>

<%
	String key = request.getParameter("key");
%>
</head>
<body>

   <c:out value="${key}" />
   <c:out value="${result}"/>
   <c:if test="${key == null}">
	  	<form action="idCheck.pop" method="post">
			<div>
				<b>사용 할 아이디 입력하세요</b>
				<b>아이디 : </b> 
				<input type="text" name="id" size="10" required="required" autofocus="autofocus">
				<input type="hidden" name="key" id="id" value="yes"> 
				<input type="submit" value="중복체크">
				
			</div>
		</form>
   </c:if>   
   
	<c:if test="${key.val().equals('yes')}">
		조회해봄
	</c:if>
	<c:if test="${result == 1}">
		중복될떄 
	</c:if>
	<c:if test="${result == 0}">
		안될떄
		<span>사용 가능한 아이디 입니다.</span>
	   	<input type="hidden" id="user" value="">
	   	<button type="button" class="use">사용하기</button>
   	
	</c:if>
  	 
   
 
   
</body>
</html>