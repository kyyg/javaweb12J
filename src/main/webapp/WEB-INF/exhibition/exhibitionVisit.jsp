<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>exhibitionVisit.jsp</title>
  </script>
  <jsp:include page="/include/bs4.jsp" />  
  
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container text-center">
	<img src="${ctp}/images/visit1.jpg"/>
	<img src="${ctp}/images/visit2.jpg"/>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>