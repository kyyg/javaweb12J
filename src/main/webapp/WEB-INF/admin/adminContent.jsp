<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>adminContent.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
	전시 목록 :  전시 / 예정 / 마감<br/>
	예약 목록 :	예약 횟수<br/>
	회원 목록 :  신규회원<br/>
	문의사항  :  문의 횟수<br/>
	공지사항 :   <br/>
	

</div>
<p><br/></p>
</body>
</html>