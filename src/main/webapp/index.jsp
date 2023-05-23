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
  
  <!-- swiper api -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>


  
  <style>
  .swiper {
		width: 700px;
		height: 500px;
	}
	.swiper-scrollbar {
		background: #fefde1;
	}
	.swiper-scrollbar-drag {
		background: #4431bf;
	}
	img {
		width: 100%;
	}
  </style>

  <script type="text/javascript">
  
	window.addEventListener("load", function(){
		var swiper = new Swiper('.swiper', {
			// Optional parameters
			direction: 'horizontal',
			loop: true,
		  	// Navigation arrows
		  	navigation: {
		    	nextEl: '.swiper-button-next',
		    	prevEl: '.swiper-button-prev',
		  	},
		  	// And if we need scrollbar
		  	scrollbar: {
		    	el: '.swiper-scrollbar',
		  	},
		  	autoplay: {
		  	  	delay: 3000,
		  	 	pauseOnMouseEnter: true,
		  	 },
		});
	});
</script>

</head>
<body>
<jsp:include page="/include/header2.jsp" />


 <div class="container" style="margin-top:60px">
<div class="text-center"><h3>NEXT EXHIBITION</h3></div>
	<div class="container-800">
	<!-- Slider main container -->
	<div class="swiper">
		<!-- Additional required wrapper -->
	  	<div class="swiper-wrapper">
	    	<!-- Slides -->
	    	<div class="swiper-slide">
	    		<img src="${ctp}/images/3.jpg">
	    	</div>
	    	<div class="swiper-slide">
	    		<img src="${ctp}/images/4.jpg">
	    	</div>
	    	<div class="swiper-slide">
	    		<img src="${ctp}/images/5.jpg">
	    	</div>
	  	</div>
	 	<!-- If we need scrollbar -->
		<div class="swiper-scrollbar"></div>
	</div>
</div> 

<p><br/></p>
<div class="container">
	앞으로 나올 전시 목록 <br/>
	리뷰 목록 <br/>
	약도(페이지 따로 있음) <br/>
</div>

</div>
<jsp:include page="/include/footer.jsp" />
</body>
</html>