<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
  pageContext.setAttribute("level", level);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<style>

.a{
	text-decoration:none;
}
.nav-item{
position: -webkit-sticky;
z-index:10;
}
#mainnav {
	position: -webkit-sticky;
	position: sticky;
	top : -1px;
	z-index:1;
	height : 70px;
}
nav li {
	margin-top:10px;
	font-size:15pt;
}
.nav {
	font-size:15pt;
}
.carousel-caption {
	margin: 0%;
	left:0%;
}
#homeTitle{
	font-size: 35px;
}
#homeTitle a{
	color : black;
}
#homeTitle a:hover{
	text-decoration:none;
	color: red;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {
}

.dropdown-content {
	width : 30px;
  background-color: black;
}
.dropdown-content a {
  color: white;
}
.nav-link a{
	text-decoration:none;
  color: black;
}
.nav-link:hover a {
	text-decoration:none;
  color: red;
}



</style>


<script>
  function deleteAsk() {
	  let ans = confirm("정말로 탈퇴 하시겠습니까?");
	  if(ans) {
		  let ans2 = confirm("탈퇴후 같은 아이디로 1개월간 재가입하실수 없습니다.\n그래도 탈퇴 하시겠습니까?");
		  if(ans2) location.href="${ctp}/MemberDeleteAsk.mem";
	  }
  }
  
</script>


<nav id="mainnav" class="navbar-light bg-white mr-4">
  <ul class="nav justify-content-end">
  <c:if test="${level <= 4}">
  
	  <li class="nav-item dropdown">
    <c:if test="${sLevel == 0}">
			<a class="nav-link" href="${ctp}/AdminMain.ad"><font color="black">ADMIN PAGE</font></a>
    </c:if>
		</li>
 
	 <li class="nav-item dropdown">
    <div class="nav-link  dropbtn" href="${ctp}/MemberMain.mem">MY PAGE</div> 
      <div class="dropdown-menu dropdown-content">
	      <a class="dropdown-item" href="${ctp}/MemberMain.mem">나의 정보</a>
	      <a class="dropdown-item" href="${ctp}/ReservationList.ex">나의 예약현황</a>
	      <a class="dropdown-item" href="${ctp}/MemberPwdCheckForm.mem">회원정보수정</a>
	      <a class="dropdown-item" href="${ctp}/MemberPwdUpdate.mem">회원비밀번호 변경</a>
	      <a class="dropdown-item" href="javascript:deleteAsk()">회원 탈퇴</a>
			</div>
	 </li>
	 </c:if>
	 
	  <li class="nav-item">
        <c:if test="${level > 4}"><a class="nav-link" href="${pageContext.request.contextPath}/MemberLogin.mem"><font color="black">Login</font></a></c:if>
        <c:if test="${level <= 4}"><a class="nav-link" href="${pageContext.request.contextPath}/MemberLogout.mem"><font color="black">Logout</font></a></c:if>
    </li>  
    <li class="nav-item">
      <c:if test="${level > 4}"><a class="nav-link" href="${pageContext.request.contextPath}/MemberJoin.mem"><font color="black">Join</font></a></c:if>
    </li>  
	</ul>
</nav>

  	

	<div class="container text-center text-dark mt-1" class="title">
		<br/><br/>
		<span id="homeTitle"><a href="http://192.168.50.91:9090/javaweb12J/"><h1>GROUND SAWSAW</h1></a></span>
		<br/><br/>
	</div>


  	
  	<!-- 메인메뉴 -->
<span>
<nav id="mainnav" class="navbar-light bg-white">
  <ul class="nav justify-content-center">
	 <li class="nav-item dropdown">
	    <div class="nav-link dropbtn mr-5">EXHIBITION</div>
	    <div class="dropdown-menu dropdown-content">
	      <a class="dropdown-item text-center" href="${pageContext.request.contextPath}/ExhibitionList.ex">EXHIBITION</a>
		    <a class="dropdown-item text-center" href="${ctp}/ReviewList.rv">REVIEW</a>
	   	</div>
	  </li>
	   <li class="nav-item dropdown">
	    <div class="nav-link dropbtn ml-4 mr-5 text-center">&nbsp;&nbsp;STORE</div>
	    <div class="dropdown-menu dropdown-content">
	      <a class="dropdown-item text-center" href="#">DIGITAL</a>
		    <a class="dropdown-item text-center" href="#">POSTER</a>
		    <a class="dropdown-item text-center" href="#">LIVING</a>
	   </div>
	  </li>
	  <li class="nav-item dropdown">
	    <div class="nav-link dropbtn ml-3 mr-5">&nbsp;&nbsp;&nbsp;PLACE</div>
	    <div class="dropdown-menu dropdown-content">
	      <a class="dropdown-item text-center" href="${ctp}/ExhibitionVisit.ex">ABOUT US</a>
	      <a class="dropdown-item text-center" href="${ctp}/ExhibitionVisit.ex">VISIT</a>
	   </div>
	   </li>
	  <li class="nav-item dropdown">
	    <div class="nav-link dropbtn ml-3">SERVICE</div>
	    <div class="dropdown-menu dropdown-content">
	      <a class="dropdown-item text-center" href="${pageContext.request.contextPath}/BoardList.bo">NOTICE</a>
	      <a class="dropdown-item text-center" href="${ctp}/AskBoardList.ask">Q&A</a>
	   </div>
	   </li>
	</ul>
</nav>
</span>

