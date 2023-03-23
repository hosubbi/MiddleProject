<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body onload="init();">
	<div class="section">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-lg-7">
					<div class="img-property-slide-wrap">
						<div class="img-property-slide">
							<img src="images/${item.itemName }1.jpg" alt="Image" class="img-fluid"> 
							<img src="images/${item.itemName }2.jpg" alt="Image" class="img-fluid"> 
							<img src="images/${item.itemName }3.jpg" alt="Image" class="img-fluid">
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<h2 class="heading text-primary">${item.itemName }</h2>
					<hr style="height: 10px;">
					<h4>
						판매가 :
						<fmt:formatNumber value="${item.itemPrice }" pattern="#,### 원" />
					</h4>
					<hr style="margin: 5px;">
					<p style="margin: 0px;" class="text-black-50">
						⊙등록일
						<fmt:formatDate value="${item.itemJoindate }" pattern="yyyy-MM-dd" />
						| ⊙조회수 ${item.itemCount }
					</p>
					<hr style="margin: 5px;">
					
					<div class="text">
						<h5>${item.itemContent }</h5>
						<hr style="margin-top: 0px;">					
						
						<h6>구매수량</h6>
						
						 <form name="form" method="get">
							 <input type=hidden name="sell_price" value="${item.itemPrice }">
							 <input type=hidden name="maxAmount" value="${item.itemStock }">
							 <input type="text" name="amount" value="0" onchange="change();">
							 <input type="button" value=" + " onclick="add();">
							 <input type="button" value=" - " onclick="minus();"><br>
							 <h6 style="margin-top:10px;">총 상품금액</h6>
							 <input type="text" name="sum" size="13" readonly>
						 </form>
					</div>
					<a onclick="location.href='toyInfo.do?itemNum=${topList.itemNum}'"
						class="btn btn-primary py-2 px-3"
						style="background: rgb(226, 175, 255);">바로구매</a> <a
						onclick="location.href='toyInfo.do?itemNum=${topList.itemNum}'"
						class="btn btn-primary py-2 px-3"
						style="background: rgba(255, 163, 202, 0.897);">장바구니</a>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
    // 변경된 값을 저장
  var sell_price;
  var amount;
  var maxAmount


  // init 초기값을 지정할 수 있다.
  function init () {

	
    sell_price = document.form.sell_price.value;
    amount = document.form.amount.value;
    
    document.form.sum.value = sell_price;
    change();
  }


    // add
  // howmany 값을 1 증가 시키고, 합계를 계산.
  function add () {
    hm = document.form.amount;
    sum = document.form.sum;
    let a = parseInt(document.form.maxAmount.value,10);
    
    if(hm.value < a ){
	  	hm.value ++ ;
	  	console.log(hm.value);
	    sum.value = parseInt(hm.value) * sell_price;
    }
    if(hm.value >= a){
    	hm.value = a;
    	sum.value = a * sell_price;
    }
    
    //countmax();
   }
    
 /*  function countmax () {
  	hm = document.form.amount;
  	max = document.form.maxAmount;
  	sum = document.form.sum; 
  	if (hm.value > max.value){
  		hm.value = max.value;
  		sum.value = parseInt(max.value) * sell_price;
  	}
  } */

    // del

    // howmany 값을 1 감소 시키고, 합계를 계산.

    function minus () {

    hm = document.form.amount;

    sum = document.form.sum;

   

	    // 에러 처리 : 음수 값
	
	    if (hm.value > 1) {
	
	      hm.value -- ;
	
	      sum.value = parseInt(hm.value) * sell_price;
	
	    }
    	
    }


    function change () {

    hm = document.form.amount;

    sum = document.form.sum;

    let a = parseInt(document.form.maxAmount.value,10)
	
	    if (hm.value < 0) {
	
	      hm.value = 0;
	
	    }

    sum.value = parseInt(hm.value) * sell_price;
    
	    if(hm.value >= a){
	    	hm.value = a;
	    	sum.value = a * sell_price;
	    }
    }
    




</script>