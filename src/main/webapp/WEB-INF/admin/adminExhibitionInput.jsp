<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>exhibitionInput.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  
  <script>
  
  // 자료 올리기(등록처리)
  function fCheck() {
   	myform.submit();
   	
  	}
  
  
  </script>
</head>
<body>
<p><br/></p>
<div class="container" style="width:800px">
	<h3 class="text-center mb-5">전시회 등록</h3>
	<form name="myform" method="post" action="${ctp}/AdminExhibitionInputOk.ad" enctype="multipart/form-data">
	<table class="table table-bordered">
		<tr>
			<th>전시회 제목</th>
			<td><input type="text" name="title" id="title" class="form-control" /></td>
		</tr>
		<tr>
			<th>전시 작가</th>
			<td><input type="text" name="author" id="author" class="form-control" /></td>
		</tr>
		<tr>
			<th>전시 시작날짜</th>
			<td><input type="date" name="startDate" id="startDate" class="form-control" /></td>
		</tr>
		<tr>
			<th>전시 종료날짜</th>
			<td><input type="date" name="endDate" id="endDate" class="form-control" /></td>
		</tr>
		<tr>
			<th>요금</th>
			<td><input type="number" name="price" id="price" class="form-control" /></td>
		</tr>
		<tr>
			<th>장소</th>
			<td><input type="text" name="place" id="place" class="form-control" /></td>
		</tr>
		<tr>
			<th>대표이미지</th>
			<td><input type="file" name="poster" id="poster" class="form-control-file" /></td>
		</tr>
		<tr>
			<th>세부내용이미지</th>
			<td><input type="file" name="content" id="content" class="form-control-file" /></td>
		</tr>
	</table>
	<div class="text-center mt-5">
		<input type="button" value="등록" onclick="fCheck()" class="btn btn-light"/> &nbsp;
		<input type="button" value="돌아가기" onclick="location.href='${ctp}/AdminExhibitionList.ad';" class="btn btn-light"/>
	</div>
	</form>
</div>
<p><br/></p>
</body>
</html>