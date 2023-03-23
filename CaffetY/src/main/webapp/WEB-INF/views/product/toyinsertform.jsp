<%@page import="co.caffet.vo.ItemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="section">
		<div class="container">
			<div class="row">
				
				<div class="col-lg-8" data-aos="fade-up" data-aos-delay="200">
				  <h4>상품등록</h4>
					<form action="itemInsert.do" method="post">
						<div class="row">
							<div class="col-6 mb-3">
								<input type="text" class="form-control" name="name" placeholder="상품명">
							</div>
							<div class="col-6 mb-3">
								<input type="number" name="price" class="form-control" placeholder="상품가격(숫자만입력)">
							</div>
							<div class="col-12 mb-3">
								<select class="form-control px-4" name="div" multple>
									<option name="all" disable selected hidden>상품종류 선택</option>
									<option value="장난감">장난감</option>
									<option value="사료">사료</option>
									<option value="그외">그 외 제품</option>
								</select>
							</div>
							<div class="col-12 mb-3">
							<form>							
									<h6>재고량 (최대9999) </h6><input type=number name="stock" value=1 min="1" max="9999">
									<input type=button value="+" onClick="javascript:if((this.form.stock.value)<9999){this.form.stock.value++} ;">
									<input type=button value="-" onClick="javascript:if((this.form.stock.value)>1){this.form.stock.value--} ;">								
							</form>
							</div>
							<div class="col-12 mb-3">
								<textarea name="content" id="" cols="30" rows="7" class="form-control" placeholder="상품 내용"></textarea>
							</div>
							첨부파일<input type="file" name="attach">
							<div class="col-12">
								<input type="submit" value="등록" class="btn btn-primary">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div> <!-- /.untree_co-section -->
<script>
	document.querySelector('form').addEventListener('submit', function (e) {
		e.preventDefault(); // 기본 기능 차단.
		<% ItemVO vo = new ItemVO();%>
	    let name = document.querySelector('input[name="name"]').value;
	    let price = document.querySelector('input[name="price"]').value;
	    let stock = document.querySelector('input[name="stock"]').value;
	    let content = document.querySelector('textarea[name="cotent"]').textContent;
	    let div = document.querySelector('input[name="div"]').value;
	    
	    let isOk = true;
	    if (name == '' || name == 'null'){
	      isOk = false;
	    }
	    if (price == '' || price == 'null'){
	      isOk = false;
	    }
	    if (stock == '' || stock == 'null'){
	      isOk = false;
	    }
	    if (content == '' || content == 'null'){
	        isOk = false;
	    }
	    if (div == '' || div == 'null'){
	        isOk = false;
	    }
	    
	    
	    if (!isOk){
	      alert('입력항목을 확인하세요!!');
	      return false;
	    }
	    

	    // 이벤트의 콜백함수에서 this는 이벤트가 발생하는 대상 element.
	    console.log(this);
	    this.submit();

	  })
	    
</script>	
