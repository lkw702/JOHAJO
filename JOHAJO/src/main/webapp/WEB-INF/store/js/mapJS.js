function map2(x,y,storName){
	var myLatlng = new google.maps.LatLng(); // 위치값 위도 경도
	var Y_point = x; // Y 좌표
	var X_point = y; // X 좌표

	var zoomLevel = 18; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
	var markerTitle = storeName; // 현재 위치 마커에 마우스를 오버을때 나타나는 정보
	var markerMaxWidth = 300; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기
	var contentString = storeName

	var myLatlng = new google.maps.LatLng(Y_point, X_point);
	var mapOptions = {
		zoom : zoomLevel,
		center : myLatlng,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	}
	var map = new google.maps.Map(document.getElementById('storeMap1'), mapOptions);
	var marker = new google.maps.Marker({
		position : myLatlng,
		map : map,
		title : markerTitle
	});
	var infowindow = new google.maps.InfoWindow({
		content : contentString,
		maxWizzzdth : markerMaxWidth
	});
	google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map, marker);
	});
};

function ajax1(idx){

	var str="";
	var data=$("div.storlist");
	$.ajax({
		type:'get',
		data:{'idx':idx},
		url:'storeData.do',
		success:function(redata){
				$(redata).find("data").each(function(){
					var s=$(this);
					idx=s.find("idx").text();
					name=s.find("name").text();
					xpoint=s.find("xpoint").text();
					ypoint=s.find("ypoint").text();
					service=s.find("service").text();
					phone=s.find("phone").text();
					addr=s.find("addr").text();
					
					var serviceArray=service.split(',');
					
					str+="<div class='infostore'>";
					str+="<span class='infoNmae'>점포명 : "+name+"</span><br>";
					str+="<span class='infoHP'>연락처 : "+phone+"</span><br>";
					str+="<span class='infoAddr'>주    소 : "+addr+"</span><br>";
					str+="편의시설:";
					for(var i in serviceArray)
					str+="<span class='infoService'><img src='image/"+serviceArray[i]+".PNG' style='width:40px;'>"+serviceArray[i]+"</span>";
					str+="</div>";
				});
			$(data).html(str);
		},
		error:function(){
			alert("error");
		}
		
	});
}

function ajax2(idx){

	var str="";
	var data=$("div.storlist");
	$.ajax({
		type:'get',
		data:{'idx':idx},
		url:'storeData.do',
		success:function(redata){
				$(redata).find("data").each(function(){
					var s=$(this);
					idx=s.find("idx").text();
					name=s.find("name").text();
					xpoint=s.find("xpoint").text();
					ypoint=s.find("ypoint").text();
					service=s.find("service").text();
					phone=s.find("phone").text();
					addr=s.find("addr").text();
					
					var serviceArray=service.split(',');
					
					str+="<div class='infostore'>";
					str+="<span class='infoNmae'>점포명 : "+name+"</span><br>";
					str+="<span class='infoHP'>연락처 : "+phone+"</span><br>";
					str+="<span class='infoAddr'>주    소 : "+addr+"</span><br>";
					str+="편의시설:";
					for(var i in serviceArray)
					str+="<span class='infoService'><img src='image/"+serviceArray[i]+".PNG' style='width:40px;'>"+serviceArray[i]+"</span>";
					str+="</div>";
				});
			$(data).html(str);
			x=xpoint;
			y=ypoint;
			storeName=name;
			map2(x,y,storeName);
		},
		error:function(){
			alert("error");
		}
		
	});
}


