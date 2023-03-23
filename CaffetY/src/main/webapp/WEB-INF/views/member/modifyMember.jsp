<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>개인정보수정</title>
			</head>

			<body>

				<div id="id03">
					<form class="modal-content" action="modifyMember.do" method="post">
						<div class="container">
							<h1>개인정보수정</h1>
							<hr>
							<label for="name"><b>이름</b></label> 
							<input type="text" name="uname" required value="${my.memberName }">
							<label for="uname"><b>아이디</b></label> 
							<input type="text"  name="uid" id="uidaa" required value="${my.memberId }"readonly>
							<label for="psw"><b>비밀번호</b></label> <input type="password" name="psw" id="psw" required
								value="${my.memberPw }"> <label for="psw-repeat"><b>비밀번호 확인</b></label> <input
								type="password" name="psw-repeat" id="pswr" required value="${pw }">

							<!-- <label for="name"><b>생년월일</b></label> -->
							<!-- <input type="date" placeholder="Enter UserName" name="uname" required> -->


							<label for="age"><b>나이</b></label> <input type="text" name="uage" required readonly
								value="${my.memberAge }">

							<div class="joinradio">
								<c:choose>
									<c:when test="${my.memberGender == 'm' }">
										<input type="radio" name="user_sex" value="m" checked="checked">남<input
											type="radio" name="user_sex" value="f">여
									</c:when>
									<c:otherwise>
										<input type="radio" name="user_sex" value="m">남<input type="radio"
											name="user_sex" value="f" checked="checked">여
									</c:otherwise>
								</c:choose>

							</div>

							<label for="email"><b>이메일</b></label> <input type="text" name="email" required
								value="${my.memberEmail }"> <label for="address"><b>주소</b></label> <input type="text"
								name="address" required value="${my.memberAddress }"> <label
								for="tel"><b>전화번호</b></label> <input type="text" name="tel" required
								value="${my.memberTel }"> 

							<div class="joinradio">
								<c:if test="${my.memberAuther == 'admin' }"></c:if>
								<c:choose>
									<c:when test="${my.memberAuther == 'user' }">
										<input type="radio" name="user_auther" value="user" checked="checked">사용자 <input
											type="radio" name="user_auther" value="busi">사업자
									</c:when>

									<c:otherwise>
										<input type="radio" name="user_auther" value="user">사용자 <input type="radio"
											name="user_auther" value="busi" checked="checked">사업자
									</c:otherwise>
								</c:choose>
							</div>
							<div class="clearfix">
								<button id="modify" type="submit" class="modibtn">수정</button>
								<button type="button" onclick="document.getElementById('id03').style.display='none'"
									class="cancelbtn">취소</button>
							</div>
						</div>
					</form>
				</div>

				<script>
					document.getElementById('modify').addEventListener('click', function () {

						let pw = document.querySelector('input[id="psw"]').value;
						let pwc = document.querySelector('input[id="pswr"]').value;
						if (pw != pwc) {
							alert("비밀번호가 다릅니다. 다시 입력해주세요.")
							document.getElementById('psw').value = '';
							document.getElementById('pswr').value = '';
						} else {

							let uid = document.getElementById('uidaa').value;
							alert(uid + "님 개인정보가 수정되었습니다!")
						}

					});
				</script>
			</body>

			</html>