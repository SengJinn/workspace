<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- mungPlaceIndex.jsp -->
<%@ include file="common/header.jsp" %>
<hr/>
<h1>TEST</h1>
<body>
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63c1486007c82b2a0e837b0f9be50e9e"></script>
</body>
<hr/>
<%@ include file="common/tail.jsp" %>

 --%>
 
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Map Test</title>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63c1486007c82b2a0e837b0f9be50e9e"></script>
    <style>
        #map {width: 500px; height: 400px;}
        #menu {margin-bottom: 10px;}
    </style>
</head>
<body>
    <h1>TEST</h1>
    <div id="menu">
        <select id="placeType" onchange="searchPlaces()">
        	<option value="전체">전체</option>
            <option value="애견카페">애견카페</option>
            <option value="동물병원">동물병원</option>
            <option value="애견동반음식점">애견동반음식점</option>
        </select>
    </div>
    <div id="map"></div>
    
    <script>
        var mapContainer = document.getElementById('map'),
            mapOption = {
                center: new kakao.maps.LatLng(35.1796, 129.0756), // 초기 지도 중심 좌표 (부산)
                level: 1 // 초기 지도 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption);

        var ps = new kakao.maps.services.Places(); 

        function searchPlaces() {
            var placeType = document.getElementById('placeType').value;
            if (placeType === '전체') {
                searchAllPlaces();
            } else {
                ps.keywordSearch(placeType, placesSearchCB);
            }
        }

        function searchAllPlaces() {
            var placeTypes = ['애견카페', '동물병원', '애견동반음식점'];
            var bounds = new kakao.maps.LatLngBounds();
            placeTypes.forEach(function(type) {
                ps.keywordSearch(type, function(data, status, pagination) {
                    if (status === kakao.maps.services.Status.OK) {
                        for (var i = 0; i < data.length; i++) {
                            displayMarker(data[i]);
                            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                        }
                        map.setBounds(bounds);
                    }
                });
            });
        }

        function placesSearchCB(data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {
                var bounds = new kakao.maps.LatLngBounds();
                for (var i = 0; i < data.length; i++) {
                    displayMarker(data[i]);
                    bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                }       
                map.setBounds(bounds);
            } 
        }

        function displayMarker(place) {
            var marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(place.y, place.x) 
            });

            kakao.maps.event.addListener(marker, 'click', function() {
                var infowindow = new kakao.maps.InfoWindow({zIndex:1});
                infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
                infowindow.open(map, marker);
            });
        }

        // 초기 지도에 기본 장소 표시
        searchPlaces();
    </script>
</body>
</html>