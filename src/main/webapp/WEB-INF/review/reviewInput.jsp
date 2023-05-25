<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>pdsInput.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    let cnt = 1;
    
    // 동적폼(파일 업로드 박스 추가하기)
    function fileBoxAppend() {
    	cnt++;
    	let fileBox = '';
    	fileBox += '<div id="fBox'+cnt+'">('+cnt+')';
    	fileBox += '<input type="file" name="fName'+cnt+'" id="fName'+cnt+'" class="form-control-file border mb-2" style="float:left; width:85%;" />';
    	fileBox += '<input type="button" value="삭제" onclick="deleteBox('+cnt+')" class="btn btn-danger form-control mb-2 ml-2" style="width:10%;" />';
    	fileBox += '';
    	fileBox += '</div>';
    	$("#fileBoxAppend").append(fileBox);
    }
    
    // 추가된 파일박스 삭제처리
    function deleteBox(cnt) {
    	$("#fBox"+cnt).remove();
    	cnt--;
    }
    
    // 자료 올리기(등록처리)
    function fCheck() {
    	
	    	myform.submit();
    	
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="${ctp}/ReviewInputOk.rv" enctype="multipart/form-data">
    <h2 class="text-center">리뷰 작성</h2>
    <br/>
    <div class="mb-2">
      작성자 : ${sMid}
    </div>
    <div class="mb-2">
      <div>전시 : ${title}</div>
      <div>예약날짜 : ${reDate}</div>
    </div>
    <div class="mb-2">
      제목  <input type="text" name="title" id="title" class="form-control" required />
    </div>
    <div class="mb-2">
      내용  <textarea rows="4" name="content" id="content" class="form-control" required ></textarea>
    </div>
    <div class="mb-2">
      공개여부 
      <input type="radio" name="openSw" value="공개" checked />공개 &nbsp;&nbsp;
      <input type="radio" name="openSw" value="비공개" />비공개
    </div>
    <div>
      <input type="file" name="fName1" id="fName1" class="form-control-file border mb-2"/>
    </div>
    <div id="fileBoxAppend"></div>
    <div class="mb-2">
      비밀번호 
      <input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요" required />
    </div>
    <div class="mb-2">
      <input type="button" value="리뷰 작성" onclick="fCheck()" class="btn btn-light"/> &nbsp;
      <input type="button" value="목록으로" onclick="location.href='${ctp}/ReviewList.rv';" class="btn btn-light"/>
    </div>
    <input type="hidden" name="fileSize"/>
    <input type="hidden" name="reIdx" id="reIdx" value="${reIdx}"/>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>