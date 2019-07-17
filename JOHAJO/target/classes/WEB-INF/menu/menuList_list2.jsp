<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<c:forEach var="dto" items="${list}" >	
			<table>
			    <tr>
			    	<td>${dto.kind}</td>
			    	<td>${dto.idx}</td>
			    	<td>${dto.fname}</td>
			    	<td>${dto.calorie}</td>
			    	<td>${dto.price}</td>			    	
			    </tr>
			</table>
		</c:forEach>
		
	</div>
</body>
</html>