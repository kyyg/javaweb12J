<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberMain.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
    .viewCheck {
      color: red;
    }
    #memberInfo1, #memberInfo2 {
      float: left;
    }
    #memberInfo3, #memberInfo4 {
      clear: both;
    }
  </style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  	<table class="table table-bordered width:600px text-center">
  		<tr>
  			<td>아이디 : ${sMid}</td>
  			<td>닉네임: ${sNickName}</td>
  			<td>성명: ${vo.name}</td>
  			<td>포인트 : ${vo.point}</td>
  		</tr>
  		<tr>
  			<td colspan="2">총 방문횟수${visitCnt}</td>
  			<td colspan="2">오늘 방문횟수 ${todayCnt}</td>
  		</tr>
  		<tr>
  			<td colspan="2"><a href="${ctp}/MemberPwdCheckForm.mem">회원정보수정</td>
  			<td colspan="2"><a href="${ctp}/ReservationList.ex">나의예약현황</a></td>
  		</tr>
  	</table>  
 </div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>