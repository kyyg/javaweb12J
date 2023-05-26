<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>예약 전시 리스트(관리자)</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
  @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@400;600&display=swap');
  
  	*{
  	font-family: 'Noto Serif KR', serif;
  	}
  
    th {
      background-color:#eee;
      text-align: center;
      font-family: 'Noto Serif KR', serif;
    }
    .exList{
    width: 500px;
    }
    
    .img:hover{
    	opacity:80%;
    }
  </style>
  
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<script>
  'use strict';
  
  function pageCheck() {
  	let pageSize = document.getElementById("pageSize").value;
  	location.href = "${ctp}/AdminReservationList.ad?pag=${pag}&pageSize="+pageSize;
  }
  
  function delCheck(idx) {
  	let ans = confirm("현재 게시물을 삭제하시겠습니까?");
  	if(ans) location.href = "${ctp}/ExhibitionDelete.gu?idx="+idx;
  }
  
  function confirmChangeCheck(e){
	  let ans = confirm("선택한 회원의 티켓 사용여부를 변경하시겠습니까?");
  	if(!ans) {
  		location.reload();
  		return false;
  	}
  	
  	let items = e.value.split("/");
  	let query = {
  			confirm : items[0],
  			mid   : items[1]
  	}
  	
  	$.ajax({
  		type   : "post",
  		url    : "${ctp}/AdminReservationConfirmChange.ad",
  		data   : query,
  		success:function(res) {
  			if(res == "1") {
  				alert("티켓 사용 여부가 변경되었습니다.");
  				location.reload();
  			}
  			else alert("티켓 사용여부 변경에 실패하였습니다.");
  		},
  		error : function() {
  			alert("전송 오류");
  		}
  	});
  
  }
</script>
<style>
 .info{
 	width : 500px;
 	text-align:center;
 }
</style>
</head>
<body>
<p><br/></p>
  
    
<h2 class="text-center">전시 예약 목록</h2> 

 <table class="table table-borderless">
  <tr class="text-left">
    <td>
      <select name="pageSize" id="pageSize" onchange="pageCheck()">
        <option <c:if test="${pageSize == 3}">selected</c:if>>3</option>
        <option <c:if test="${pageSize == 5}">selected</c:if>>5</option>
        <option <c:if test="${pageSize == 10}">selected</c:if>>10</option>
        <option <c:if test="${pageSize == 15}">selected</c:if>>15</option>
        <option <c:if test="${pageSize == 20}">selected</c:if>>20</option> 
      </select>
    </td>
  </tr>
</table>
      
 <div class="container-fluid">
	  <table class="table table-borderless table-hover" style="font-size:12px">
	  	<tr class="table-dark text-dark text-center">
	  		<th>번호</th>
	  		<th>예약번호</th>
	  		<th>예약자</th>
	  		<th>전시</th>
	  		<th>예약날짜</th>
	  		<th>결제날짜</th>
	  		<th>인원</th>
	  		<th>결제금액</th>
	  		<th>사용여부</th>
	  	</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr class="text-center">
 				<td>${vo.idx}</td>	
				<td>${vo.reNum}</td>
				<td>${vo.mid}</td>
				<td>${vo.title}</td>
				<td>${vo.reDate}</td>
				<td>${vo.wDate}</td>
				<td>${vo.peopleNum}</td>
				<td>${vo.totalPrice}</td>
				<td>
					<select name="levelShow" id="levelShow" onchange="confirmChangeCheck(this)">
            <option value="NO/${vo.mid}" ${vo.confirm=='NO' ? "selected" : ""}>NO</option>
	      	  <option value="OK/${vo.mid}" ${vo.confirm=='OK' ? "selected" : ""}>OK</option>
					</select>
				</td>
				<tr>			
					<td class="m-0 p-0"></td>
				</tr>
			</tr>	   
 		 </c:forEach>
	  </table>
  
  <br/>			
  <!-- 4페이지(1블록)에서 0블록으로 가게되면 현재페이지는 1페이지가 블록의 시작페이지가 된다. -->
  <!-- 첫페이지 / 이전블록 / 1(4) 2(5) 3 / 다음블록 / 마지막페이지 -->
  <div class="text-center">
	  <ul class="pagination justify-content-center">
	    <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminReservationList.ad?pageSize=${pageSize}&pag=1">첫페이지</a></li></c:if>
	    <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminReservationList.ad?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li></c:if>
	    <c:forEach var="i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
	      <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="${ctp}/AdminExhibitionList.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
	      <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminReservationList.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
	    </c:forEach>
	    <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminReservationList.ad?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li></c:if>
	    <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminReservationList.ad?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li></c:if>
	  </ul>
  </div>
</div>
<p><br/></p>
</body>
</html>