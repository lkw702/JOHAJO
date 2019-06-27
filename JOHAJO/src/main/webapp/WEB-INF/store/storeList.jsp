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
<!-- google map API -->
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyCzHxv7okfaTei_0eZFMzhSw6cnN-dITSg" ></script>
<style>
#map_ma {width:500px; height:400px; clear:both; border:solid 1px red;}
</style>
</head>
<body>
이름 : ${dto.name }
x : ${dto.xpoint }
y : ${dto.ypoint }
<script type="text/javascript">
//var kmaUrl="아파트매매_상세자료.xml";
   $(document).ready(function() {
         var myLatlng = new google.maps.LatLng(); // 위치값 위도 경도
   var Y_point         = ${dto.xpoint};      // Y 좌표
   var X_point         = ${dto.ypoint};      // X 좌표
   
      
   var zoomLevel      = 18;            // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
   var markerTitle      ="${dto.name}";      // 현재 위치 마커에 마우스를 오버을때 나타나는 정보
   var markerMaxWidth   = 300;            // 마커를 클릭했을때 나타나는 말풍선의 최대 크기

// 말풍선 내용
   var contentString   = '<div>' +
   '<h2>${dto.name}</h2>'+
   '</div>';
   var myLatlng = new google.maps.LatLng(Y_point, X_point);
   var mapOptions = {
                  zoom: zoomLevel,
                  center: myLatlng,
                  mapTypeId: google.maps.MapTypeId.ROADMAP
               }
   var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions);
   var marker = new google.maps.Marker({
                                 position: myLatlng,
                                 map: map,
                                 title: markerTitle
   });
   var infowindow = new google.maps.InfoWindow(
                                    {
                                       content: contentString,
                                       maxWizzzdth: markerMaxWidth
                                    }
         );
   google.maps.event.addListener(marker, 'click', function() {
      infowindow.open(map, marker);
   });
});
      </script>
      
      <div id="map_ma"></div>

</body>
</html>
