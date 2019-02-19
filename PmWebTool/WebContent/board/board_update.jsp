<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<article>
	<form name="formm" method="post" action="PmServlet?command=board_view_form&tpage=${tpage}&key=${key}">
	<input type="hidden" name="bseq" value="${boardVO.bseq}"/>
	<input type="hidden" name="tpage" value="${tpage}"/>
	<input type="hidden" name="key" value="${key}"/>
	<div>
	<h2>글 수정</h2>
		<table class="post-wrap">
		<tr>
		   <th>제목</th>
		   <td colspan="10">
		   <input type="text" name="subject" value="${boardVO.subject}" />
		   </td>
		</tr>
		<tr>
		    <th>내용</th>
	     	<td colspan="20">
	    	<input type="text" name="content" value="${boardVO.content}" />
		    </td>
		</tr>
		</table>
	</div>
		<br>
	 <input class="btn" type="button" value="수정" onClick="board_update()">
     <input class="cancel" type="button" value="취소" onclick="back()">
	 </form>
</article>
<script id="text/javascript">
function board_update(tpage, key) {// 저장
	if (document.formm.subject.value == "") {
		alert("제목을 입력해주세요");
		document.formm.subject.focus();
	} else if (document.formm.content.value == ""){
		alert("내용을 입력해주세요");
		document.formm.content.focus();
	} else {
 	document.formm.action="PmServlet?command=board_update"
 	document.formm.submit();
	alert("수정 완료");
	}
}

function go_delete(bseq) { 
	var ret = confirm("삭제하시겠습니까?");
	if (ret == true){
		document.frm.action = "PmServlet?command=board_delete&bseq=" + ${boardVO.bseq};
		alert("삭제 완료");
	} else {
		alert("취소되었습니다");
	}
}

function back() {
	history.go(-1);
}
</script>
<style type="text/css">
table.post-wrap {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
}

table.post-wrap thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}

table.post-wrap tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}

table.post-wrap td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
 /* a tag 효과 */
 
.post-a:link {
	color: blue;
	text-decoration: none;
}

.post-a:visited {
	text-decoration: none;
}

.post-a:hover {
	text-decoration: underline;
}  
</style>
</html>