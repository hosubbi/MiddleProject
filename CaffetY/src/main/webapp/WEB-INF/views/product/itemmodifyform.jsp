<%@page import="co.caffet.vo.ItemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
  ItemVO vo = (ItemVO) request.getAttribute("item");
%>

  	<div class="section">
		<div class="container">
		
				<div class="row">
				<form id="myFrm" action="itemModify.do" method="post">
				
				  <h4>상품수정</h4>					
						<div class="row">
							<div class="col-6 mb-3">
								<input type="hidden" name="num" value="${item.itemNum }">
								<h6>●상품명 수정●</h6>
								<input type="text" class="form-control" name="name" value="${item.itemName }">
							</div>
							<div class="col-6 mb-3">
								<h6>●상품가격 수정●</h6>
								<input type="number" name="price" class="form-control" value="${item.itemPrice }">
							</div>
							<h6>●상품종류 수정●</h6>
							<div class="col-12 mb-3">
								<select class="form-control px-4" name="div" multple>
									<option name="all" disable selected hidden> 상품종류 선택</option>
									<option value="장난감">장난감</option>
									<option value="사료">사료</option>
									<option value="기타">기타 제품</option>
								</select>
							</div>
							<div class="col-12 mb-3">
													
									<h6>●재고량 수정● 현재 재고량 : ${item.itemStock } (최대9999) </h6><input type=number name="stock" value="${item.itemStock }" min="1" max="9999">
									<input type=button value="+" onClick="javascript:if((this.form.stock.value)<9999){this.form.stock.value++} ;">
									<input type=button value="-" onClick="javascript:if((this.form.stock.value)>1){this.form.stock.value--} ;">								
							
							</div>
							<h6>●상품내용 수정●</h6>
							<div class="col-12 mb-3">
								<textarea name="content" id="" cols="30" rows="7" class="form-control"></textarea>
							</div>
							<h6>●첨부파일 수정●</h6>
							<div class="col-12 mb-3">
								<input type="file" class="form-control" placeholder="메인사진" id= "mainImg" name="mainImg">
							</div>
							<div class="col-12 mb-3">
								<input type="file" class="form-control" placeholder="서브사진" id="subImg1" name="subImg1">
							</div>
							<div class="col-12 mb-3">
								<input type="file" class="form-control" placeholder="서브사진" id="subImg2" name="subImg2">
							</div>
							<div class="col-12">
								<button class="btn btn-primary float-end" id="modBtn" style="background:rgb(99, 176, 248);">수정하기</button>
								<button class="btn btn-primary float-end" id="delBtn" style="background:rgb(243, 105, 105);">삭제하기</button>
							</div>
						</div>
					</form>
				</div>
		</div>
	</div> <!-- /.untree_co-section -->

<form id="myFrm" action="itemModify.do">

</form>
<script>
	//수정
	document.querySelector('#modBtn').addEventListener('click', function() {
	    let myFrm = document.querySelector('#myFrm');
	    
	    let iName = document.querySelector('input[name="name"]').value;
	    let iPrice = document.querySelector('input[name="price"]').value;
	    let iDiv = document.querySelector('input[name="div"]').value;
	    let iStock = document.querySelector('input[name="stock"]').value;
	    let iContent = document.querySelector('textarea[name="content"]').textContent;
	    
	    myFrm.append(document.querySelector('input[name="name"]'));
	    myFrm.append(document.querySelector('input[name="price"]'));
	    myFrm.append(document.querySelector('input[name="div"]'));
	    myFrm.append(document.querySelector('input[name="stock"]'));
	    myFrm.append(document.querySelector('textarea[name="content"]'));
	     
	    myFrm.submit();
 	 });

	//삭제
	document.querySelector('#delBtn').addEventListener('click', function() {

	    let myFrm = document.querySelector('#myFrm');
	    // FrontController에 NoticeRemoveControl();
	    myFrm.action = 'itemDelete.do'; 
	    myFrm.append(document.querySelector('input[name="num"]'));
	    myFrm.submit();
  	})

</script>