<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문목록조회</title>
<style>
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
</head>
<body>



	 <table class="table">
    <thead>
      <tr><th>주문번호</th><th>아이디</th><th>상품명</th><th>수량</th><th>등록일</th><th>수정일</th></tr>
    </thead>
    <tbody>
   		<c:forEach var="list" items="${list }">
   		 <tr>
   		  <td>${list.orderNum }</td>
          <td>${list.memberId }</td>
          <td>${list.itemName }</td>
          <td>${list.orderCount }</td>
          <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${list.orderJoindate }"/></td>
          <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${list.orderMdate }"/></td>
      	</tr>
   		</c:forEach>
    </tbody>
  </table>
  

</body>
</html>