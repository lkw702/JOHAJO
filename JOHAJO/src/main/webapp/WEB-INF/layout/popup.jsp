<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
<link href="https://fonts.googleapis.com/css?family=Cute+Font" rel="stylesheet" >
<style type="text/css">
	div.layout{
		position: relative;
		width: 250px;
	    margin: 0 auto;
	    padding: 0 8px;
		border: 1px solid black;
	}

	
</style>
</head>
<body>
	<div class="layout">
		<div id="popup" class="popup">
			<tiles:insertAttribute name="popup"/>
		</div>
	</div>

</body>
</html>