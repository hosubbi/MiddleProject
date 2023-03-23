<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<div class="site-mobile-menu site-navbar-target">
	<div class="site-mobile-menu-header">
		<div class="site-mobile-menu-close">
			<span class="icofont-close js-menu-toggle"></span>
		</div>
	</div>
	<div class="site-mobile-menu-body"></div>
</div>

<nav class="site-nav">
	<div class="container">
		<div class="menu-bg-wrap">
			<div class="site-navigation">
				<a href="main.do" class="logo m-0 float-start">1조 No.1 Caffet</a>

				<ul
					class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
					<li class="active"><a href="main.do">Home</a></li>
					<li class="has-children">
						<a>게시판</a>
						<ul class="dropdown">
								<li><a href="boardPlayList.do">놀이터</a></li>
								<li><a href="boardQnAList.do">QnA</a></li>
							</ul>
						<li class="has-children">
					<li class="has-children"><a href="properties.html">펫 용품</a>
						<ul class="dropdown">
							<li><a href="toy.do">장난감</a></li>
							<li><a href="#">사료</a></li>
							<li><a href="#">기타..</a></li>
							<li><a href="toyInsertForm.do">상품등록</a></li>
							
							<c:choose>
								<c:when test="${my.memberAuther == 'admin' }">
									<li><a href="#">상품등록</a></li>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>

						</ul></li>
					<li><a href="cafeListForm.do">펫카페정보</a></li>
					<li class="has-children"><a href="properties.html">Menu</a>
						<ul class="dropdown">

							<c:if test="${my.memberId == null }">
								<li><a
									onclick="document.getElementById('id01').style.display='block'"
									style="width: auto;">로그인</a></li>
								<li><a
									onclick="document.getElementById('id02').style.display='block'"
									style="width: auto;">회원가입</a></li>

							</c:if>

							<c:if test="${my.memberId != null }">

								<li><a href="logout.do">로그아웃</a></li>
								<li class="has-children"><a>마이페이지</a>
								
								<c:choose>
									<c:when test="${my.memberAuther == 'user' }">
										<ul class="dropdown">
											<li><a href="modifyMemberForm.do">개인정보수정</a></li>
											<li><a href="orderList.do">주문조회</a></li>
											<li><a href="reserveList.do">예약조회</a></li>
											<li><a href="deleteMember.do">회원탈퇴</a></li>
										</ul>
									</c:when>
									<c:otherwise>
										<ul class="dropdown">
											<li><a href="modifyMemberForm.do">개인정보수정</a></li>
											<li><a href="orderList.do">주문조회</a></li>
											<li><a href="reserveList.do">예약조회</a></li>
											<li><a href="deleteMember.do">회원탈퇴</a></li>
											<li><a href="contact.html">카페 등록&수정</a></li>
										</ul>

									</c:otherwise>
								</c:choose>
								</li>
							</c:if>

						</ul></li>

				</ul>

				<a href="#"
					class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none"
					data-toggle="collapse" data-target="#main-navbar"> <span></span>
				</a>

			</div>
		</div>
	</div>
</nav>

<!-- <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button> -->

<div id="id01" class="modal">

	<form class="modal-content animate" action="login.do" method="post">
		<div class="imgcontainer">
			<span onclick="document.getElementById('id01').style.display='none'"
				class="close" title="Close Modal">&times;</span> <img
				src="images/hero_bg_1.jpg" alt="Avatar" class="avatar">
		</div>

		<div class="container">
			<label for="uname"><b>아이디</b></label> <input type="text"
				placeholder="Enter UserID" name="uid" required> <label
				for="psw"><b>비밀번호</b></label> <input type="password"
				placeholder="Enter Password" name="upw" required>

			<button type="submit">로그인</button>

		</div>

		<div class="container" style="background-color: #f1f1f1">
			<button type="button"
				onclick="document.getElementById('id01').style.display='none'"
				class="cancelbtn">취소</button>
			<span class="psw">Forgot <a href="#">password?</a></span>
		</div>
	</form>
</div>

<div id="id02" class="modal">
	<form class="modal-content" action="memberAdd.do" method="post">
		<div class="container">
			<h1>회원가입</h1>
			<hr>
			<label for="name"><b>이름</b></label> <input type="text"
				placeholder="Enter UserName" name="uname" required> <label
				for="uname"><b>아이디</b></label> <input type="text"
				placeholder="Enter UserID" name="uid" id="uid" required> <label
				for="psw"><b>비밀번호</b></label> <input type="password"
				placeholder="Enter Password" name="psw" id="psw" required> <label
				for="psw-repeat"><b>비밀번호 확인</b></label> <input type="password"
				placeholder="Repeat Password" name="psw-repeat" id="pswr" required>

			<!-- <label for="name"><b>생년월일</b></label> -->
			<!-- <input type="date" placeholder="Enter UserName" name="uname" required> -->


			생년월일 <br> <select name="birth1" id="birth1" required>
				<option value="" disabled selected hidden>년</option>
				<c:forEach begin="1930" end="2023" var="i" step="1">
					<option value="${i }">${i }</option>
				</c:forEach>
			</select>&nbsp; <input type="hidden" name="birth22"> <select
				name="birth2" required>
				<option value="" disabled selected hidden>월</option>
				<c:forEach begin="1" end="12" var="i" step="1">
					<option value="${i }">${i }</option>
				</c:forEach>
			</select> <input type="hidden" name="birth33"> <select name="birth3"
				required>
				<option value="" disabled selected hidden>일</option>
				<c:forEach begin="1" end="31" var="i" step="1">
					<option value="${i }">${i }</option>
				</c:forEach>
			</select> <br>
			<div class="joinradio">
				<input type="radio" name="user_sex" value="m">남<input
					type="radio" name="user_sex" value="f" checked="checked">여
			</div>

			<label for="email"><b>이메일</b></label> <input type="text"
				placeholder="Enter Email" name="email" required> <label
				for="address"><b>주소</b></label> <input type="text"
				placeholder="Enter Address" name="address" required> <label
				for="tel"><b>전화번호</b></label> <input type="text"
				placeholder="숫자만 입력하세요(01011112222)" name="tel" required>

			<div class="joinradio">
				<input type="radio" name="user_auther" value="user">사용자 <input
					type="radio" name="user_auther" value="busi" checked="checked">사업자
			</div>
			<div class="clearfix">
				<button id="insert" type="submit" class="signupbtn">가입</button>
				<button type="button"
					onclick="document.getElementById('id02').style.display='none'"
					class="cancelbtn">취소</button>
			</div>
		</div>
	</form>
</div>

<%
String idd = (String) request.getAttribute("id");
%>

<script>
	document.getElementById('insert').addEventListener('click', function() {

		let pw = document.querySelector('input[id="psw"]').value;
		let pwc = document.querySelector('input[id="pswr"]').value;
		if (pw != pwc) {
			alert("비밀번호가 다릅니다. 다시 입력해주세요.")
			document.getElementById('psw').value = '';
			document.getElementById('pswr').value = '';
		} else {

			let uid = document.querySelector('input[id="uid"]').value;
			alert(uid + "님 환영합니다!")
		}

	});
</script>




































