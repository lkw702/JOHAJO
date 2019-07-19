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
	var sid=$(".session_id").val();
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
	if(sid!=null){
		str1+="포인트 사용 <input type='text' size=5 class='point'><b>사용가능 포인트 : ${point}<b><Button type='button' class='usepoint'>포인트사용</button>";
	}
	$(".out1").html(str1);


	$(document).on('click','Button.usepoint',function() { 
		var use=$(".point").val();
		var p=price-use;
		var str="<b>총 결제금액은"+p+"원 입니다</b>";
		$("div.out2").html(str);
	});
});
</script>
</head>
<body>
<h1>예약</h1>
<input type="hidden" value="${hmonth }" class="hmonth">
<input type="hidden" value="${hday }" class="hday">
<input type="hidden" value="${hstore }" class="hstore">
<input type="hidden" value="${htime }" class="htime">
<input type="hidden" value="${hsit }" class="hsit">
<input type="hidden" value="${hfname }" class="hfname">
<input type="hidden" value="${hprice }" class="hprice">
<input type="hidden" value="${hcourse }" class="hcourse">
<input type="hidden" value="${session_id }" class="session_id">

<div class="out1"></div>
<div class="out2"></div>

</body>
</html>