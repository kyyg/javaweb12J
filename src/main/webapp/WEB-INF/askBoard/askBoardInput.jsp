<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AskboardInput.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
    th {
      text-align: center;
      background-color: #eee;
    }
  </style>
  <script>
    'use strict';
    
    function fCheck() {
    	let title = myform.title.value;
    	let content = myform.content.value;
    	
    	if(title.trim() == "") {
    		alert("게시글 제목을 입력하세요");
    		myform.title.focus();
    	}
    	else if(content.trim() == "") {
    		alert("게시글 내용을 입력하세요");
    		myform.content.focus();
    	}
    	else {
    		myform.submit();
    	}
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">문의글 작성</h2>
  <form name="myform" method="post" action="${ctp}/AskBoardInputOk.ask">
    <table class="table table-bordered">
      <tr>
        <th>글쓴이</th>
        <td>${sNickName}</td>
      </tr>
      <tr>
        <th>제목</th>
        <td><input type="text" name="title" id="title" placeholder="글제목을 입력하세요" autofocus required class="form-control"></td>
      </tr>
      <tr>
        <th>내용</th>
        <td><textarea rows="6" name="content" class="form-control" required></textarea></td>
      </tr>
      <tr>
        <th>공개여부</th>
        <td>
          <input type="radio" name="openSw" value="OK" checked />공개 &nbsp;
          <input type="radio" name="openSw" value="NO" />비공개
        </td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
          <input type="button" value="작성" onclick="fCheck()" class="btn btn-light"/> &nbsp;
          <input type="button" value="돌아가기" onclick="location.href='${ctp}/AskBoardList.ask';" class="btn btn-light"/>
        </td>
      </tr>
    </table>
    <input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>