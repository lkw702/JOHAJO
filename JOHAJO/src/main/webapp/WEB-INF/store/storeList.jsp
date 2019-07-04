<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- google map API -->
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?key=AIzaSyCzHxv7okfaTei_0eZFMzhSw6cnN-dITSg"></script>
<script src="<c:url value="/store/js/mapJS.js" />"></script>
<script>
	$(function(){
		var locations=new Array();
		var totalCount=$("#total").val();
		for(var i=0;i<totalCount;i++ ){
			var splitlocations=$(".subselStore").eq(i).val().split(",");
			locations[i]=new Array(splitlocations.length);
			for(var j=0;j<splitlocations.length;j++){
				locations[i][j]=splitlocations[j];	
				}
			}
	    var map = new google.maps.Map(document.getElementById('storeMap1'), {
		      zoom: 7,
		      center: new google.maps.LatLng(36.626457, 127.493725),
		      mapTypeId: google.maps.MapTypeId.ROADMAP
		    });

		    var infowindow = new google.maps.InfoWindow();

		    var marker, i;
		    for (i = 0; i < locations.length; i++) {  
		      marker = new google.maps.Marker({
		        id:i,
		        position: new google.maps.LatLng(locations[i][2], locations[i][3]),
		        map: map,
		        name:locations[i][1],
		      	title:locations[i][1],
		      });

		      google.maps.event.addListener(marker, 'click', (function(marker, i) {
		        return function() {
		          infowindow.setContent(locations[i][1]+"<hr>"+locations[i][4]+"<br>"+locations[i][5]);
		          infowindow.open(map, marker);
		          //map2(this.name);
		          ajax1(locations[i][0]);
		        }
		       
		       
		      })(marker, i));
		      if(marker)
		      {
		        marker.addListener('click', function() {
		          map.setZoom(10);
		          map.setCenter(this.getPosition());
		        });
		        }
		    }
});
	
	function selStore(){
		var a = $(".selStore").val().split(",");
		ajax2(a[0]);
	}
</script>
<style>

div.storlist{
	width: 1200px;
	position: relative;
	
}

#storeMap1 {
	width:80%; 
	height:400px; 
	clear:both;
	margin-left: 5%;
}

div.infostore{
	position:relative;
	font-size: 22pt;
	left: 4%;
	
}
</style>
</head>
<body>
	<div>
		<select class="selStore" onchange="selStore()">
			<c:forEach var="dto" items="${list }">
				<option value="${dto.idx},${dto.name},${dto.xpoint},${dto.ypoint},${dto.addr},${dto.phone}" class="subselStore">${dto.name }</option>
			</c:forEach>
		</select>
	<form action="">
		<input type="text" size="10">
		<input type="hidden" value="${totalCount}" id="total">
		<input type="submit" value="검색">
	</form>
	</div>
	<div id="storeMap1"></div><br>
	<div class="storlist"></div>
</body>
</html>