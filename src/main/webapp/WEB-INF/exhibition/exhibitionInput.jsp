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
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
	<h3>전시회 등록</h3>
	<form name="myform" method="post" action="${ctp}/ExhibitionInputOk.ex" enctype="multipart/form-data">
	<table>
		<tr>
			<td>전시회 제목</td>
			<td><input type="text" name="title" id="title" class="form-control" /></td>
		</tr>
		<tr>
			<td>전시 작가</td>
			<td><input type="text" name="author" id="author" class="form-control" /></td>
		</tr>
		<tr>
			<td>전시 시작날짜</td>
			<td><input type="date" name="startDate" id="startDate" class="form-control" /></td>
		</tr>
		<tr>
			<td>전시 종료날짜</td>
			<td><input type="date" name="endDate" id="endDate" class="form-control" /></td>
		</tr>
		<tr>
			<td>대인 요금</td>
			<td><input type="number" name="adultPrice" id="adultPrice" class="form-control" /></td>
		</tr>
		<tr>
			<td>소인 요금</td>
			<td><input type="number" name="childPrice" id="childPrice" class="form-control" /></td>
		</tr>
		<tr>
			<td>장소</td>
			<td><input type="text" name="place" id="place" class="form-control" /></td>
		</tr>
		<tr>
			<td>대표이미지</td>
			<td><input type="file" name="poster" id="poster" class="form-control-file" /></td>
		</tr>
		<tr>
			<td>세부내용이미지</td>
			<td><input type="file" name="content" id="content" class="form-control-file" /></td>
		</tr>
		<tr>
			<td>
			 <input type="button" value="등록" onclick="fCheck()" class="btn btn-light"/> &nbsp;
			 <input type="button" value="돌아가기" onclick="location.href='${ctp}/ExhibitionList.ex';" class="btn btn-light"/>
			</td>
		</tr>
	</table>
	
	
	</form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>