<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	var month=$(".hmonth").val();
	var day=$(".hday").val();
	var store=$(".hstore").val();
	var time=$(".htime").val();
	var sit=$(".hsit").val();
	var fname=$(".hfname").val();
	var price=$(".hprice").val();
	var course=$(".hcourse").val();
	fname.split(",");
	
	var str1="";
	str1+="<table><caption>예약</caption>";
	str1+="<tr><th>예약일</th><th>"+month+"월"+day+"일</th></tr>";
	str1+="<tr><th>지점명</th><th>"+store+"</th></tr>";
	str1+="<tr><th>예약시간</th><th>"+time+"</th></tr>";
	str1+="<tr><th>예약좌석</th><th>"+sit+"</th></tr>";
	if(fname!=""){
		str1+="<tr><th>메뉴</th><th>"+fname+"</th></tr>";
	}
	str1+="<tr><th>총가격</th><th>"+price+"</th></tr>";
	if(course!=""){
		str1+="<tr><th>코스</th><th>"+course+"</th></tr>";
	}
	str1+="</table>";
	$(".out1").html(str1);
});
</script>
</head>
<body>
<h1>예약</h1>
<input type="text" value="${hmonth }" class="hmonth">
<input type="text" value="${hday }" class="hday">
<input type="text" value="${hstore }" class="hstore">
<input type="text" value="${htime }" class="htime">
<input type="text" value="${hsit }" class="hsit">
<input type="text" value="${hfname }" class="hfname">
<input type="text" value="${hprice }" class="hprice">
<input type="text" value="${hcourse }" class="hcourse">
<div class="out1"></div>


</body>
</html>