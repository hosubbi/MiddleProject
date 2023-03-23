<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<style>
#myform fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#myform fieldset legend {
	text-align: right;
}

#myform input[type=radio] {
	display: none;
}

#myform label {
	font-size: 3em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#myform label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#reviewContents {
	width: 100%;
	height: 150px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 1.5px #D3D3D3;
	border-radius: 5px;
	font-size: 16px;
	resize: none;
}
</style>

<div class="section">
	<div class="container">
		<div class="row justify-content-between">
			<div class="col-lg-7">
				<div class="img-property-slide-wrap">
					<div class="img-property-slide">
						<c:forEach var="img" items="${img }">
							<img src="imgupload/${img.cafeimgRoute }" alt="Image"
								class="img-fluid">
						</c:forEach>
					</div>
				</div>
				<div class="d-block agent-box p-5">
					<div class="modal-content" id="mapinfo"
						style="width: 100%; height: 500px;"></div>
				</div>
			</div>
			<div class="col-lg-4">
				<h2 class="heading text-primary">${cafe.cafeName }</h2>
				
				<p class="meta">조회수 ${cafe.cafeCount }</p>
				<p class="meta">TEL. ${cafe.cafeTel }</p>
				<p class="meta">${cafe.cafeHomepage }</p>
				<p class="meta" id="address">${cafe.cafeAddress }</p>
				<p class="text-black-50">소개글 소개글 소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글
					소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글 소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글
					소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글
					소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글
					소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글
					소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글
					소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글
					소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글소개글</p>



				<div class="d-block agent-box p-5">
					평점 ${Math.round(cafe.avg*10)/10.0 } <span
						class="d-block d-flex align-items-center"> <c:forEach
							begin="1" end="${Math.round(cafe.avg*10)/10.0 }">
													★
								</c:forEach> <c:if test="${Math.round(cafe.avg*10)/10.0%1 > 0 }">
													✬
								</c:if> <c:forEach begin="1" end="${5-Math.round(cafe.avg*10)/10.0/1 }">
													☆
								</c:forEach>

					</span>

					<form class="mb-3" name="myform" id="myform" method="post" action ="ratingsModify.do" >
						<fieldset>
							<!-- <span class="text-bold">별점을 선택해주세요</span> -->
							<input type="radio" name="reviewStar" value="5" id="rate1">
							<label for="rate1">★</label>
							<input type="radio" name="reviewStar" value="4" id="rate2")>
							<label for="rate2">★</label> 
							<input type="radio" name="reviewStar" value="3" id="rate3">
							<label for="rate3">★</label>
							<input type="radio" name="reviewStar" value="2" id="rate4">
							<label for="rate4">★</label> 
							<input type="radio" name="reviewStar" value="1" id="rate5">
							<label for="rate5">★</label>
							<input name ="cafeNum" type = "hidden" value= "${cafe.cafeNum }">
							<input name ="loginId" type = "hidden" value= "manager">
							
							
						</fieldset>
						
						<a class="btn btn-primary float-end" href="#" id="inputBtn" > <i class="fas fa-edit" id="inputBtn"></i>별점주기</a>
					</form>
				</div>

			</div>
		</div>
	</div>
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a733aaef61d32ce74673c3da316fefe&libraries=services"></script>
<script>

document.getElementById('inputBtn').addEventListener('click', function(e) {
		let myFrm = document.querySelector('#myform');
	    myFrm.append(document.querySelector('input[name="loginId"]'));
	    myFrm.append(document.querySelector('input[name="cafeNum"]'));
	    //myFrm.append(document.querySelector('input[name="reviewStar"]'));
	    document.querySelectorAll('input[name="reviewStar"]').forEach(radio => myFrm.append(radio));
	    console.log(myFrm);
	    myFrm.submit();
	    
});

	var mapContainer = document.getElementById('mapinfo'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};
	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	var add = document.getElementById('address').textContent;
	//주소로 좌표를 검색합니다
	geocoder.addressSearch(add, function(result, status) {

		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {

			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			// 결과값으로 받은 위치를 마커로 표시합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : coords
			});

			// 인포윈도우로 장소에 대한 설명을 표시합니다

			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
		}
	});
	
	
</script>
