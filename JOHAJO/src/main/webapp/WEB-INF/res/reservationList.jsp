<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   $(function(){
	 console.log("aa");
	 var hfoodname="";
	 var hprice=0;
     $("span.selClass").click(function(){
        var a=$(this).attr('sel');
        $("sit").val(a);
        $(".cal").css("display","none");
        $(".store").css("display","none");
        $(".selsit").css("display","none");
        $(".selmenu").css("display","block");
        $("b.seleted").html(a);
     });
     $("li.day").click(function(){
  	   var m=$(this).attr("month");
  	   var d=$(this).text();
  	   var s=m+"/"+d;
  	   $(".hmonth").val(m);
  	   $(".hday").val(d);
  	   $(".seday").html(s);
  	   $(".cal").css("display","none");
       $(".store").css("display","block");
       $(".selsit").css("display","none");
       $(".selmenu").css("display","none");
  	   //console.log(m+"-"+d);
     });
     $("a.selTime").click(function(){
  	   var n=$(this).attr("store");
   	   var t=$(this).attr("time");
   	   var s=n+" "+t;
   	   $(".selStore").html(s)
   	   $(".hstore").val(n);
   	   $(".htime").val(t);
   	   $(".cal").css("display","none");
       $(".store").css("display","none");
       $(".selsit").css("display","block");
       $(".selmenu").css("display","none");
   	   //console.log(n+t);
     });
     $(document).on('click','Button.btnadd',function() { 
     
    	 console.log("aaa");
    	 var f=$(this).attr("fname");
     	 var p=$(this).attr("price");
     	 console.log(f+"  "+p);
     	 this.hfoodname+=f;
     	 this.fprice+=p;
     });
     
     $(document).on('click','Button.btnend',function() {  	 
     	 $(".hfname").val(this.hfoodname);
     	 $(".hprice").val(this.fprice);
     	$(".selmenu").css("display","none");
     });
    
     $(".sidebar-nav a").click(function(){

     	
         var str="";
         var num=$(this).attr("name");
         //console.log("ajax"+num);
         $.ajax({
            type:'get',
            url:'resAppetizer.do',
            data:{"kind":num},
            success:function(redata){
            	
                  $(redata).find("data").each(function(){
                     var s=$(this);
                     idx=s.find("idx").text();
                     fname=s.find("fname").text();
                     imgname=s.find("imgname").text();
                    
                     calorie=s.find("calorie").text();
                     count=s.find("count").text();
                     price=s.find("price").text();
                     
                     
                     str+="<table><tr class='food' fname="+idx+">";
                     str+="<td><img class='fimg' src='/image/"+imgname+"'></td>";
                     str+="<td>fname:"+fname+"<br>";
                     str+="calorie:"+calorie+"<br>";
                     str+="price:"+price+"<br></td>";
                     str+="<td><button type='button' class='btnadd' fname='"+fname+"' price='"+price+"'>+</button></td>";
                   
                     str+="</tr></table>"
                     /* 
                     str+="idx:"+idx+"&nbsp";
                     str+="fname:"+fname+"&nbsp";
                     str+="imgname:"+imgname+"&nbsp";
                     str+="calorie:"+calorie+"&nbsp";
                     str+="price:"+price+"&nbsp";
                     str+="count:"+count+"&nbsp";
                     str+="<br>"; */
                     
                  });
                  str+="<button type='button' class='btnend'>선택완료</button>";
                  $("span#datatest123").html(str);
                  
                  
            },error:function(){
            alert("error");
            }
         });
     });
     
   });
</script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link href="<c:url value="/css/reservation.css"/>" rel="stylesheet">
</head>
<body>

