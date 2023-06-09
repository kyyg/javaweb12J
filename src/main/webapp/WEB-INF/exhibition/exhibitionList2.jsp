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
  <title>EXHIBITION</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
    th {
      background-color:#eee;
      text-align: center;
    }
    .exList{
    width: 500px;
    }
  </style>
  
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<script>
  'use strict';
  
  function pageCheck() {
  	let pageSize = document.getElementById("pageSize").value;
  	location.href = "${ctp}/ExhibitionList.ex?pag=${pag}&pageSize="+pageSize;
  }
  
  function delCheck(idx) {
  	let ans = confirm("현재 게시물을 삭제하시겠습니까?");
  	if(ans) location.href = "${ctp}/ExhibitionDelete.gu?idx="+idx;
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
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container" >
  <h2 class="text-center">EXHIBITION</h2>
  
  <table class="table table-borderless mb-0 p-0">
    <tr>
      <c:if test="${sLevel == 0}">
      <td style="text-align:right;"><a href="${ctp}/ExhibitionInput.ex" class="btn btn-light btn-sm">전시등록</a></td>
    	</c:if>
  </table>
  <table class="table table-borderless mb-5">
    <tr>
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
  
  <c:set var="cnt" value="0" />
  <c:forEach var="vo" items="${vos}" varStatus="st">
  <span class="exAllList">
	  <div class="text-center exList">
	  	<div class="exImg" id="exImg"><a href="${ctp}/ReservationContent.ex?idx=${vo.idx}"><img src="${ctp}/images/${vo.poster}.jpg" width="500px" height="500px"/></a></div>
	  	<div class="exTitle mt-3" id="exTitle" style="font-size:20px"><a href="${ctp}/ReservationContent.ex?idx=${vo.idx}">${vo.title}</a></div>
	  	<div class="exInfo" id="exInfo">
		  	<span>전시기간 : ${fn:substring(vo.startDate,0,10)} ~ ${fn:substring(vo.endDate,0,10)}</span>&nbsp;&nbsp;&nbsp;
		  	<span class="badge badge-secondary text-right text-light">${vo.place}</span>
	  	</div>
	  	<div><hr/></div>
	  </div>
	  </span>
  </c:forEach>
  
  
  <br/>			<!-- 4페이지(1블록)에서 0블록으로 가게되면 현재페이지는 1페이지가 블록의 시작페이지가 된다. -->
  <!-- 첫페이지 / 이전블록 / 1(4) 2(5) 3 / 다음블록 / 마지막페이지 -->
  <div class="text-center">
	  <ul class="pagination justify-content-center">
	    <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/ExhibitionList.ex?pageSize=${pageSize}&pag=1">첫페이지</a></li></c:if>
	    <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/ExhibitionList.ex?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li></c:if>
	    <c:forEach var="i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
	      <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="${ctp}/ExhibitionList.ex?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
	      <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/ExhibitionList.ex?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
	    </c:forEach>
	    <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/ExhibitionList.ex?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li></c:if>
	    <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/ExhibitionList.ex?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li></c:if>
	  </ul>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>