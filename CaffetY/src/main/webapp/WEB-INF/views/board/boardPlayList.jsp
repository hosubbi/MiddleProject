<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!--board/boardPlayList.jsp 놀이터 게시판 목록조회페이지 -->
<!-- 전체게시글list화면 -->
<style>
.mt-4 { 
		text-align : center;
		color: green;	
	}

.center {
  text-align: center;
}

.pagination {
  display: inline-block;
}
.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
  margin: 0 4px;
}
.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}
.pagination a:hover:not(.active) {background-color: #ddd;}
</style>


<div class="section bg-light">
	<div class="container">
		<div class="row">
		<h1 class="mt-4"id="div">놀이터</h1>
			
		<a class="btn btn-primary float-end" href="boardPlayAdd.do"> 
		<!-- <i class="fas fa-table me-1"></i> -->
					<i class="fas fa-edit"></i> 글쓰기</a>
			<hr></<hr>
			
			<c:forEach var="list" items="${list }">

				<div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="300" >
				<!--  <a href="boardPlaySearchForm.do?boardNum=${list.boardNum }" class="learn-more">-->
					<div class="box-feature mb-4">
						
						<!-- 게시글이미지-->
						<span class="flaticon-house mb-4 d-block"src="img/${list.boardimgName}"></span>
						<!-- 게시글제목-->
						<h2 class="text-black mb-3 font-weight-bold">
							<a href="boardPlaySearchForm.do?boardNum=${list.boardNum }" class="learn-more">${list.boardTitle }</a>
						</h2>
						<!-- 게시글작성자-->
						<h5 class="text-black mb-3 font-weight-bold">${list.memberId }</h5>
						<!-- 게시글댓글-->
						<h5 class="text-black mb-3 font-weight-bold">댓글 ${cvo.commentNum }</h5>
						<!-- 게시글번호-->
						<p class="text-black-50">글번호 ${list.boardNum }</p>
						<!-- 게시글조회-->
						<p class="text-black-50">조회수 ${list.boardCount }</p>
						<!-- 게시글등록일-->
						<p class="text-black-50">등록일 <fmt:formatDate value="${list.boardJoindate }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
					
					</div>
					<!-- </a> -->
				</div>

			</c:forEach>
			
			<!-- 페이징처리 -->
			<div class="center">
				<div class="pagination">
					<c:if test="${page.prev }">
						<a href="boardPlayList.do?page=${page.startPage - 1 }"> &laquo; </a>
					</c:if>
					<c:forEach begin="${page.startPage }" end="${page.endPage }"
						var="i">
						<c:choose>
							<c:when test="${i == page.page }">
								<a class="active" href="boardPlayList.do?page=${i }"> ${i } </a> <!--현재 페이지 -->
							</c:when>
							<c:otherwise>
								<a href="boardPlayList.do?page=${i }"> ${i } </a> <!--나머지 여러페이지 -->
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${page.next }">
						<a href="boardPlayList.do?page=${page.endPage + 1 }"> &raquo; </a> <!--마지막 페이지 -->
					</c:if>
				</div>
			</div>
			<!-- 페이징처리끝 -->
		</div>
	</div>
</div>



