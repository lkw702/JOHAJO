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
	}
	
	div.qdata{
		position: relative;
		width: 500px;
		margin:0 auto 20px;
		border: 1px solid gray;
		
	}
	
	
</style>
<script type="text/javascript">
$(function(){
	//삭제
	$(document).on("click","button.delbtn", function(){
		var idx=$(this).attr("idx");
	
		if (!confirm("삭제하시겠습니까?")) {
	        return;
	    }
		
		location.href="myqnaDelete.do?pageNum=${currentPage}&idx="+idx;
		
		/* 
		var fm = $(this);
		$.ajax({
			type: "post",
			url: "myqnaDelete.do",
			data: {'idx':$(this).attr("idx")},
            success:function(data){
            	var str="";
				$(data).find("data").each(function(){
					var s=$(this);
					res=s.find("result").text();
					$(fm).parents('.qna').remove();
					
				});
				alert("삭제 되었습니다.");
				$(fm).parents('div.qdata').remove();
			},error: function(xhr, status, error){
                alert(status);
            }
		}); */
	});
	
	
	//답변 폼 추가
	$(document).on("click","button.addbtn", function(){
		var idx = $(this).attr("idx");
		var fm ="<form name='answerform' id='answerform'>"
			   +"<input type='hidden' name='idx' value='"+idx+"'>"
			   +"<textarea rows='5' cols='30' name='content2'></textarea>"
			   +"<button type='button' class='anwok'>등록</button>"
			   +"</form>";
			   
	 	$(this).hide();
		$(this).next().html(fm);
	});
	
	//답변 등록
	$(document).on("click","button.anwok", function(){
		var fm = $(this).parents("div.answer");
		var param = $("form[name=answerform]").serialize();
		
		$.ajax({
			type: "post",
			url: "myqnaInsert2.do",
			data: param,
            success:function(data){
				var str="";
				$(data).find("data").each(function(){
					var s=$(this);
					idx=s.find("idx").text();
					con=s.find("con").text();
					day=s.find("day").text();
					
					str="<div class='content'>"+con+"</div>";
					str+="<p class='day'>"+day+"</p>";
					str+="<button type='button' class='anwdel' idx='"+idx+"'>답변삭제</button>";
					str+="<button type='button' class='anwform' idx='"+idx+"'>답변수정</button>";
					
				});
				$(fm).empty();       //기존 내용 지움
				$(fm).append(str);
				
            },error: function(xhr, status, error){
                alert(status);
            }
		});
	});
	
	
	//답변삭제
	$(document).on("click","button.anwdel", function(){
		var fm = $(this).parents('div.answer');
		if (!confirm("답변 삭제하시겠습니까?")) {
	        return;
	    }
		var idx = $(this).attr("idx");
		$.ajax({
			type: "post",
			url: "myanwDelete.do",
			data: {'idx':idx},
            success:function(data){
            	var btn="<button type='button' class='addbtn' idx="+idx+">답변달기</button>";
				$(data).find("data").each(function(){
					var s=$(this);
					res=s.find("result").text();
					
				});
				
				$(fm).parents('.qdata').find(".addbtn").show();
				$(fm).empty();
				alert("답변 삭제 되었습니다."+res);
				
			},error: function(xhr, status, error){
                alert(status);
            }
		});
	});
	
	
	
	//답변 수정폼 가져오기/////////////////////////////////////////////////////////////////
	$(document).on("click","button.anwform", function(){
		var fm = $(this).parents("div.answer");
		var idx = $(this).attr("idx");
		$.ajax({
			type: "post",
			url: "myqnaSelect.do",
			data:{"idx":idx},
			success:function(data){
				var str="";
				$(data).find("data").each(function(){
					var s=$(this);
					idx=s.find("idx").text();
					con=s.find("con").text();
					   str ="<form name='answerform' id='answerform'>"
						   +"<input type='hidden' name='idx' value='"+idx+"'>"
						   +"<textarea rows='5' cols='30' name='content2'>"+con+"</textarea>"
						   +"<button type='button' class='anwok'>수정</button>"
						   +"</form>";
						
				});
				$(fm).empty();     
				$(fm).append(str);
				
			},statusCode:{
				404:function(){
					alert("해당 파일을 찾을수 없어요!!");
				},
				500:function(){
					alert("서버 코드 오류");
				}
			}
		});
	});
	
	$(document).on("click","button.anwUpdate", function(){	
		var idx=$(this).attr("idx");
		
		$.ajax({
			type: "post",
			url: "myqnaInsert2.do",
			data: param,
            success:function(data){
				var str="";
				$(data).find("data").each(function(){
					var s=$(this);
					idx=s.find("idx").text();
					con=s.find("con").text();
					day=s.find("day").text();
					
					str="<div class='content'>"+con+"</div>";
					str+="<p class='day'>"+day+"</p>";
					str+="<button type='button' class='anwdel' idx='"+idx+"'>답변삭제</button>";
					str+="<button type='button' class='anwform' idx='"+idx+"'>답변수정</button>";
					
				});
				$(fm).empty();       //기존 내용 지움
				$(fm).append(str);
				
            },error: function(xhr, status, error){
                alert(status);
            }
		});
		
	});
	$(document).on("click","button.anwCancel", function(){
		var idx=$(this).attr("idx");
		
	});
	
	
});

	
</script>
</head>
<body>
    총: <c:out value="${totalCount}" />
    
    <button type="button" onclick="location.href='myqnaForm.do'">문의하기</button>
    
    
    <div class="qnalist">
	    <c:forEach var="dto" items="${list}">
	    
	    <c:if test="${dto.anw==0}">
	    	<c:set var="state" value="답변대기" />
	    	<c:set var="col" value="green" />
	    </c:if>
	    <c:if test="${dto.anw==1}">
	    	<c:set var="state" value="답변완료" />
	    	<c:set var="col" value="pink" />
	    </c:if>
    
	    <c:set var="sel" value="${dto.selection}" />
	   	<c:set var="category" value="${sel==1?'예약관련':sel==2?'취소/환불':
	   		sel==3?'할인쿠폰/포인트':sel==4?'메뉴관련':'회원정보관련'}" />
	   	
   		<div class="qdata ${col}" >
	 		<div>${state} ${dto.idx}</div>
			<div>
				<span>[${category}]</span>
				<span>${dto.title}</span>
				<span>${dto.writeday}</span>
			</div> 
	  		<div>${dto.content}</div>
	  		
	  		
	  
	  			
	   		<button type="button" class="delbtn" idx="${dto.idx}">삭제</button>
	   		<c:if test="${dto.content2 == null }">
	   			<button type="button" class="addbtn" idx="${dto.idx}">답변달기</button>
		   	</c:if>
		   	<div class="answer">
		   	<c:if test="${dto.content2 != null }">
		   	
		  		<div  class="content">${dto.content2}</div>
		  		<p class="day">${dto.anwday}</p>
		  		
		  		<button type="button" class="anwdel" idx="${dto.idx}">답변삭제</button>
			   	<button type="button" class="anwform" idx="${dto.idx}">답변수정</button>
			
		   	</c:if>
		   	</div>
		   	
		</div>
		
    </c:forEach>
    </div>
    
    <!--페이징  -->
	<div class="paging text-center">
		<ul class="pagination">
		
			<c:if test="${startPage > 1 }">
				<li><a href="myqnaList.do?pageNum=${startPage-1}&idx=${log_idx}">◀</a></li>
			</c:if>
			<c:forEach var="pp" begin="${startPage}" end="${endPage}">
				<c:if test="${pp==currentPage }">
					<li><a href="myqnaList.do?pageNum=${pp}&idx=${log_idx}" style="color:red;">${pp}</a></li>
				</c:if>
				<c:if test="${pp!=currentPage }">
					<li><a href="myqnaList.do?pageNum=${pp}&idx=${log_idx}">${pp}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${endPage<totalPage }">
				<li><a href="myqnaList.do?pageNum=${endPage+1}&idx=${log_idx}">▶</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>