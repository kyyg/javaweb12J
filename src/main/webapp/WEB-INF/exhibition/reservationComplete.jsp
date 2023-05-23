<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>reservationComplete.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container text-center">
	 <div class="modal-dialog" >
	  <div class="modal-content pt-5" style="background-color:#eee">
			<table class="table table-borderless">
				<tr class="text-center p-5 m-5">
					<td colspan="2">결제가 완료되었습니다.</td>
					<hr/>
				</tr>
				<tr>
					<td class="mb-5 pb-5"></td>
				</tr>
			</table>
		</div>
	</div>
			<table class="container text-center">
				<tr class="text-center">
					<td><button type="button" onclick="location.href='${ctp}/ReservationList.ex';" class="btn btn-light">나의 예약현황</button>
					<button type="button" onclick="location.href='${ctp}/';" class="btn btn-light">메인화면으로</button></td>
				</tr>
			</table>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>