<div id="reserv_menu">
   <form action="res.do">
      <ul>
            <li><span onclick="selday()">날짜선택<b class="seday"></b></span>
               <ul>
                  <li>
                     <div class="cal">
                        <ul>
                           <li>
                              <div class='month'>
                                 <ul>
                                    <li class='prev' onclick="location.href='reslist3.do'">&#10094;</li>
                                    <li>
                                    <li><a href="reslist2.do" class="next">></a></li>
                                    <li><span style='font-size: 18px'>${year }년<br>${month }월</span></li>
                                 </ul>
                              </div>

                              <ul class='weekdays'>
                                 <li>일</li>
                                 <li>월</li>
                                 <li>화</li>
                                 <li>수</li>
                                 <li>목</li>
                                 <li>금</li>
                                 <li>토</li>
                              </ul>
                              <ul class='days'>
                                 <c:forEach begin="1" end='${week-1}'>
                                    <li></li>
                                 </c:forEach>
                                 <c:forEach var='i' begin='1' end='${today-1 }' varStatus="n">
                                    <li ${currentMonth<month?"class='day'":"class='nday'"} month="${month }">${i }</li>
                                 </c:forEach>
                                 <c:forEach var='i' begin='${today}' end='${lastday}' varStatus="n">
                                    <li ${currentMonth<=month?"class='day'":"class='nday'"} month="${month }" >${i }</li>
                                 </c:forEach>
                              </ul>
                           </li>
                        </ul>
						
                     </div>
                  </li>
               </ul></li>

				<li><span onclick="store()">매장선택<b class="selStore"></b></span>
					<ul>
						<li>
							<div class="store">
								<table class='store1'>
									<tr>
										<td>번호</td>
										<td>지점명</td>
										<td>시간선택</td>
									</tr>
									<c:forEach var='i' items='${list }' varStatus='s'>
										<tr>
											<td>${s.count }</td>
											<td><a class="storeName">${i.name }</a></td>
											<td><a class='selTime' time='17:00' store="${i.name}">17:00</a>&nbsp;&nbsp;
												<a class='selTime' time='18:00' store="${i.name}">18:00</a>&nbsp;&nbsp;
												<a class='selTime' time='19:00' store="${i.name}"> 19:00</a>&nbsp;&nbsp; 
												<a class='selTime' time='20:00' store="${i.name}">20:00</a>
											</td>
											
										</tr>
									</c:forEach>
								</table>

							</div>
						</li>
					</ul></li>
				<li><span onclick="sel()">자리선택 <b class="seleted"></b></span>
               <div class="selsit">
                  <c:set var="it">A,B,C,D,E</c:set>
                  <c:forEach var="key" items="${it }">
                     <c:forEach var="i" begin="1" end="5">
                        <span class="selClass" sel="${key}${i}"> <img src="#">
                        </span>
                     </c:forEach>
                     <br>
                  </c:forEach>
               </div></li>

            <li><span onclick="menu()">메뉴선택</span>
               <div class="selmenu">
                  <div id="page-wrapper">
                     <!-- 사이드바 -->
                     <div id="sidebar-wrapper">
                        <ul class="sidebar-nav">
                           <li class="sidebar-brand">course</li>
                           <li><a href="#">HotMenu</a></li>
                           <li><a name="1">Appetizer</a></li>
                           <li><a name="2">Soup</a></li>
                           <li><a name="3">MainDish</a></li>
                           <li><a name="4">SideDish</a></li>
                           <li><a name="5">Dessert</a></li>
                           <li><a name="6">Drink</a></li>
                        </ul>
                     </div>
                     <!-- /사이드바 -->

                     <!-- 본문 -->
                     <div id="page-content-wrapper">
                        <div class="container-fluid">
                           <h1>간단한 사이드바</h1>
                           <p>메뉴가 많아서 한 페이지를 넘으면 세로 스크롤바 생김</p>
                          <span id="datatest123"></span>
                        </div>
                     </div>
                     <!-- /본문 -->
                  </div>
               </div></li>
         </ul>
         <input type='text' readonly="readonly" class='hmonth' value=''>
         <input type='text' readonly="readonly" class='hday' value=''>
         <input type='text' readonly="readonly" class='hstore' value=''>
         <input type='text' readonly="readonly" class='htime' value=''>
         <input type='text' readonly="readonly" class='hsit' value=''>
         <input type='text' readonly="readonly" class='hfname' value=''>
         <input type='text' readonly="readonly" class='hprice' value=''>
         <input type='text' readonly="readonly" class='hmenu' value=''>
         <input type="button" value="예약">
         <input type="button" value="취소">
      </form>
   </div>
</body>
<script type="text/javascript">
   function selday(){
      $(".cal").css("display","block");
      $(".store").css("display","none");
      $(".selsit").css("display","none");
      $(".selmenu").css("display","none");
   }
   function store(){
 
      $(".store").css("display","block");
      $(".selsit").css("display","none");
      $(".cal").css("display","none");
      $(".selmenu").css("display","none");
   }
   function sel(){
      $(".sitback").css("display","block");
      $(".store").css("display","none");
      $(".cal").css("display","none");
      $(".selmenu").css("display","none");
   }
   function menu(){
	   $(".selmenu").css("display","block");
	   $(".store").css("display","block");
	   $(".store").css("display","none");
	   $(".cal").css("display","none");
   }
</script>
</html>