<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>boardInput.jsp</title>
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
  <h2 class="text-center">공지 업로드</h2>
  <form name="myform" method="post" action="${ctp}/BoardInputOk.bo">
    <table class="table table-bordered">
      <tr>
        <th>글쓴이</th>
        <td>${sNickName}</td>
      </tr>
      <tr>
        <th>글제목</th>
        <td><input type="text" name="title" id="title" placeholder="글제목을 입력하세요" autofocus required class="form-control"></td>
      </tr>
      <tr>
        <th>글내용</th>
        <td><textarea rows="6" name="content" class="form-control" required></textarea></td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
          <input type="button" value="글올리기" onclick="fCheck()" class="btn btn-primary"/> &nbsp;
          <input type="reset" value="다시입력" class="btn btn-warning"/> &nbsp;
          <input type="button" value="돌아가기" onclick="location.href='${ctp}/BoardList.bo';" class="btn btn-secondary"/>
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