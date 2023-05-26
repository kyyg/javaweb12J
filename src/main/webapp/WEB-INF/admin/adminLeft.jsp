<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>adminLeft.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
  	a{
  	color: black;
  	text-decoration : none;
  	}
  	a:hover{
  	background-color: white;
  	}
  </style>
</head>
<body style="background-color:#eee">
<p><br/></p>
<div class="text-center">
  <h5><font size="5px"><b>관리자 화면</b></font></h5>
  <p><br/></p>
  <hr/>
  <p><a href="${ctp}/" target="_top"><b>그라운드소소</b></a></p>
  <hr/>
  <p><br/></p>
  <hr/>
  <p><a href="${ctp}/AdminExhibitionList.ad" target="adminContent">전시 목록</a></p>
  <hr/>
  <p><a href="${ctp}/AdminReservationList.ad" target="adminContent">전시 예약목록</a></p>
  <hr/>
  <p><a href="#" target="adminContent">상품 목록</a></p>
  <hr/>
  <p><a href="#" target="adminContent">상품 판매 목록</a></p>
  <hr/>
  <p><br/></p>
  <hr/>
  <p><a href="${ctp}/AdminMemberList.ad" target="adminContent">회원 리스트</a></p>
  <hr/>
  <p><a href="${ctp}/AdminBoardList.ad" target="adminContent">공지 게시판</a></p>
  <hr/>
  <p><a href="${ctp}/AdminAskBoardList.ad" target="adminContent">문의 게시판</a></p>
  <hr/>
</div>
<p><br/></p>
</body>
</html>