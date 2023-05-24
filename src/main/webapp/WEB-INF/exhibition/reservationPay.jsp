<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>reservationPay.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
  
  function fCheck(){
	  myform.submit();
  }
  
  </script>
  	<style>
  	th{
  	background-color:#eee;
  	}
  	
 	 @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@400;600&display=swap');
 	 *{
 	 font-family: 'Noto Serif KR', serif;
 	 }
	</style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="${ctp}/ReservationPayOk.ex">
	<h4 class="text-center mb-5">결제화면</h4>
	<table class="table table-bordered">
		<tr class="text-left">
			<th colspan="2 m-0 p-0" style="background-color:#eee">고객정보</th>
		</tr>
		<tr>
			<th>아이디</th>
			<td><span id="mid" name="mid">${vo.mid}</span></td>
		</tr>
		<tr>
			<th>성명</th>
			<td><input type="text" name="name" id="name" value="${vo.name}" style="border:0"/></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="tel" id="tel" value="${vo.tel}" style="border:0"/></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" id="email" value="${vo.email}"style="border:0"/></td>
		</tr>
		</table>
		<table class="table table-bordered mt-5">
		<tr class="text-left">
			<th colspan="4 m-0 p-0" style="background-color:#eee">예약 정보</th>
		</tr>
		<tr>
			<th>예약 전시</th>
			<td colspan="3"><span id="title" name="title" value="${title}" style="font-size:15px">${title}</span></td>
		</tr>
		<tr>
			<th>예약 날짜</th>
			<td colspan="3"><span id="reDate" name="reDate" value="${reDate}">${reDate}</span></td>
		</tr>
		<tr>
			<th>인원</th>
			<td><span id="poepleNum" name="poepleNum" value="">${peopleNum}</span></td>
			<th>금액</th>
			<td class="text-right"><span id="price" name="price" value="${price}">${price}원</span></td>
		</tr>
			<th>총 결제 금액</th>
			<td colspan="3" class="text-right"><span id="totalPrice" name="totalPrice" value="${totalPrice}"><b>${totalPrice}원</b></span></td>
		</tr>
			<input type="hidden" id="exIdx" name="exIdx" value="${exIdx}">
			<input type="hidden" id="title" name="title" value="${title}">
			<input type="hidden" id="reDate" name="reDate" value="${reDate}">
			<input type="hidden" id="price" name="price" value="${price}">
			<input type="hidden" id="peopleNum" name="peopleNum" value="${peopleNum}">
			<input type="hidden" id="totalPrice" name="totalPrice" value="${totalPrice}">
	</table>
		<input type="button" value="결제하기" onclick="fCheck()" class="btn btn-light form-control"/>
</form>



</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>