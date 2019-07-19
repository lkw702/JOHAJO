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
	<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/notice.css"/>
	
	<script type="text/javascript">
	$(function(){
		$("#tab>#e_li").addClass('on');
		$(document).on('click','button.couponget',function() {
			var idx=$(this).attr("idx");
			var member=$(this).attr("member");
			//var pageNum=$(this).attr("pageNum");
			
			//location.href="getCoupon.do?idx="+idx+"&member="+member+"&pageNum="+pageNum;
	        $.ajax({
   			
            type:'get',
            url:'getCoupon.do',
            data:{"idx":idx,"member":member},
            success:function(redata){
            $(redata).find("coupon").each(function(){
            	var s=$(this);   
            	check=s.find("check").text();
            	console.log(check);
            		if(check=='3'){
            			alert("로그인을 해주세요");
            			location.href="loginform.do?path=noticeevent.do";
            		}else if(check=='1'){
            			alert("이미 받은 쿠폰입니다");
            		}else if(check=='2'){
            			alert("쿠폰을 받았습니다");
            		}
            	});
            	 }
			});
			});
	});
	</script>
	</head>
	<body>
		<ul class="ectab" id="ectab">
		    <li class="ece_li" id="ece_li"><a href="noticeevent.do">진행중인 이벤트</a></li>
		    <li class="ece_li"><a href="event_win.do">당첨자 발표</a></li>	
		</ul>
		<div class="ectab_con" id="ectab_con">
		   <table style="width: 900px;">
			<tr>
				<th>
					&nbsp;${dto.title}
					<span style="margin-left: 500px; color: lightgray;">
						${dto.writedate}
					</span>
				</th>
			</tr>
			<tr height="400">
				<td valign="top">
					<span>${dto.content}
					<button class="couponget" type="button" member='${log_idx}' idx='${dto.idx}' pageNum='${pageNum }'>쿠폰받기</button>
					</span>
				</td>
			</tr>
		</table>
		<div>
			<button type="button" onclick="location.href='noticeevent.do?pageNum=${pageNum}'">목록</button>
		</div>
		</div>	
	</body>

</html>