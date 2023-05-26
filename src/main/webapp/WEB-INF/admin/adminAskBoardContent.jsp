<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>boardContent.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
    th {
      text-align: center;
      background-color: #eee;
    }
  </style>
  <script>
    'use strict';
    
    function goodCheck() {
    	// location.href = "${ctp}/BoardGoodCheck.bo?idx=${vo.idx}";  // 일반처리한것... 아래는 aJax처리
    	
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/AskBoardGoodCheckAjax.ask",
    		data  : {idx : ${vo.idx}},
    		success:function(res) {
    			if(res == "0") alert("이미 좋아요 버튼을 클릭하셨습니다.");
    			else location.reload();
    		},
    		error : function() {
    			alert("전송 오류~~");
    		}
    	});
    }
    
    function goodCheckPlus() {
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/AskBoardGoodPlusMinus.ask",
    		data  : {
    			idx : ${vo.idx},
    			goodCnt : 1
    		},
    		success:function() {
    			location.reload();
    		}
    	});
    }
    
    function goodCheckMinus() {
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/AskBoardGoodPlusMinus.ask",
    		data  : {
    			idx : ${vo.idx},
    			goodCnt : -1
    		},
    		success:function() {
    			location.reload();
    		}
    	});
    }
    
    function goodSwitchCheck(count) {
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/AskBoardGoodPlusMinus.ask",
    		data  : {
    			idx : ${vo.idx},
    			goodCnt : count
    		},
    		success:function() {
    			location.reload();
    		}
    	});
    }
    
    function boardDelete() {
    	let ans = confirm("현 게시글을 삭제하시겠습니까?");
    	if(ans) location.href="${ctp}/AskBoardDelete.ask?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&nickName=${vo.nickName}";
    }
    
    // 댓글달기(aJax처리)
    function replyCheck() {
    	let content = $("#content").val();
    	if(content.trim() == "") {
    		alert("댓글을 입력하세요!");
    		$("#content").focus();
    		return false;
    	}
    	let query = {
    			boardIdx : ${vo.idx},
    			mid      : '${sMid}',
    			nickName : '${sNickName}',
    			content  : content,
    			hostIp   : '${pageContext.request.remoteAddr}'
    	}
    	
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/AskBoardReplyInput.ask",
    		data  : query,
    		success:function(res) {
    			if(res == "1") {
    				alert("댓글이 입력되었습니다.");
    				location.reload();
    			}
    			else {
    				alert("댓글이 입력 실패~~");
    			}
    		},
    		error : function() {
    			alert("전송 오류!!!");
    		}
    	});
    }
    
    // 댓글삭제
    function replyDelete(idx) {
    	let ans = confirm("선택한 댓글을 삭제하시겠습니까?");
      if(!ans) return false;
      
      $.ajax({
        type : 'post',
        url : '${ctp}/AskBoardReplyDelete.ask',
        data : {replyIdx : idx},
        success : function(res) {
          if(res == '1') {
           alert('댓글이 삭제되었습니다.');
           location.reload();
          }
          else {
           alert('댓글이 삭제되지 않았습니다.');
          }
        },
        error : function() {
          alert('전송실패~~');
        }
      });
    }
  </script>
    <style>
 	 @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@400;600&display=swap');
 	 *{
 	 font-family: 'Noto Serif KR', serif;
 	 }
	</style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2 class="text-center">문의 상세보기</h2>
  <br/>
  <table class="table table-borderless m-0 p-0">
  	<tr class="text-right">
  		<td colspan="4">
  			<c:if test="${sMid == vo.mid || sLevel == 0}">
        	<input type="button" value="수정" onclick="location.href='${ctp}/AskBoardUpdate.ask?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-light"/> &nbsp;
        	<input type="button" value="삭제" onclick="boardDelete()" class="btn btn-light"/>
      	</c:if>
  		</td>
  	</tr>
  </table>
  <table class="table table-bordered">
    <tr>
      <th>글쓴이</th>
      <td>${vo.nickName}</td>
      <th>글쓴날짜</th>
      <td>${fn:substring(vo.wDate,0,fn:length(vo.wDate)-2)}</td>
    </tr>
    <tr>
      <th>글제목</th>
      <td>${vo.title}</td>
      <th>조회수</th>
      <td>${vo.readNum}</td>
    </tr>
    <tr>
      <th>글내용</th>
      <td colspan="3" style="height:220px">${fn:replace(vo.content, newLine, "<br/>")}</td>
    </tr>
    <tr>
    	<td></td>
      <td colspan="3">이 글이 도움이 되었나요?
        <a href="javascript:goodCheck()">
          <c:if test="${sSw == '1'}"><font color="#f00" size="5">♥</font></c:if>
          <c:if test="${sSw != '1'}"><font color="#000" size="5">♥</font></c:if>
        </a>
    	</td>
    </tr>
  </table>
  <div class="text-center">
  	<c:if test="${flag == 'search'}"><input type="button" value="목록으로" onclick="location.href='${ctp}/AskBoardSearch.ask?search=${search}&searchString=${searchString}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-light"/></c:if>
    <c:if test="${flag == 'searchMember'}"><input type="button" value="목록으로" onclick="location.href='${ctp}/AskBoardSearchMember.ask?pag=${pag}&pageSize=${pageSize}';" class="btn btn-light"/></c:if>
    <c:if test="${flag != 'search' && flag != 'searchMember'}"><input type="button" value="목록으로" onclick="location.href='${ctp}/AdminAskBoardList.ad?pag=${pag}&pageSize=${pageSize}';" class="btn btn-light"/></c:if>
    &nbsp;
  </div>
  <p><br/></p>
  
  <!-- 댓글 리스트보여주기 -->
  <div class="container">
    <table class="table table-hover text-left">
      <tr>
        <th> &nbsp;작성자</th>
        <th>댓글내용</th>
        <th>작성일자</th>
        <th></th>
      </tr>
      <c:forEach var="replyVo" items="${replyVos}" varStatus="st">
        <tr>
          <td class="text-center">${replyVo.nickName}</td>
          <td class="text-center">${fn:replace(replyVo.content, newLine, "<br/>")}</td>
          <td class="text-center">${fn:substring(replyVo.wDate,0,10)}</td>
          <td>
             <c:if test="${sMid == replyVo.mid || sLevel == 0}">
              <a href="javascript:replyDelete(${replyVo.idx})" title="댓글삭제"><b>삭제</b></a>
            </c:if>
          </td>
        </tr>
      </c:forEach>
    </table>
  </div>

<c:if test="${sLevel == 0 || sLevel == 1}">
  <!-- 댓글 입력창 -->
  <form name="replyForm">
  	<table class="table tbale-center">
  	  <tr>
  	    <td style="width:85%" class="text-left">
  	      글내용 :
  	      <textarea rows="4" name="content" id="content" class="form-control"></textarea>
  	    </td>
  	    <td style="width:15%">
  	    	<br/>
  	      <p>작성자 : ${sNickName}</p>
  	      <p><input type="button" value="댓글달기" onclick="replyCheck()" class="btn btn-info btn-sm"/></p>
  	    </td>
  	  </tr>
  	</table>
  </form>
</c:if>
</div>
<p><br/></p>
</body>
</html>