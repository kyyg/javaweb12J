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
	  	str+='<h4 class="p-3 text-right">결제 금액 : <b>'+totalPrice+"</b>원</h4>";
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
  			str+=" [입장권]&nbsp;"+options[2]
  			str+="</td>"
  			str+="<td class='text-right'>"
				str+= '<span style="width:5px"><input type="number" name="peopleNum" id="peopleNum'+options[0]+'" onchange="numCal('+options[0]+')" value="1" size="1" style="border:0px"><span>';
  			str+="<span name='optionPrices' id='optionPrice"+options[0]+"' style='width:30%'>"+price+"</span>원&nbsp;"
  			str+='<div class="btn btn-white text-dark borderless" onclick="deleteOption('+options[0]+')"><b>X</b></div>'
  			str+="</td>"
  			str+="</tr>"
  			str+="</table>"
  			$("#orders").html(str);
  			TotalPriceCal();
  		});
  	});
  	

  	
  	function deleteOption(idx){
  		$("#options"+idx).remove();
  		TotalPriceCal();
  	}
  	
  	function numCal(optionId) {
  	    let peopleNum = $("#peopleNum" + optionId).val();
  	    let optionPrice = Number($("#optionPrice" + optionId).text());
  	    let totalOptionPrice = peopleNum * optionPrice;
  	    $("#optionPrice" + optionId).text(totalOptionPrice);
  	    TotalPriceCal();
  	}
  	
  	function fCheck(){
  		
  		myform.reDate.value=$("#reDate").val();
  		myform.childNum.value= $("#peopleNum1").val();
  		myform.adultNum.value= $("#peopleNum2").val();
  		myform.submit();
  			
  		} 
  	
  	
	</script>

<jsp:include page="/include/header.jsp" /> 
<div class="container-fluid" style="width:70%">
	<p><br/></p>
	<div class="row mt-2">
		<div class="col pl-5 text-right">
			<img src="${ctp}/images/${vo.poster}" width="600px" height="700px"/>		</div>
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
									<option value="1/${vo.childPrice}/소인">소인 ${vo.childPrice}원</option>
									<option value="2/${vo.adultPrice}/대인">대인 ${vo.adultPrice}원</option>
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
							<td colspan="2"><h3 class="btn btn-light form-control btn-lg pt-3" style="height:70px" onclick="fCheck()">결제하기</h3></td>
						</tr>
				</table>
				<input type="hidden" name="productIdx" value="${vo.idx}"/>
				
					<input type="hidden" name="childNum" id="childNum" value="0"/>
					<input type="hidden" name="optionPrices" id="optionPrices1" value="${vo.childPrice}"/>
				
					<input type="hidden" name="adultNum" id="adultNum"  value="0"/>
					<input type="hidden" name="optionPrices" id="optionPrices2" value="${vo.adultPrice}"/>
				
				<input type="hidden" name="reDate" />
				<input type="hidden" name="totalPrice" />
				<input type="hidden" name="title" value="${vo.title}" />
			</form>
		</div>
	</div>
 
 
<div class="container mt-5">
	<table class="table table-bordered">
		<img src="${ctp}/images/${vo.content}" width="1000px" height="1300px" class="text-center" />
	</table>
</div>
	
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" /> 
</body>
</html>