<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>GROUND SAWSAW</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
 	 @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@400;600&display=swap');
 	 *{
 	 font-family: 'Noto Serif KR', serif;
 	 }
	</style>
</head>
<body>
<jsp:include page="/include/header2.jsp" />
<jsp:include page="/include/footer.jsp" />
</body>
</html>