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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	/* $(document).on("click","button.idch", function(){
		var userId = $(".id").val();
		
		var url="idCheck.pop?id="+userId;
		var option="width=370,height=360,resizable=no,scrollbars=no,status=no";
		window.open(url,"",option);
	}); */
	
	
	$(document).on("change","input.birthselect", function(){
		var date = $(this).val().replace(/-/gi,"/");
		$(".birth").val(date);
	});
	

	$(document).on("change","select#hp", function(){
		$("#hp1").val($(this).val());
		console.log($(this).val());
	});

});

function idch(){
	var url="idCheck.pop";
	var option="width=370,height=360,resizable=no,scrollbars=no,status=no";
	window.open(url,"",option);
}

</script>
<style type="text/css">

	div.center{
		position: relative;
		width: 100%;
		float: left;
	}
	
	span.subejct{position: relative;font-size: 40px;text-align: center;display: block;}
	
	
	div.joinform {
		position: relative;
		width: 495px;
		height: auto;
		margin: 60px auto 0;
		padding: 0 17px 10px;
		background-color: #e1e3e4;
	}
	
	div.joinform div.field ul li{
		list-style: none;
		font-size: 15px;
		margin-top: 10px;
	}
	
	input[type="text"], input[type="password"] { 
	height: auto; 
	line-height: normal;  
	padding: 0.3em .2em;
	border-radius: 8px;
    border: 0; }

	select { 
		width: 94px;
	    padding: .2em .2em;
	    font-family: inherit;
	    background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 99% 31%;
	    border: 1px solid #999;
	    border-radius: 6px;
	    -webkit-appearance: none;
    }

	div.joinform div.field ul{
		padding-left:10px;
	}
	div.joinform div.field ul li span{
		display: inline-block;
		width: 90px;
	    margin-bottom: 5px;
	    padding: 2px;
	    text-align: center;
	    
	}

	div.joinform span.bold{
		font-size: 15px;
		font-weight: bold;
	}

</style>
</head>
<body>

	<form name="mJoinForm" action="memberInsert.do" method="post">
	<div class="center">
	<div class="joinform">
		<span class="subejct">Single Dinner</span>
		
		<div class="field">
		<span class="bold">필수정보</span>
			<ul>
				<li>
					<span>아이디</span> 
					<input type="text" name="id" class="id" readonly="readonly" required="required">
					<button type="button"  onclick="idch();">아이디체크</button>
				</li>
				<li>
					<span>비밀번호 </span>
					<input type="password" name="password" autofocus="autofocus" required="required"
					placeholder="비밀번호(6~16자)" size="16"> 
					<input type="password" name="password2" autofocus="autofocus" required="required"
					placeholder="비밀번호 확인 ">
				</li>
				<li>
					<span>이름 </span>
					<input type="text" name="name" autofocus="autofocus" required="required"
						placeholder="이름">
				</li>
								
				<li>
					<span>휴대폰</span>
					<input type="hidden" name="hp1" id="hp1"> 
					<select name="hp" id="hp">
						<option value="" selected>선택</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select> - 
					<input type="text" name="hp2" size="4" autofocus="autofocus"> - 
					<input type="text" name="hp3" size="4" autofocus="autofocus">
				</li>
			
				
				<li>
					<span>이메일</span>
					<input type="text" name="email" autofocus="autofocus" required="required"
					placeholder="이메일 ">
				</li>
			</ul>
		</div>
		
		
		
		<div class="field">
			<span class="bold">추가정보</span>
			<ul>
				
				<li>
				<span>성별</span>
				<input type="radio" name="gender" value="1" checked="checked"> 여자 <input
					type="radio" name="gender" value="2"> 남자</li>
			
				
				<li>
				<span>생년월일</span>
				<input name="birth" class="birth" type="hidden"> <input
					name="birth2" class="birthselect" type="date"></li>
			</ul>
		</div>
		
	</div>
	</div>
	<!-- 버튼 -->
	<div class="btnform">
		<div class="btn "><button type="button">취소</button></div>
		<div class="btn btn2"><button type="submit">등록</button></div>
	</div>
	</form>
	
</body>
</html>