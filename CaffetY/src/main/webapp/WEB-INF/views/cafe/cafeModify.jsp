<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <style>
    .row{
    	text-align:center;
    }
    .col-6 mb-3{
    ````text-align:center;
    }
    .textareainfo{
    	width : 100%
    }
    
    
    
.wrap{

    max-width: 480px;

    margin: 0 auto; /* 화면 가운데로 */

    background-color: #fff;

    height: 100%;

    padding: 20px;

    box-sizing: border-box;



}

.reviewform textarea{

    width: 100%;

    padding: 10px;

    box-sizing: border-box;

}

.rating .rate_radio {

    position: relative;

    display: inline-block;

    z-index: 20;

    opacity: 0.001;

    width: 60px;

    height: 60px;

    background-color: #fff;

    cursor: pointer;

    vertical-align: top;

    display: none;

}

.rating .rate_radio + label {

    position: relative;

    display: inline-block;

    margin-left: -4px;

    z-index: 10;

    width: 60px;

    height: 60px;

    background-image: url('./img/starrate.png');

    background-repeat: no-repeat;

    background-size: 60px 60px;

    cursor: pointer;

    background-color: #f0f0f0;

}

.rating .rate_radio:checked + label {

    background-color: #ff8;

}

.cmd{

    margin-top: 20px;

    text-align: right;

}

.cmd input[type="button"]{

    padding: 10px 20px;

    border: 1px solid #e8e8e8;

    background-color: #fff;

    background-color:#000;  

    color: #fff;

}



.warning_msg {

    display: none;

    position: relative;

    text-align: center;

    background: #ffffff;

    line-height: 26px;

    width: 100%;

    color: red;

    padding: 10px;

    box-sizing: border-box;

    border: 1px solid #e0e0e0;

}
    </style>
    
    

<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 mb-5 mb-lg-0" data-aos="fade-up" data-aos-delay="100">
					<div class="contact-info">


					</div>
				</div>
				<div class="col-lg-8" data-aos="fade-up" data-aos-delay="200">
				
				
					
					<form action="cafeModify.do" enctype="multipart/form-data" >
						<div class="row" >
						<h3><bold>카페 수정</bold></h3>
						   <!--  --> <input type="hidden" class="form-control" placeholder="Cafe name" id = "cafeNum"name="cafeNum" value="${cafe.cafeNum }" >
						
							<div class="col-6 mb-3">
								<input type="text" class="form-control" placeholder="Cafe name" id = "cafeName"name="cafeName" value="${cafe.cafeName }">
							</div>
							<div class="col-6 mb-3">
								<input type="text" class="form-control" placeholder="Cafe Tel" id="cafeTel" name="cafeTel" value="${cafe.cafeTel }">
							</div>
						<div class="col-6 mb-3">
							<select class="form-control"   id="location" name="location" value="${cafe.location }">
								<option value="null">선택</option>
								<option value="남구">남구</option>
								<option value="중구">중구</option>
								<option value="수성구">수성구</option>
								<option value="서구">서구</option>
								<option value="동구">동구</option>
								<option value="북구">북구</option>
								<option value="달서구">달서구</option>
								<option value="달서군">달서군</option>
							</select>
						</div>
						

						
						<div class="col-12 mb-3">
								<input type="text" class="form-control" placeholder="주소" id="cafeAddress" name="cafeAddress" value = "${cafe.cafeAddress }">
							</div>
							<div class="col-12 mb-3">
								<input type="text" class="form-control" placeholder="홈페이지" id="cafeHomepage" name="cafeHomepage" value= "${cafe.cafeHomepage }">
							</div>
							<div class="col-12 mb-3">
								<textarea id="cafeWriting" name="cafeWriting"  cols="111" rows="10" class="textareainfo">${cafe.cafeWriting }</textarea>
							</div>
							<div class="col-12 mb-3">
								<input type="file" class="form-control" placeholder="추가사진" id= "mainImg" name="mainImg">
							</div>
							<div class="col-12 mb-3">
								<input type="file" class="form-control" placeholder="추가사진" id="subImg1" name="subImg1">
							</div>
							<div class="col-12 mb-3">
								<input type="file" class="form-control" placeholder="추가사진" id="subImg2" name="subImg2">
							</div>

							<div class="col-12">
								<input type="submit" id = "submit"value="수정" class="btn btn-primary" >
								<input type="submit" value="삭제" class="btn btn-primary" >
								
							</div>
						</div>
					</form>
					
					
					
					
				</div>
			</div>
		</div>
	</div> <!-- /.untree_co-section -->


<script>
document.querySelector('#submit').addEventListener('click', function() {
    let myFrm = document.querySelector('#myFrm');
    
    let iName = document.querySelector('input[name="name"]').value;
    let iPrice = document.querySelector('input[name="price"]').value;
    let iDiv = document.querySelector('input[name="div"]').value;
    let iStock = document.querySelector('input[name="stock"]').value;
    let iContent = document.querySelector('textarea[name="content"]').textContent;
    
    myFrm.action = 'itemModify.do'; 
    
    myFrm.append(document.querySelector('input[name="name"]'));
    myFrm.append(document.querySelector('input[name="price"]'));
    myFrm.append(document.querySelector('input[name="div"]'));
    myFrm.append(document.querySelector('input[name="stock"]'));
    myFrm.append(document.querySelector('textarea[name="content"]'));
     
    myFrm.submit();
	 });
</script>

