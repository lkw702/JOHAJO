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

</head>
<body>
<form name="login" action="memberlogin.do" method="post">
<%
		String saveok = (String)session.getAttribute("saveok");
		String myid   = (String)session.getAttribute("idok");
		
		boolean isSave;
		if(saveok == null || saveok.equals("no"))
			isSave = false;
		else
			isSave = true;
		
	%>
<div>
	<ul>
		<li>
			<div>
				<input type="checkbox" name="chkid" id="chkid" value="yes" <%=isSave?"checked":"" %>>
				아이디 저장
			</div>
			<div>
				<a href="idSelect.do">아이디 찾기</a>
				<a href="pwSelect.do">비밀번호 찾기</a>
				<a href="joinform.do">회원가입</a>
			</div>
		</li>
		<li>
			<input type="text" name="id" id="id" autofocus="autofocus" required="required"
					placeholder="아이디입력">
			<input type="password" name="pw" id="pw" autofocus="autofocus" required="required"
					placeholder="비밀번호 입력">
			<button type="submit">로그인</button>
				
		</li>
	</ul>
</div>
</form>
</body>
</html>