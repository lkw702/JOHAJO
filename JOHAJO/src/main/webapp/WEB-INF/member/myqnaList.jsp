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
<style type="text/css">

	div.qnalist{
		position: relative;
		width: 350px;
	}
	
	div.qnalist ul{
		border: 1px solid gray;
	}
	
	div.qnalist ul li{
		list-style: none;
	}
	
</style>
<script type="text/javascript">
$(function(){
	$(document).on("click","button.anwInsert", function(){
		
		var param = $("form[name=answer]").serialize();
		
		$.ajax({
			type: "post",
			url: "myqnaInsert2.do",
			data: param,
            success:function(data){
				var str="";
				$(data).find("data").each(function(){
					var s=$(this);
					idx=s.find("idx").text();
					anw=s.find("anw").text();
					con=s.find("con").text();
					day=s.find("day").text();
					
					    str="<div class='qnaok'>";
						str+="<span>idx : "+idx+"</span><br>";
						str+="<span>답변완료: "+anw+"</span><br>";
						str+="<span>내용: "+con+"</span><br>";
						str+="<span>등록일 : "+day+"</span><br>";
						str+="</div>";
					
				});
				
				$(this).next().empty();
				$(this).next().html(str);
				
				
			},error: function(xhr, status, error){
                alert(status);
            }
		});
		
		
	});
	
	$(".anwbtn").click(function(){
		var grp=$(this).attr("grp");
		var fm ="<form name='answer' id='answer'>"
			   +"<input type='hidden' name='selection' value='0'>"
			   +"<input type='hidden' name='anw' value='1'>"
			   +"<input type='hidden' name='mem_f' value='${log_idx}'>"
			   +"<input type='hidden' name='grp' value='"+grp+"'>"
			   +"<div><textarea rows='5' cols='70' name='contents'></textarea></div>"
			   +"<button type='button' class='anwInsert'>등록</button>"
			   +"</form>";
			   
		$(this).next().html(fm);
	});
	
});

	
</script>
</head>
<body>
    Q&A 리스트
    총: <c:out value="${totalCount}" />
    
    <button type="button" onclick="location.href='myqnaForm.do'">문의하기</button>
    <div class="qnalist">
    <c:forEach var="dto" items="${list}">
    
    <c:if test="${dto.anw==0}">
    	<c:set var="on" value="답변대기" />
    </c:if>
    <c:if test="${dto.anw==1}">
    	 <c:set var="on" value="답변완료" />
    </c:if>
    
    <c:choose>
       <c:when test="${dto.selection == 1}">
           	<c:set var="sel" value="예약관련" />
       </c:when>
       <c:when test="${dto.selection == 2}">
           	<c:set var="sel" value="취소/환불" />
       </c:when>
       <c:when test="${dto.selection == 3}">
            <c:set var="sel" value="할인쿠폰/포인트" />
       </c:when>
        <c:when test="${dto.selection == 4}">
            <c:set var="sel" value="메뉴관련" />
       </c:when>
        <c:when test="${dto.selection == 5}">
            <c:set var="sel" value="회원정보관련" />  
       </c:when>
   	</c:choose>
   		<div class="qna" >
	   		<ul>
				<li>${on}  ${sel} </li>
	    		<li>title: ${dto.title}</li>
	    		<li>contents: ${dto.contents}</li>
	    		<li>imagename: ${dto.imagename}</li>
	    		<li>mem_f: ${dto.mem_f} </li>
	    		<li>writeday: ${dto.writeday}
	    			<div class="anwbtn" grp="${dto.grp}">답변달기</div>
	    			<div class="anwform"></div>
	    		</li>
	    	</ul>
   		</div>
    	
    
    </c:forEach>
    </div>
</body>
</html>