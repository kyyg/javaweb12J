<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memberLogin.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
  	body{
  	background-image: url("images/ex4.jpg");
  	background-size: 100%;
  	}
  	.title a{
  	text-decoration : none;
  	color : green;
  	}
  	.modal-content{
  	opacity : 70%;
  	}
  </style>
</head>
<body>
<p><br/></p>
<p><br/></p>
<p><br/></p>
<p><br/></p>
<div class="container">
  <div class="modal-dialog">
	  <div class="modal-content p-4 pt-5">
		  <h1 class="text-center title mb-3 mt-3"><i><a href="${ctp}/">GROUND SAWSAW</a></i></h1>
		  <h3 class="text-center">LOGIN</h3>
		  <p class="text-center">Let's start to Enjoy and Saw!</p>
		  <form name="myform" method="post" action="${ctp}/MemberLoginOk.mem" class="was-validated">
		    <div class="form-group m-0 p-0">
		      <label for="mid">ID</label>
		      <input type="text" class="form-control" name="mid" id="mid" value="${mid}" placeholder="아이디를 입력하세요." required autofocus />
		      <div class="valid-feedback">Ok!!!</div>
		      <div class="invalid-feedback">아이디를 입력해 주세요.</div>
		    </div>
		    <div class="form-group m-0 pb-3">
		      <label for="pwd">PASSWORD</label>
		      <input type="password" class="form-control" name="pwd" id="pwd" value="1234" placeholder="Enter email" required />
		      <div class="valid-feedback">Ok!!!</div>
		      <div class="invalid-feedback">비밀번호를 입력해 주세요.</div>
		    </div>
		    <div class="row" style="font-size:12px">
		    	<span class="col text-left"><input type="checkbox" name="idSave" checked />아이디 저장</span>
		    </div>
		    <div class="form-group text-center">
		    	<button type="submit" class="btn btn-light mr-1">로그인</button>
		    	<button type="button" onclick="location.href='${ctp}/';" class="btn btn-light mr-1">메인화면으로</button>
		    </div>
		    <div class="row text-center" style="font-size:12px">
		      <span class="col">
		        [<a href="#">아이디찾기</a>]
		        [<a href="#">비밀번호찾기</a>]
		      </span>
		    </div>
		  </form>
	  </div>
  </div>
</div>
<p><br/></p>
</body>
</html>