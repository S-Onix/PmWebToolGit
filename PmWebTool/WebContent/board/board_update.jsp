<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script id="text/javascript">
function board_update() {// 저장
	if (document.formm.subject.value == "") {
		alert("제목을 입력해주세요");
		document.formm.subject.focus();
	} else if (document.formm.content.value == ""){
		alert("내용을 입력해주세요");
		document.formm.content.focus();
	} else {
	document.formm.action = "PmServlet?command=board_update";
	document.formm.submit();
	alert("수정 완료");
	}
}

function back() {
	history.go(-1);
}
</script>
<article>
	<h2>글 수정</h2>
	<form name="formm" method="post">
	<input type="hidden" name="bseq" value="${boardVO.bseq}"/>
		<table>
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
	        <input class="btn" type="button" value="수정" onClick="board_update()">
			<%-- <input class="cancel" type="button" value="취소" onclick='location.href="PmServlet?command=board_view_form&bseq=" + "${boardVO.bseq}"'>
	 --%>
	 <input class="cancel" type="button" value="취소" onclick="back()">
	 </form>
</article>