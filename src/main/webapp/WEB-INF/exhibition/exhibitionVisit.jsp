<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>exhibitionVisit.jsp</title>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9ab3d2efb31b5710a5e1f35b4bd34b7">
  
  var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
  var options = { //지도를 생성할 때 필요한 기본 옵션
  	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
  	level: 3 //지도의 레벨(확대, 축소 정도)
  };

  var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
  
  
  </script>
  <jsp:include page="/include/bs4.jsp" />
  
  
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>

<div id="map" style="width:500px;height:400px;"></div>

<div class="container text-center">
	<img src="${ctp}/images/visit1.jpg"/>
	<img src="${ctp}/images/visit2.jpg"/>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>