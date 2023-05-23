<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<div class="jumbotron text-center" style="margin-bottom:0;height:850px;padding:0;">
	<div id="demo" class="carousel slide" data-ride="carousel" style="z-index:0">
	  <!-- Indicators -->
	  <ul class="carousel-indicators">
	    <li data-target="#demo" data-slide-to="0" class="active"></li>
	    <li data-target="#demo" data-slide-to="1"></li>
	  </ul>
	  
	  <!-- The slideshow -->
	  <div class="carousel-inner" style="z-index:0">
	    <div class="carousel-item active" style="z-index:0">
	      <img src="${ctp}/images/1.jpg" width="100%" height="700px">
	      <div class="carousel-caption" style="width:100%">
	        <h1><b>알폰스 무하 전시전</b></h1></br>
	        <h3>2023.05.13~07.13</h3>
	      </div>   
	    </div>
	    <div class="carousel-item">
	      <img src="${ctp}/images/2.jpg" width="100%" height="700px">
	      <div class="carousel-caption" style="width:100%">
	        <h5><b>에드가 드가 전시전</b></h5>
	        <h5>2023.06.7~08.08</h5>
	      </div>   
	    </div>
	  </div>
	  
	  <!-- Left and right controls -->
	  <a class="carousel-control-prev" href="#demo" data-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </a>
	  <a class="carousel-control-next" href="#demo" data-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </a>
	</div>
</div>
