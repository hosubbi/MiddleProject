<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
button {
	background-color: #04AA6D;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 10%;
}
.img-fluid {
	width: 746px;
	height:450px;
}
</style>
<meta charset="utf-8">

<div class="section">
	<div class="container">
		<div class="row text-left mb-5">
			<div class="col-12">
				<h2 class="font-weight-bold heading text-primary mb-4">펫 카페 정보</h2>
			</div>
		</div>
		
		<c:if test="${my.memberAuther == 'busi' }">	
		<a class="btn btn-primary float-end" href="addCafe.do"> <!-- <i class="fas fa-table me-1"></i> -->
			<i class="fas fa-edit"></i>카페등록
		</a>
		</c:if>
	</div>
</div>

<c:forEach var="list" items="${list }" end="2">

	<div class="section pt-0">
		<div class="container">
			<div class="row justify-content-between mb-5">
				<div class="col-lg-7 mb-5 mb-lg-0 order-lg-2">
					<div class="img-about dots">
						<img src="imgupload/${list.cafeimgRoute }" alt="Image"
							class="img-fluid" style="z-index: 2">
					</div>
				</div>

				<div class="col-lg-4">
					<div class="d-flex feature-h">
						<span class="wrap-icon me-3"
							onclick="location.href='cafeInfo.do?cafeNum=${list.cafeNum}'">
							<span class="icon-home2"></span>
						</span>
						<div class="feature-text">
							<h3 class="heading" id="cafeName">${list.cafeName }</h3>

						</div>
					</div>


					<div class="d-flex feature-h">
						<span class="wrap-icon me-3"> <span class="icon-person"
							onclick="drawMap('${list.cafeNum}')" ></span>
						</span>
						<div id="${list.cafeNum}" class="modal" style="z-index: 3">
							<form class="modal-content animate" action="#" method="post">
								<div class="modal-content" id="mapinfo_${list.cafeNum}"
									style="width: 70%; height: 500px;"></div>

								<div class="container" style="background-color: black;">
									<button type="button"
										onclick="document.getElementById('${list.cafeNum}').style.display='none'"
										class="cancelbtn">취소</button>
								</div>
							</form>
						</div>
						<div class="feature-text">
							<h3 class="heading" id="address_${list.cafeNum}">${list.cafeAddress }</h3>
							<p class="text-black-50">TEL ${list.cafeTel }</p>
						</div>

					</div>


				</div>
				<c:if test="${list.cafeHomepage !=null }">
					<div class="d-flex feature-h">
						<span class="wrap-icon me-3"
							onclick="location.href='http://${list.cafeHomepage}'"> <span
							class="icon-security"></span>
						</span>
						<div class="feature-text" href="${list.cafeHomepage}">
							<h3 class="heading">${list.cafeHomepage}</h3>
						</div>
					</div>
				</c:if>

			</div>
		</div>
	</div>

</c:forEach>


<div class="row">
	<div class="col-12">
		<div class="property-slider-wrap">
			<div class="property-slider">


				<c:forEach var="list" begin="3" items="${list }">
					<div class="property-item">
						<a href='cafeInfo.do?cafeNum=${list.cafeNum}' class="img"> <img
							src="imgupload/${list.cafeimgRoute }" alt="Image"
							class="img-fluid" style = "width: 527px; 	height:450px;"></a>
						<div class="property-content">
							<div class="price mb-2">
								<span>${list.cafeName }</span><br>
								<h7 class="text-black-50">${list.cafeAddress}</h7>
							</div>
						</div>

					</div>
				</c:forEach>

			</div>
			<div id="property-nav" class="controls" tabindex="0"
				aria-label="Carousel Navigation">
				<span class="prev" data-controls="prev" aria-controls="property"
					tabindex="-1">Prev</span> <span class="next" data-controls="next"
					aria-controls="property" tabindex="-1">Next</span>
			</div>
		</div>
	</div>
</div>

<div class="section sec-testimonials bg-light">
	<div class="container">
		<div class="row mb-5 align-items-center">
			<div class="col-md-6">
				<h2 class="font-weight-bold heading text-primary mb-4 mb-md-0">Comments</h2>
			</div>
			<div class="col-md-6 text-md-end">
				<div id="testimonial-nav">
					<span class="prev" data-controls="prev">Prev</span> <span
						class="next" data-controls="next">Next</span>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-4"></div>
		</div>
		<div class="testimonial-slider-wrap">
			<div class="testimonial-slider">
				<!-- 여기서 반복 최신 댓글 10개 -->
				<div class="item">
					<div class="testimonial">
						<img src="images/person_1-min.jpg" alt="Image"
							class="img-fluid rounded-circle w-25 mb-4">
						<h3 class="h5 text-primary">member_id</h3>
						<p class="text-black-50">평점</p>

						<p>comment comment comment comment comment comment comment
							comment comment comment comment comment comment comment comment
							comment comment comment comment comment comment comment comment
							comment comment comment comment comment comment comment comment
							comment comment comment comment comment comment comment comment
							comment comment comment</p>

					</div>
				</div>




			</div>
		</div>
	</div>
</div>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a733aaef61d32ce74673c3da316fefe&libraries=services"></script>
<script>
	function drawMap(mapInfo) {
		console.log(mapInfo)
		var mapContainer = document.getElementById('mapinfo_' + mapInfo), mapOption = {
			center : new kakao.maps.LatLng(128.601445, 35.8714354), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};
		console.log('container: ', mapContainer);

		//지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var addr = document.getElementById('address_' + mapInfo).textContent;

		console.log('addr: ', addr);
		//주소로 좌표를 검색합니다
		geocoder.addressSearch(addr, function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {

				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new kakao.maps.Marker({
					map : map,
					position : coords
				});

				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			}
		});
		document.getElementById(mapInfo).style.display = 'block';
	}
</script>