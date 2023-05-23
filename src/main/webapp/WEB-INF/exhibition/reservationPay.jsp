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
			<td>아이디</td>
			<td><span id="mid" name="mid">${vo.mid}</span></td>
		</tr>
		<tr>
			<td>성명</td>
			<td><input type="text" name="name" id="name" value="${vo.name}"/></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="name" id="name" value="${vo.tel}"/></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="name" id="name" value="${vo.email}"/></td>
		</tr>
		</table>

		
		<table class="table table-bordered mt-5">
		<tr class="text-left">
			<th colspan="3 m-0 p-0" style="background-color:#eee">예약 정보</th>
		</tr>
		<tr>
			<td>예약 전시</td>
			<td colspan="2"><span id="title" name="title" value="${vo2.title}" style="font-size:15px">${vo2.title}</span></td>
		</tr>
		<tr>
			<td>예약 날짜</td>
			<td colspan="2"><span id="reDate" name="reDate" value="${reDate}">${reDate}</span></td>
		</tr>
		<tr>
			<td>소인</td>
			<td><span id="childNum" name="childNum" value="${childNum}">${childNum}</span></td>
			<td class="text-right"><span id="childPrice" name="childPrice" value="">${vo2.childPrice}원</span></td>
		</tr>
		<tr>
			<td>대인</td>
			<td><span id="adultNum" name="adultNum" value="${adultNum}">${adultNum}</span></td>
			<td class="text-right"><span id="adultPrice" name="adultPrice" value="">${vo2.adultPrice}원</span></td>
		</tr>
		<tr>
			<td>총 결제 금액</td>
			<td colspan="2" class="text-right"><span id="totalPrice" name="totalPrice" value=""><b>${totalPrice}원</b></span></td>
		</tr>
			<input type="hidden" id="exIdx" name="exIdx" value="${exIdx}">
			<input type="hidden" id="title" name="title" value="${vo2.title}">
			<input type="hidden" id="reDate" name="reDate" value="${reDate}">
			<input type="hidden" id="childNum" name="childNum" value="${childNum}">
			<input type="hidden" id="adultNum" name="adultNum" value="${adultNum}">
			<input type="hidden" id="totalPrice" name="totalPrice" value="${totalPrice}">
	</table>
</form>

		<input type="button" value="결제하기" onclick="fCheck()" class="btn btn-light form-control"/>


</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>