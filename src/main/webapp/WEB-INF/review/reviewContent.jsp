<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>pdsContent.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    // 화면처음으로 부드럽게 이동시키기
		$(window).scroll(function(){
			if($(this).scrollTop() > 100 ){
	      $("#topBtn").addClass("on");
	    }
	    else{
	      $("#topBtn").removeClass("on");
	    }
			
			$("#topBtn").click(function() {
			  window.scrollTo({ top: 0, behavior: "smooth" });  //페이지에서 특정 위치로 스크롤 이동시키기 위해서는 window.scrollTo 메서드를 사용
			});
		});
		
    // 다운로드 회수 증가
    function downNumCheck(idx) {
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/PdsDownNumCheck.pds",
    		data  : {idx : idx},
    		success:function() {
    			location.reload();
    		},
    		error : function() {
    			alert("전송오류!!");
    		}
    	});
    }
  </script>
  <style>
    th {
      background-color: #eee;
    }
    
		h6 {
		  position: fixed;
		  right: 1rem;
		  bottom: -50px;
		  opacity: 0;
		  transition: 0.7s ease;
		}
		.on {
		  opacity: 0.8;
		  cursor: pointer;
		  bottom: 0;
		}
  </style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">리뷰 상세내역</h2>
  <br/>
  <table class="table table-bordered text-center">
    <tr>
			<th>예약정보</th>
	  	<th colspan="3" class="text-left">
		  	예약전시: ${vo2.title} <br/>
		  	예약날짜: ${vo2.reDate} <br/>
		  	예약인원: ${vo2.peopleNum}
	  	</th>
    </tr>
    <tr>
      <th>작성자</th>
      <td>${vo.mid}</td>
      <th>올린날짜</th>
      <td>${fn:substring(vo.wDate,0,fn:length(vo.wDate)-2)}</td>
    </tr>
    <tr>
      <th>제목</th>
      <td colspan="3" class="text-left">${vo.title}</td>
    </tr>
    <tr>
      <th>내용</th>
      <td colspan="3" class="text-left" style="height:280px;" class="text-left">${fn:replace(vo.content, newLine, '<br/>')}  
      <div class="text-center"></div>
      </td>
    </tr>
  </table>
  <div class="text-center">
    <input type="button" value="목록으로" onclick="location.href='${ctp}/ReviewList.rv?pag=${pag}';" class="btn btn-light"/>
  </div>
  <hr/>
  
</div>
<h6 id="topBtn" class="">▲</h6>
<!-- <h6 id="topBtn" class="">맨위로</h6> -->
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>