<%@page import="co.caffet.vo.MemberVO"%>
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
<%
  MemberVO vo = (MemberVO) request.getAttribute("my");
%>

	<form class="modal-content" id="myForm" action="modifyMember.do" method="post">
				<div id="deleteBtn">
						
						<div class="container">
						
							<h1>개인정보수정</h1>
							<hr>
							<label for="name"><b>이름</b></label> 
							<input type="text" name="uname" required value="${my.memberName }">
							<label for="uname"><b>아이디</b></label> 
							<input type="text"  name="uid" id="uidaa" required value="${my.memberId }"readonly>
							
							<label for="pswd"><b>비밀번호</b></label> 
							<input type="password" name="pswd" id="pswd" required value="${my.memberPw }">
								
							<label for="pswr"><b>비밀번호 확인</b></label> 
							<input type="password" name="pswr" id="pswr" required value="${my.memberPw }">

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
								<button id="modify" type="button" class="modibtn">수정</button>
								<button id="delBtn" type="button" class="delbtn">회원탈퇴</button>
								<button type="button" onclick="document.getElementById('deletefrm').style.display='none'"
									class="cancelbtn">취소</button>
							</div>
							
							
						</div>
					
				</div>
	</form>
				<!-- <form id="myFormTest" action=modifyMember.do>
				
				</form>  -->




				<script>
			
					document.getElementById('modify').addEventListener('click', function () {
					    let myForm = document.querySelector('#myForm');
					    
						let pw = document.querySelector('input[name="pswd"]').value;
						let pwc = document.querySelector('input[name="pswr"]').value;
						
						console.log(pw + " pw |" + pwc + " pwc")
						if (pw != pwc) {
							alert("비밀번호가 다릅니다. 다시 입력해주세요.")
							document.getElementById('psw').value = '';
							document.getElementById('pswr').value = '';
						} else {

							let userid = document.getElementById('uidaa').value;
							alert(userid + "님 개인정보가 수정되었습니다!")
							myForm.submit();	
							
						}
											
						

					});
					
					document.getElementById('delBtn').addEventListener('click', function(){
						console.log("삭제 버튼 작동")
						
						let userid = document.getElementById('uidaa').value;
						let myForm = document.querySelector('#myForm');
						myForm.action = 'deleteMember.do';
						alert(userid + "님 회원탈퇴가 완료되었습니다.")
						myForm.submit();
					});
				</script>
			</body>

			</html>