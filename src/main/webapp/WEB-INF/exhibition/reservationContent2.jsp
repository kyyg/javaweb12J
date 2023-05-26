<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	int level = session.getAttribute("sLevel") == null ? 99 : (int) session.getAttribute("sLevel");
	pageContext.setAttribute("level", level);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>reservationContent.jsp</title>
	<jsp:include page="/include/bs4.jsp" /> 
	<script>
		let totalPrice=0;
		
	function TotalPriceCal(){
  	totalPrice=0;
   
  	for(let i=0;i<document.getElementsByName("optionPrices").length; i++) {
  		totalPrice+=Number(document.getElementsByName("optionPrices")[i].innerHTML);
  	} 
  	let str='';
  	str+='<div class="mt-2" style="width:100%">';
  	str+='<h5 class="p-3 text-right" name="totalPrice" id="totalPrice">결제 금액 : <b>'+totalPrice+"</b>원</h5>";
  	str+='</div>';
  	$("#totalPrice").html(str);
  	myform.totalPrice.value=totalPrice;
	}
		 
	$(function(){
		$("#option").change(function(){
			let str = document.getElementById("orders").innerHTML;
			let option = $(this).val();
			let options = option.split("/");
			let price = options[1];

			str+="<table id='options"+options[0]+"' width='100%' class=' table table-borderless pb-0 mb-0'>"
			str+="<tr>"
			str+="<td class='text-left'>"
			str+=" [입장권]&nbsp;"
			str+="</td>"
			str+="<td class='text-right'>"
			str+= '<span style="width:5px"><input type="number" name="peopleNum" id="peopleNum'+options[0]+'" onchange="numCal('+options[0]+')" value="1" maxValue="2" style="border:0px"><span>';
			str+="<span name='optionPrices' id='optionPrice"+options[0]+"' style='width:30%'>"+price+"</span>원&nbsp;"
			str+='<div class="btn btn-white text-dark borderless" onclick="deleteOption('+options[0]+')"><b>X</b></div>'
			str+="</td>"
			str+="</tr>"
			str+="</table>"
			$("#orders").html(str);
			TotalPriceCal();
		});
	});
	
	function numCal(idx) {
		let option = $("#option").val();
		let options = option.split("/");
		let optionPrice = Number(options[1]);
	  let peopleNum = $("#peopleNum" + idx).val();
	
	  let totalOptionPrice = peopleNum * optionPrice;
	  $("#optionPrice" + idx).text(totalOptionPrice);
	  TotalPriceCal();
	}
  	
 	function deleteOption(idx){
		$("#options"+idx).remove();
		TotalPriceCal();
  }
  	
	function fCheck(){
		myform.submit();
	} 
  	
	</script>
	
	<style>
 	 @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@400;600&display=swap');
 	 *{
 	 font-family: 'Noto Serif KR', serif;
 	 }
	</style>
	</head>
<body>
<jsp:include page="/include/header.jsp" /> 
<div class="container-fluid" style="width:70%">
	<div class="row mt-2">
		<div class="col pl-5 text-right">
			<img src="${ctp}/images/${vo.poster}" width="600px" height="700px"/>
		</div>
		<div class="col pr-5 pt-2">
			<form name="myform" method="post" action="${ctp}/ReservationPay.ex">
				<table class="table table-borderless">
					<tr>
						<td colspan="2"><h4>${vo.title}</h4><hr/></td>
					</tr>
					<tr>
						<td>전시기간</td>
						<td>${fn:substring(vo.startDate,0,10)} ~  ${fn:substring(vo.endDate,0,10)}</td>
					</tr>	
					<tr>
						<td>전시장소</td>
						<td>${vo.place}</td>
					</tr>	
					<tr>
						<td>이용시간</td>
						<td>주중/주말 10시~19시(18시 입장마감)</td>
					</tr>	
					<tr>
						<td colspan="2"><hr/></td>
					</tr>
					<tr>
						<td>예약날짜</td>
						<td><input type="date" id="reDate" name="reDate" class="form-control"/></td>
					</tr>
					<tr>
				 		<td>옵션 선택 </td>
						<td>
							<select name="option" id="option"  class="form-control">
								<option value="0">옵션 선택</option>
									<option value="1/${vo.price}">통합 입장권 ${vo.price}원</option>
							</select>
						</td>
					</tr>
						
					<tr>
						<td colspan="2">
							<div id="orders"></div>
							<div id="totalPrice"></div>
						</td>
					</tr>
					<tr>
						<c:if test="${level == 2 || level == 1 || level == 0}">
						<td colspan="2"><hr/><h3 class="btn btn-light form-control btn-lg pt-3" style="height:70px" onclick="fCheck()">결제하기</h3></td>
						</c:if>
						<c:if test="${level != 2 && level != 1 && level != 0}">
							<td colspan="2"><hr/><h3 class="btn btn-light form-control btn-lg pt-3" style="height:70px" onclick="location.href='${ctp}/MemberLogin.mem';">로그인 후 이용해주세요.</h3></td>
						</c:if>
					
					</tr>
				</table>
				<input type="hidden" name="productIdx" value="${vo.idx}"/>
				
				<input type="hidden" name="peopleNum" id="peopleNum" value="1"/>
				<input type="hidden" name="price" id="price" value="${vo.price}"/>
				
				<input type="hidden" name="reDate" />
				<input type="hidden" name="totalPrice" />
				<input type="hidden" name="title" value="${vo.title}" />
			</form>
		</div>
	</div>
 
 
<div class="container mt-5">
	<table class="table table-borderless">
		<tr>
			<td class="table">
			<hr/>					
			- 한 예매 건에 대한 부분 발권은 불가합니다. 같은 일자로 한 번에 관람하실 예정이 아니신 경우, 개별 건으로 예매 부탁드립니다. <br/>
			- 본 전시는 일자 지정 전시로, 온라인에서 사전에 예매한 후 입장 가능하며 예매시 지정하신 일자에만 관람하실 수 있습니다.<br/>
			- 전시장 혼잡도에 따라 웨이팅이 발생될 수 있으며, 웨이팅의 경우 현장 대기 방식이 아닌 알림톡 발송 시스템입니다<br/>
			- 예매자는 본 예매 상세페이지의 모든 내용을 숙지 및 동의한 것으로 간주합니다.<br/>
			- 안내 미숙지로 인한 책임은 예매자 본인에게 있으며, 이로 인한 당일 취소, 변경, 환불은 불가합니다.<br/>
			- 예약한 일자의 하루 전까지만 취소 및 환불이 가능합니다.<br/>
			- 전시장 내부가 어둡고, 사운드의 음량이 커 폐소공포증이 있거나, 유아, 어린이, 임산부, 노약자 등에 해당하는 분들은 예매 및 입장에 유의 부탁 드립니다.<br/>
			<hr/>				
			</td>
		</tr>
		<tr>
		  <td><img src="${ctp}/images/${vo.content}" width="100%" height="100%" class="text-center" /></td>
		</tr>
	</table>
</div>
	
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" /> 
</body>
</html>