<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    .row{
    	text-align:center;
    }
    .col-6 mb-3{
    	text-align:center;
    }
    .textareainfo{
    	width : 100%
    }
    </style>
<!-- 게시글 등록작성화면 -->
<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 mb-5 mb-lg-0" data-aos="fade-up" data-aos-delay="100">
					<div class="contact-info">
								

					</div>
				</div>
				<div class="col-lg-8" data-aos="fade-up" data-aos-delay="200">
					
					<form action="boardPlayAddForm.do" enctype ="multipart/form-data">
						<div class="row" >
						<h2><bold>글쓰기</bold></h2>
							<div class="col-6 mb-3">
								<input id="memberId" name = "memberId"  type="text" class="form-control" placeholder="작성자" >
							</div>
							<div class="col-6 mb-3">
								<input name="boardDiv" type="text" class="form-control"   value="${info }" >
							</div>
							<div class="col-12 mb-3">
								<input name= "boardTitle" type="text" class="form-control" placeholder="제목"  >
							</div>
							<div class="col-12 mb-3">
								<textarea name="boardContent" cols="111" rows="10" class="textareainfo" placeholder="내용" ></textarea>
							</div>

							<div class="col-12">
								<button id="addBtn" class = "btn btn-primary">등록</button>
							</div>
						</div>
					</form>
				
				</div>
			</div>
		</div>
	</div> <!-- /.untree_co-section -->


<script>

</script>

