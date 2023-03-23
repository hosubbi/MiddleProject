<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.img-fluid {
	width: 250px;
	height: 250px;

}

.property-item{
	width: 400px;
	height: 400px;
}
</style>
	<div class="section">
		<div class="container">
			<div class="row mb-5 align-items-center">
				<div class="col-lg-6 text-center mx-auto">
					<h2 class="font-weight-bold text-primary heading">조회수 TOP3</h2>
				</div>
				
			</div>
			
			<div class="row">

				<div class="col-12">


					<div class = "section section-properties">

						<div class="container">
							
<%------------------------------페이지------------------------------%>						 
						 <c:forEach var="foodTopList" items="${foodTopList }">
							<div class="property-item">

								<a onclick="location.href='toyInfo.do?itemNum=${foodTopList.itemNum}'" style="cursor: pointer;" class="img">
									<img src="images/${foodTopList.itemName}1.jpg" alt="Image" class="img-fluid">
								</a>

								<div class="property-content">
									<div class="price mb-2"><span style="width:300px; height:65px;">${foodTopList.itemName}</span></div>
									<div>
									<%-- <span class="d-block mb-2 text-black-50"></span> --%>	
										<span class="city d-block mb-3"><fmt:formatNumber value="${foodTopList.itemPrice }" pattern="#,### 원" /></span>

										<div class="specs d-flex mb-4">
											<span class="d-block d-flex align-items-center me-3">
												<span class="icon-bed me-2"></span>
												<span class="caption">조회수 ${foodTopList.itemCount }</span>
											</span>
											<span class="d-block d-flex align-items-center">
												<span class="icon-bath me-2"></span>
												<span class="caption">등록일 <fmt:formatDate value="${foodTopList.itemJoindate }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
											</span>
										</div>

										<a onclick="location.href='toyInfo.do?itemNum=${foodTopList.itemNum}'" style="background:rgb(108, 151, 243);" class="btn btn-primary py-2 px-3">상세보기</a>
										<a onclick="location.href='itemModifyForm.do?itemNum=${foodTopList.itemNum}'" style="background:rgb(146, 188, 243);" class="btn btn-primary py-2 px-3">수정하기</a>
										
									</div>
								</div>
							</div>
						 </c:forEach>
<%------------------------------여기까지------------------------------%>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row mb-5 align-items-center">
				<div class="col-lg-6 text-center mx-auto">
					<h2 class="font-weight-bold text-primary heading">사료 전체</h2>
				</div>			
	</div>
	<div class="section section-properties">
		<div class="container">
			<div class="row">
				
				<%--------시작------%>
				<c:forEach var="foodList" items="${foodList }">
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">	
									
									
									
					<div class="property-item mb-30">

						<a onclick="location.href='toyInfo.do?itemNum=${foodList.itemNum}'" style="cursor: pointer;" class="img">
							<img src="images/${foodList.itemName}1.jpg" alt="Image" class="img-fluid">
						</a>

						<div class="property-content">
							<div class="price mb-2"><span>${foodList.itemName}</span></div>
							<div>
								<span class="city d-block mb-3"><fmt:formatNumber value="${foodList.itemPrice }" pattern="#,### 원" /></span>

								<div class="specs d-flex mb-4">
									<span class="d-block d-flex align-items-center me-3">
										<span class="icon-bed me-2"></span>
										<span class="caption" style="fontsize=20px;">조회수 ${foodList.itemCount }</span>
									</span>
									<span class="d-block d-flex align-items-center">
										<span class="icon-bath me-2"></span>
										<span class="caption">등록일 <fmt:formatDate value="${foodList.itemJoindate }" pattern="yyyy-MM-dd"/></span>
									</span>
								</div>

								<a onclick="location.href='toyInfo.do?itemNum=${foodList.itemNum}'" style="background:rgb(108, 151, 243);" class="btn btn-primary py-2 px-3">상세보기</a>
								<a onclick="location.href='itemModifyForm.do?itemNum=${foodList.itemNum}'" style="background:rgb(146, 188, 243);" class="btn btn-primary py-2 px-3">수정하기</a>
							</div>
						</div>
					</div> <!-- .item -->
				 </div>
				</c:forEach>
				<%--------끝------%>			
			</div>
			<div class="row align-items-center py-5">
				<div class="col-lg-3">
					Pagination (1 of 10)
				</div>
				<div class="col-lg-6 text-center">
					<div class="custom-pagination">
						<a href="#">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
					</div>
				</div>
			</div>
		</div>
	</div>

