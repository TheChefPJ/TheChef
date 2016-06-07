<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="container-fluid">
	<div class="content-wrapper">
		<div class="item-container">
			<div>
				<h3>회사소개</h3>
			</div>
		</div>
		<div class="container-fluid">
			<div class="col-md-12 product-info">
				<ul id="myTab" class="nav nav-tabs nav_tabs">

					<li class="active"><a href="#service-one" data-toggle="tab">The
							Chef</a></li>
					<li><a href="#service-two" data-toggle="tab">찾아오시는길</a></li>
					<!-- <li><a href="#service-three" data-toggle="tab">REVIEWS</a></li> -->

				</ul>
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade in active" id="service-one">
						<section class="container">
						!
						
						</section>
					</div>
					<div class="tab-pane fade" id="service-two">
						<section class="container">
							<script type="text/javascript"
								src="http://openapi.map.naver.com/openapi/v2/maps.js?clientId=s2410QQbc3VMkIIlYom_"></script>
							<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
							<div id="map" style="border: 1px solid #000;">
							<script type="text/javascript">
								$(document).ready(
												function() {
													var oSeoulCityPoint = new nhn.api.map.LatLng(
															37.4020566,
															127.1066640);
													var defaultLevel = 11;
													var oMap = new nhn.api.map.Map(
															document
																	.getElementById('map'),
															{
																point : oSeoulCityPoint,
																zoom : defaultLevel,
																enableWheelZoom : true,
																enableDragPan : true,
																enableDblClickZoom : false,
																mapMode : 0,
																activateTrafficMap : false,
																activateBicycleMap : false,
																minMaxLevel : [
																		1, 14 ],
																size : new nhn.api.map.Size(
																		680,
																		480)
															});
													var oSlider = new nhn.api.map.ZoomControl();
													oMap.addControl(oSlider);
													oSlider.setPosition({
														top : 10,
														left : 10
													});
													/* var oMapTypeBtn = new nhn.api.map.MapTypeBtn();
													oMap.addControl(oMapTypeBtn);
													oMapTypeBtn.setPosition({
													 bottom : 10,
													 right : 80
													}); */
													var oSize = new nhn.api.map.Size(
															28, 37);
													var oOffset = new nhn.api.map.Size(
															14, 37);
													var oIcon = new nhn.api.map.Icon(
															'http://static.naver.com/maps2/icons/pin_spot2.png',
															oSize, oOffset);
													//마커 라벨
													var oLabel = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언.
													oMap.addOverlay(oLabel); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨.
													//마커 아이콘
													var oMarker = new nhn.api.map.Marker(
															oIcon,
															{
																title : 'The Chef'
															});
													oMarker
															.setPoint(oSeoulCityPoint); //마커위치
													oMap.addOverlay(oMarker); // 마커 지도에 추가
													oLabel.setVisible(true,
															oMarker); // 마커 라벨 보여주기
													/*  var trafficButton = new nhn.api.map.TrafficMapBtn(); // - 실시간 교통지도 버튼 선언
													 trafficButton.setPosition({
													 bottom:10, 
													 right:150
													 }); // - 실시간 교통지도 버튼 위치 지정
													 oMap.addControl(trafficButton);
													 var oSize = new nhn.api.map.Size(28, 37);
													 var oOffset = new nhn.api.map.Size(14, 37);
													 var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);
													 var oInfoWnd = new nhn.api.map.InfoWindow();
													 oInfoWnd.setVisible(false);
													 oMap.addOverlay(oInfoWnd);
													 oInfoWnd.setPosition({
													 top : 20,
													 left :20
													 });
													 var oLabel = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언.
													 oMap.addOverlay(oLabel); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨.
													 oInfoWnd.attach('changeVisible', function(oCustomEvent) {
													 if (oCustomEvent.visible) {
													 oLabel.setVisible(false);
													 }
													 });
													
													 var oPolyline = new nhn.api.map.Polyline([], {
													 strokeColor : '#f00', // - 선의 색깔
													 strokeWidth : 5, // - 선의 두께
													 strokeOpacity : 0.5 // - 선의 투명도
													 }); // - polyline 선언, 첫번째 인자는 선이 그려질 점의 위치. 현재는 없음.
													 oMap.addOverlay(oPolyline); // - 지도에 선을 추가함. */

													oMap.attach(
																	'mouseenter',
																	function(
																			oCustomEvent) {
																		var oTarget = oCustomEvent.target;
																		// 마커위에 마우스 올라간거면
																		if (oTarget instanceof nhn.api.map.Marker) {
																			var oMarker = oTarget;
																			oLabel
																					.setVisible(
																							true,
																							oMarker); // - 특정 마커를 지정하여 해당 마커의 title을 보여준다.
																		}
																	});
													oMap.attach(
																	'mouseleave',
																	function(
																			oCustomEvent) {
																		var oTarget = oCustomEvent.target;
																		// 마커위에서 마우스 나간거면
																		if (oTarget instanceof nhn.api.map.Marker) {
																			oLabel
																					.setVisible(false);
																		}
																	});
												});
							</script>
							</div>
							
							<div>
								<h3>The Chef.</h3>
								경기도 성남시 분당구 대왕판교로 670<br>
								지번주소 : 경기도 성남시 분당구 삼평동 682 유스페이스2 B동 8층
								<hr class="colorgraph">
								<img src="resources/img/map.jpg" width="1000px" height="768px">
								<hr class="colorgraph">
							</div>
							
						</section>

					</div>
					<!-- <div class="tab-pane fade" id="service-three"></div> -->
				</div>
				<hr>
			</div>
		</div>
	</div>
</div>
