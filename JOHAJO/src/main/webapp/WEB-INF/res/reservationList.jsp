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
	  	addFoodIdx="";
		function calender(num){
   		
   		$.ajax({
   			
            type:'get',
            url:'reslist2.do',
            data:{"month":num},
            success:function(redata){
            	var str="";
       	   		var str2="";
            	var cday="";
            $(redata).find("calendar").each(function(){
            	var s=$(this);
            	week=s.find("week").text();
            	currentyear=s.find("currentyear").text();
            	currentyear1=parseInt(currentyear);
            	lastday=s.find("lastday").text();
            	lastmonth=s.find("lastmonth").text();
            	var lastmonth1=parseInt(lastmonth);
            	lastmday=s.find("lastmday").text();
            	var lastmday1=parseInt(lastmday);
            	currentMonth=s.find("currentMonth").text();
            	currentMonth1=parseInt(currentMonth);
            	lastday1=0;
            	week1=0;
            	lastday1=parseInt(lastday);
            	week1=parseInt(week)-1;
            	month=s.find("month").text();
            	month1=parseInt(month);
            	year=s.find("year").text();
            	year1=parseInt(year);
            	today=s.find("today").text();
            	//console.log(lastday1);
            	//console.log(week1);
            	//console.log(month1);
            	var s1=month1+1;
               	var s2=month1-1;
            	//var lo2='onclick="calender('+s1+')"';
            	//console.log(lo2);
            	//var lo3='onclick="calender('+s2+')"';
            	//console.log(lo3);
            		str2+="<ul>";
            		//console.log("현재"+currentMonth1);
            		//console.log("처음달"+month1);
            	if(currentyear1==year1){
            		if(currentMonth1<month1){
            		str2+="<li class='prev' month="+s2+">&#10094;</li>";
            		}
            	}else{
            		str2+="<li class='prev' month="+s2+">&#10094;</li>";
            	}
				str2+="<li>";
				
				
				if(month1<lastmonth){
					str2+="<li><a class='next' month="+s1+">&#10095;</a></li>";
					
				}
				str2+="<li><span style='font-size: 18px'>"+year+"년<br>"+month+"월</span></li>";
            	
            	for(i=0;i<week1;i++){
   					str+="<li></li>";
            	}
            	today1=parseInt(today);
            	for(j=1;j<=lastday1;j++){
            		
            		if(month1==currentMonth1){
                		if(today1>j){
                			//console.log("여기들어옴1")
                			str+="<li class='nday' month='"+month+"'>"+j+"</li>";
                		}else{
                			//console.log("여기들어옴2")
                			str+="<li class='day' month='"+month+"'>"+j+"</li>";
                		}
            		}else if(month1==lastmonth1){
            			if(today1<j){
            				str+="<li class='nday' month='"+month+"'>"+j+"</li>";
            			}else{
            				str+="<li class='day' month='"+month+"'>"+j+"</li>";
            			}
            		}else{
            			str+="<li class='day' month='"+month+"'>"+j+"</li>";
            		}
            	}
            	str+="</ul>";
        		str+="</li>";
        		//console.log(str2);
   				//console.log(str);
            });
            
            $("div.month").html(str2);
     		$("ul.days").html(str);
		},error : function( jqXHR, textStatus, errorThrown ) {

        	alert( jqXHR.status );

  
        }
   		});
	 }
		now=new Date();
		var mon=now.getMonth()
		calender(mon);
	$(document).on('click','.next',function() { 
		var s=0;
		s=$(this).attr("month");
		s1=s-1;
		//console.log(s1);
		calender(s1);
	});
	$(document).on('click','.prev',function() { 
		var s=0;
		s=$(this).attr("month");
		s1=s-1;
		//console.log(s1);
		calender(s1);
	});
     
    $(document).on('click','span.selClass',function() { 
        var a=$(this).attr('tablen');
        
       // location.href="/resApp6.do?";
        $("sit").val(a);
        $(".cal").css("display","none");
        $(".store").css("display","none");
        $(".selsit").css("display","none");
        $(".selmenu").css("display","block");
        $("b.seleted").html(a);
        $(".hsit").val(a);
    });
     $(document).on('click','li.day',function() { 
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
   	 	$.ajax({
	        type:'get',
	        url:'reservation2.do',
	        data:{"store":n},
	        success:function(redata){
	        	var str="";
	        	var cl="class='selClass'";
	        	var img="src='image/home.jpg'";
	        $(redata).find("data").each(function(){
	        	var s=$(this);
            	var top=s.find("toplo").text();
            	var left=s.find("leftlo").text();
            	var max=s.find("maxres").text();
            	console.log("top"+top+"left"+left);
	        	var tablename=s.find("tbname").text();
            	console.log("table_n"+tablename);
            	str+="<span class='selClass' tablen="+tablename+">";
            	str+="<img "+img+" "+cl+" style='position: relative;max-width: 20px;top:"+top+"px;left:"+left+"px;'>";
            	str+="</span>";	
	        });
	       
	        $("div.selsit").html(str);
	        },error : function( jqXHR, textStatus, errorThrown ) {
	        	alert( jqXHR.status );
	        }
	        });
   	   $(".selStore").html(s)
   	   $(".hstore").val(n);
   	   $(".htime").val(t);
   	   $(".cal").css("display","none");
       $(".store").css("display","none");
       $(".selsit").css("display","block");
       $(".selmenu").css("display","none");
   	   //console.log(n+t);
     });
    /*  $(document).on('click','Button.btnadd',function() { 
     	 f1=$(".hfname").val();
     	 p1=$(".hprice").val();
    	 if(f1!=""){
    		 f1+=",";
    	 }
    	 if(p1!=""){
    		 p1+=",";
    	 }
    	 f1+=$(this).attr("fname");
     	 p1+=$(this).attr("price");
     	 $(".hfname").val(f1);
    	 $(".hprice").val(p1);
     	 console.log(f1+"  "+p1);
     }); */
     $(document).on('click','Button.btndel',function() { 
    	 f1=$(".hfname").val();
     	 p1=$(".hprice").val();
     	 f1.split(",")
     });
    
     $(".sidebar2 a").click(function(){
    	 
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
                     price=s.find("price").text();
                     
                     
                     str+="<table><tr class='food' fname="+idx+">";
                     str+="<td><img class='fimg' src='/image/"+imgname+"'></td>";
                     str+="<td>fname:"+fname+"<br>";
                     str+="calorie:"+calorie+"<br>";
                     str+="price:"+price+"<br></td>";
                     str+="<td><button type='button' class='btnadd' fname='"+fname+"' price='"+price+"' idx='"+idx+"'>+</button></td>";
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
            	
                  $("span#datatest123").html(str);
                  
                  
            },error : function( jqXHR, textStatus, errorThrown ) {

            	alert( jqXHR.status );

            }
         });
     });
     $(document).on('click','Button.btnadd',function() { 
    	 $(this).css("display","none");
    	 
    	 //$(this).css("display","none");
    	 //console.log(3);
    	 var str="";
         var num=$(this).attr("idx");
         if(addFoodIdx==""){
        	 addFoodIdx+=num;
         }else{
         	addFoodIdx+="/"+num;
         }
         console.log(addFoodIdx);
         var name=$(this).attr("fname");
         /* var count=$("b.con").attr("count");
         var count1=0;
         if(count==null){
        	 count1=1;
         }else{
        	 count1=parseInt(count);
         }
         console.log(count); */
         
         var i=0;
         
         //console.log("ajax"+num);
         $.ajax({
            type:'get',
            url:'resAppetizer2.do',
            data:{"idx":num,"name":name},
            success:function(redata){
            	     
            	     //console.log("count: "+count);
            		$(redata).find("data").each(function(){
                     var s=$(this);
                     idx=s.find("idx").text();
                     fname=s.find("fname").text();
                     imgname=s.find("imgname").text();
                     calorie=s.find("calorie").text();
                     price=s.find("price").text();
                     
                     
                     str+="<table><tr class='food' fname="+idx+">";
                     str+="<td>fname:"+fname+"<br>";
                     str+="calorie:"+calorie+"<br>";
                     str+="price:"+price+"<br></td>";
                     str+="<td><button type='button' class='btndel' fname='"+fname+"' price='"+price+"' idx='"+idx+"' icount='"+i+"'>-</button></td>";
                     str+="<td>수량  <b class='countdel' idx="+idx+">-</b><b class='con'>1</b><b class='countadd'>+</b></td>";
                     str+="</tr></table>"
                   	 i++;
                     
                  });
                  str+="<button type='button' class='btnend'>선택완료</button>";
                  $("div.seleted").html(str);
                  
                  
            },error:function(){
            alert("error");
            }
         });
     });
     $(document).on('click','b.countdel',function() { 
    	var str="";
    	var count=$("b.con").text();
    	//console.log(count);
    	var count1=parseInt(count)-1;
    	//console.log(count1);
    	$("b.con").html(count1);
     });
     $(document).on('click','b.countadd',function() { 
     	var str="";
     	var count=$("b.con").text();
     	//console.log(count);
     	var count1=parseInt(count)+1;
     	//console.log(count1);
     	$("b.con").html(count1);
      });
     $(document).on('click','Button.btndel',function() { 
    	 var length=$("Button.btnadd").length;
    	 var idx=$(this).attr("idx");
    	 
    	 var idx1=parseInt(idx);
    	 console.log(idx);
    	 this.addnum=idx;
    	 for(x=0;x<length;x++){
    		 var abtn=$("button:eq("+x+")").attr("idx");
    		 var abtn1=parseInt(abtn);
    		 if(idx1==abtn1){
    			 $("button:eq("+x+")").css("display","block");
    			 break;
    		 }
    	 }
    	 var str="";
         var num=$(this).attr("icount");
         var num1=parseInt(num);
         
         var i=0;
         //console.log("ajax"+num1);
         $.ajax({
            type:'get',
            url:'resAppetizer3.do',
            data:{"idx":num1},
            success:function(redata){
            	
            	 $(redata).find("data").each(function(){
                     var s=$(this);
                     idx=s.find("idx").text();
                     fname=s.find("fname").text();
                     imgname=s.find("imgname").text();
                     calorie=s.find("calorie").text();
                     price=s.find("price").text();
                     
                     
                     str+="<table><tr class='food' fname="+idx+">";
                     str+="<td>fname:"+fname+"<br>";
                     str+="calorie:"+calorie+"<br>";
                     str+="price:"+price+"<br></td>";
                     str+="<td><button type='button' class='btndel' fname='"+fname+"' price='"+price+"' idx='"+idx+"' icount='"+i+"'>-</button></td>";
                     str+="</tr></table>"
                   	 i++;
                     
                  });
            	
            	 str+="<button type='button' class='btnend'>선택완료</button>";
                  $("div.seleted").html(str);
                  
                  
            },error : function( jqXHR, textStatus, errorThrown ) {

            	alert( jqXHR.status );

      
            }
         });
        
         //console.log("idx1"+idx1);
         var addFoodIdx1="";
         var j=0;
         
         var num3=$(this).attr("idx");
        		var i=0;
         		var addF=addFoodIdx.split('/');
         		for(var s in addF){
               	 j++;
                }
         		
         		if(j>1){
         			for(var s in addF){
        	 			//console.log("ㅁ"+addF[s]);
        	 			var str=parseInt(addF[s]);
        	 			console.log(str+"="+num3);
        	 			if(str!=num3){
        	 				if(i==0){
        	 					addFoodIdx1=addF[s];
        	 					i++;
        	 				}else{
        	 					addFoodIdx1+="/"+addF[s];
        	 					console.log("여기는"+addFoodIdx1);
        	 				}
        	 				
        	 			}
        	 		}
         		}
         addFoodIdx=addFoodIdx1;
         			console.log("addF "+addFoodIdx);
         	
         
     });
     $(document).on('click','Button.btnend',function() { 
    	 $.ajax({
             type:'get',
             url:'resAppetizer4.do',
             success:function(redata){
             	var n="";
             	var p=0;
             	 $(redata).find("data").each(function(){
                      var s=$(this);
                      fname=s.find("fname").text();
                      price=parseInt(s.find("price").text());
                      p+=price;
                      n+=(n.length==0?"":",")+fname;
             	 });
             	 //console.log(p);
             	 //console.log(n);
             	$(".hprice").val(p);
                $(".hfname").val(n);
                str="";
                $("div.seleted").html(str);
                $(".selmenu").css("display","none");
             },error : function( jqXHR, textStatus, errorThrown ) {

             	alert( jqXHR.status );
             }
     });
   });
   $(".resok").click(function(){
	   	  var day=$("b.seday").text();
		  var store=$("b.selStore").text();
		  var selsit=$("b.seleted").text();
		  var fname=$("input.hfname").val();
		  var course=$("input.hcourse").val();
		  console.log("fname"+fname);
		  console.log("course"+course);
		  if(day==""){
			  alert("날짜를 선택해주세요");
			  $(".cal").css("display","block");
		      $(".store").css("display","none");
		      $(".selsit").css("display","none");
		      $(".selmenu").css("display","none");
		      return false;
		  }else if(store==""){
			  alert("매장 및 시간을 선택해주세요");
			  $(".cal").css("display","none");
		      $(".store").css("display","block");
		      $(".selsit").css("display","none");
		      $(".selmenu").css("display","none");
		      return false;
		  }else if(selsit==""){
			  alert("자리를 선택해주세요");
			  $(".cal").css("display","none");
		      $(".store").css("display","none");
		      $(".selsit").css("display","block");
		      $(".selmenu").css("display","none");
		      return false;
		  }else if(fname==""&&course==""){
			  alert("메뉴를 선택해주세요");
			  $(".cal").css("display","none");
		      $(".store").css("display","none");
		      $(".selsit").css("display","none");
		      $(".selmenu").css("display","block");
		      return false;
		  }
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
   <form action="resAppetizer5.do">
      <ul>
            <li><span onclick="selday()">날짜선택<b class="seday"></b></span>
               <ul>
                  <li>
                     <div class="cal">
								<ul>
									<li>
										<div class='month'>
											
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
												<a class='selTime' time='19:00' store="${i.name}">19:00</a>&nbsp;&nbsp; 
												<a class='selTime' time='20:00' store="${i.name}">20:00</a>
											</td>
											
										</tr>
									</c:forEach>
								</table>

							</div>
						</li>
					</ul></li>
				<li><span onclick="selectsit()">자리선택 <b class="seleted"></b></span>
               <div class="selsit" style="width: 200px;height: 200px;position: relative;">
                  <%-- <c:set var="it">A,B,C,D,E</c:set>
                  <c:forEach var="key" items="${it }">
                     <c:forEach var="i" begin="1" end="5">
                        <span class="selClass" sel="${key}${i}"> <img src="#">
                        </span>
                     </c:forEach>
                     <br>
                  </c:forEach> --%>
               </div></li>

            <li><span onclick="menu()">메뉴선택</span>
               <div class="selmenu" >
                  <div id="sidebar">
                     <!-- 사이드바 -->
                     <div id="sidebar1">
                        <ul class="sidebar2">
                           <li class="sidebar3">course</li>
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
                          <span id="datatest123"></span>
                        </div>
                     </div>
                     
                  </div>
                 
               </div></li>
               <div><h2>선택한 메뉴</h2><br><div class="seleted"></div></div>
               
         </ul>
         <input type='hidden' class='hmonth' name='hmonth' value=''>
         <input type='hidden' class='hday' name='hday' value=''>
         <input type='hidden' class='hstore' name='hstore' value=''>
         <input type='hidden' class='htime' name='htime' value=''>
         <input type='hidden' class='hsit' name='hsit' value=''>
         <input type='hidden' class='hfname' name='hfname' value=''>
         <input type='hidden' class='hprice' name='hprice' value=''>
         <input type='hidden' class='hcourse' name='hcourse' value=''>
         <input type="submit" class="resok" value="예약">
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
 
      $(".cal").css("display","none");
      $(".store").css("display","block");
      $(".selsit").css("display","none");
      $(".selmenu").css("display","none");
   }
   function selectsit(){
	   //console.log("1");
	  var day=$("b.seday").text()
	  var store=$("b.selStore").text()
	  if(day!=""&&store!=""){
      	$(".cal").css("display","none");
      	$(".store").css("display","none");
      	$(".selsit").css("display","block");
      	$(".selmenu").css("display","none");
	  }else if(day==""){
		  alert("날짜를 선택해주세요")
	  }else if(store==""){
		  alert("매장 및 시간을 선택해주세요")
	  }   
	 }
   function menu(){
      $(".cal").css("display","none");
      $(".store").css("display","none");
      $(".selsit").css("display","none");
      $(".selmenu").css("display","block");
   }
   
</script>
</html>