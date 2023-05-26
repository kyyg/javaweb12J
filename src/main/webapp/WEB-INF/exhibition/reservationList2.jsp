<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>reservationList.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  
  <script>
  function reservationCancel(idx){
	  let ans= confirm("예약을 취소하시겠습니까?");
	  if(!ans) return;
	  
	  $.ajax({
		  type: "post",
		  url : "${ctp}/ReservationCancel.ex",
		  data : {idx : idx},
		  success : function(res){
			  if(res == "1"){
					alert("예약을 취소하였습니다.");
					location.reload();
			  }
			},
		  error:function(){
			  alert("전송오류!");
		  },
	  });
  }
  
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container text-center text-align:center">
	<h3 class="text-center mb-4">나의 예약현황</h3>
	  <table class="table table-borderless table-hover" style="font-size:12px">
	  	<tr class="table-dark text-dark text-center">
	  		<th>번호</th>
	  		<th>결제날짜</th>
	  		<th>전시</th>
	  		<th>예약날짜</th>
	  		<th>인원</th>
	  		<th>결제금액</th>
	  		<th>사용여부</th>
	  		<th>리뷰</th>
	  		<th>예약취소</th>
	  	</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr class="text-center">
				<td>${vo.idx}</td>	
				<td>${fn:substring(vo.wDate,0,19)}</td>	
				<td>${vo.title}</td>	
				<td>${vo.reDate}</td>	
				<td>${vo.peopleNum}</td>	
				<td>${vo.totalPrice}</td>	
				<td>${vo.confirm}</td>	
				<c:if test="${vo.confirm == 'OK'}">
					<td><a href="${ctp}/ReviewInput.rv?idx=${vo.idx}">리뷰 작성</a></td>	
				</c:if>
				<c:if test="${vo.confirm == 'NO'}">
					<td></td>	
				</c:if>
				<td><a href="javascript:reservationCancel(${vo.idx})">취소</a></td>
					<tr>				
						<td class="m-0 p-0"></td>
					</tr>
			</tr>	   
 		 </c:forEach>
	  </table>
	  <div class="container text-center">
	  	<input type="button" onclick="${ctp}/MemberMain.mem" value="이전화면으로" class="btn btn-light">
	  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>