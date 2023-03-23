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
	max-width: auto;
	height: 400px;
}

</style>
<div class="section">
	<div class="container">
		<div class="row mb-5 align-items-center">
			<div class="col-lg-6">
				<h2 class="font-weight-bold text-primary heading">Popular
					Properties</h2>
			</div>
			<div class="col-lg-6 text-lg-end">
				<p>
					<a href="#" target="_blank"
						class="btn btn-primary text-white py-3 px-4">View all
						properties</a>
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="property-slider-wrap">
					<div class="property-slider">
						<c:forEach var="list" items="${list }">
							<div class="property-item">
								<a href="cafeInfo.do?cafeNum=${list.cafeNum}" class="img"> <img
									src="imgupload/${list.cafeimgRoute }" alt="Image"
									class="img-fluid" style="width: 100000px;"></a>
								<div class="property-content">
									<div class="price mb-2">
										<span>${list.cafeName }</span>
									</div>
									<div>
										<span class="d-block mb-2 text-black-50">${list.cafeAddress }</span>
										<span class="city d-block mb-3">0${list.cafeTel }</span>
										<div class="specs d-flex mb-4">
											<span class="d-block d-flex align-items-center me-3">
												<span class="caption">${Math.round(list.avg*10)/10.0 }</span>
											</span> <span class="d-block d-flex align-items-center"> 
												<c:forEach begin="1" end="${Math.round(list.avg*10)/10.0 }">
													<span class="icon-star text-warning"></span>
												</c:forEach> <c:if test="${Math.round(list.avg*10)/10.0%1 > 0 }">
													<span class="icon-star-half text-warning"></span>
												</c:if>
												 <c:forEach begin="1" end="${5-Math.round(list.avg*10)/10.0/1 }">
													<span class="icon-star-o text-warning"></span>
												</c:forEach>

											</span>
										</div>
										<a href="property-single.html"
											class="btn btn-primary py-2 px-3">See details</a>
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
	</div>
</div>

<section class="features-1">
	<div class="container">
		<div class="row">
			<div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="300">
				<div class="box-feature">
					<span class="flaticon-house"></span>
					<h3 class="mb-3">Our Properties</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Voluptates, accusamus.</p>
					<p>
						<a href="#" class="learn-more">Learn More</a>
					</p>
				</div>
			</div>
			<div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="500">
				<div class="box-feature">
					<span class="flaticon-building"></span>
					<h3 class="mb-3">Property for Sale</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Voluptates, accusamus.</p>
					<p>
						<a href="#" class="learn-more">Learn More</a>
					</p>
				</div>
			</div>
			<div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="400">
				<div class="box-feature">
					<span class="flaticon-house-3"></span>
					<h3 class="mb-3">Real Estate Agent</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Voluptates, accusamus.</p>
					<p>
						<a href="#" class="learn-more">Learn More</a>
					</p>
				</div>
			</div>
			<div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="600">
				<div class="box-feature">
					<span class="flaticon-house-1"></span>
					<h3 class="mb-3">House for Sale</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Voluptates, accusamus.</p>
					<p>
						<a href="#" class="learn-more">Learn More</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</section>



<div class="section sec-testimonials">
	<div class="container">
		<div class="row mb-5 align-items-center">
			<div class="col-md-6">
				<h2 class="font-weight-bold heading text-primary mb-4 mb-md-0">Customer
					Says</h2>
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
				<c:forEach var="itemList" items="${itemList }">
					<a href="toyInfo.do?itemNum=${itemList.itemNum}">

						<div class="item">
							<div class="testimonial">
								<img src="images/${itemList.itemName }1.jpg" alt="Image"
									class="img-fluid rounded-circle w-25 mb-4"
									style="width:auto; height: 150px; ">
								<div class="rate">
									<span class="icon-star-half text-warning"></span> 
									<span class="icon-star text-warning"></span> <span
										class="icon-star text-warning"></span> <span
										class="icon-star text-warning"></span> <span
										class="icon-star text-warning"></span>
								</div>
								<h3 class="h5 text-primary mb-4">${itemList.itemName }</h3>
								<blockquote>
									<p>&ldquo;${itemList.itemContent }&rdquo;</p>
								</blockquote>
								<p class="text-black-50">Designer, Co-founder</p>
							</div>
						</div>
					</a>
				</c:forEach>

			</div>
		</div>
	</div>
</div>



