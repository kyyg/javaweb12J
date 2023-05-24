<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<style>
.rec__title{
  font-size: 25px;
  color: gray;
  border-top: 1px solid rgb(226, 204, 204);
  padding: 40px 0px 80px 0px;
  font-weight: bolder;
  text-align: center;  
}
.rec a{
text-decoration: none;
color: rgb(153, 123, 123);
}
.rec__box, .rec_box2{
  display: flex;
  flex-wrap: wrap;
}
.rec{
  width: 23.5%;
  color: rgb(136, 108, 118);
  text-align: center;
}
.rec__info{
	text-align:center;
	padding-left:73px;
}
.rec__info1{
  font-weight: bolder;
}
.rec__info2, .rec__info3{
  font-size: 12px;  
}
.rec2{
display : grid;

}


</style>

<div class="jumbotron text-left" style="margin-bottom:0;height:850px;padding:0;">
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
	        <h5><b>요시고 전시전</b></h5>
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


<section>
	<div class"container">
  <section>
    <div class="rec__title">NEW EXHIBITION</div>
      <span class="rec__box">

        <span class="rec">
          <div class="rec__img"><a href="#"><img src="${ctp}/images/ex2.jpg" style="width:300px; height:300px; margin-left:90px"></a></div>
          <div class="rec__info">
            <div class="rec__info1"><a href="#">요시고 전시전</a></div>
            <div class="rec__info2"><a href="#">2023.04~06</a></div>
            <div class="rec__info3">
            </div>    
          </div>
        </span>
        <span class="rec">
          <div class="rec__img"><a href="#"><img src="${ctp}/images/ex5.jpg" style="width:300px; height:300px; margin-left:90px"></a></div>
          <div class="rec__info">
            <div class="rec__info1"><a href="#">렘브란트 전시전</a></div>
            <div class="rec__info2"><a href="#">2023.05~06</a></div>
            <div class="rec__info3">
            </div>    
          </div>
        </span>
        <span class="rec">
          <div class="rec__img"><a href="#"><img src="${ctp}/images/ex1.jpg" style="width:300px; height:300px; margin-left:90px"></a></div>
          <div class="rec__info">
            <div class="rec__info1"><a href="#">알폰스 무하 전시전</a></div>
            <div class="rec__info2"><a href="#">2023.05~08</a></div>
            <div class="rec__info3">
            </div>    
          </div>
        </span>
        <span class="rec">
          <div class="rec__img"><a href="#"><img src="${ctp}/images/ex4.jpg" style="width:300px; height:300px; margin-left:90px"></a></div>
          <div class="rec__info">
            <div class="rec__info1"><a href="#">모네 전시전</a></div>
            <div class="rec__info2"><a href="#">2023.05~07</a></div>
            <div class="rec__info3">
            </div>    
          </div>
        </span>
    </span>
  </section>
 </div>
</section>
<p><br/></p>
<p><br/></p>
<p><br/></p>
    
<div class="container text-center">
	<span>
		<iframe width="1200" height=600" src="https://www.youtube.com/embed/0Z2_08ryoQc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe> 
	</span>
</div>
<p><br/></p>
<p><br/></p>
<p><br/></p>
    
    
<div class="container text-center" style="margin-top:60px">
<img src="${ctp}/images/visit2.jpg" style="width:1000px; height:700px">
</div>
<p><br/></p>
<p><br/></p>