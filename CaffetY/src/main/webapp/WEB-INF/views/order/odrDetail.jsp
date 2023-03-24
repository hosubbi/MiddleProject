<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세페이지</title>
<style>
#addrUl{
list-style-type: none;
padding:0;
}
</style>
</head>
<body>
	
	<div class="section">
		<div class="container">
			<div class="row">
				
				<div class="col-lg-8" data-aos="fade-up" data-aos-delay="200">
				  <h4>주문상세입력</h4>
					<form action="odrDetail.do" method="post">
						<div class="row">
							<div class="col-6 mb-3">
								<label for ="name">주문자 명 </label>
								<input type="text" class="form-control" name="name" placeholder="주문자 명">
								<label for ="addr">주소 </label>
								<ul id="addrUl">
								<li><input type="text" class="form-control" name="post" placeholder="우편번호"></li>
								<li><input type="text" class="form-control" name="baddr" placeholder="기본주소"></li>
								<li><input type="text" class="form-control" name="daddr" placeholder="상세주소"></li>
								</ul>
							
							</div>
							
							<div>
							<p style = "float:left;"><input type="radio" name="pay" value="cash">&nbsp;무통장입금&nbsp;&nbsp;&nbsp;</p>
							<p style = "float:left;"><input type="radio" name="pay" value="card">&nbsp;신용카드</p>
							</div>
							
							<div class="col-12 mb-3">
								<select class="form-control px-4" name="div" multple>
									<option name="all" disable selected hidden>카드종류 선택</option>
									<option value="국민">국민카드</option>
									<option value="현대">현대카드</option>
									<option value="롯데">롯데카드</option>
									<option value="비씨">비씨카드</option>
									<option value="농협">농협카드</option>
									<option value="신한">신한카드</option>
									<option value="삼성">삼성카드</option>
									<option value="하나">하나카드</option>
								</select>
							</div>	
							
							<div>
								<p style = "float:left;">총 결제금액 <input style = "border:none" type="text" class="form-control" name="tprice" ></p>
								<p style = "float:left;">원</p>
								
							</div>
							<p style = "clear:both"></p>					
							<div class="col-12">
								<input type="submit" value="결제" class="btn btn-primary">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div> 
	
</body>
</html>