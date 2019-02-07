<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script id="text/javascript">
function go_update() {// 저장
	document.formm.action = "PmServlet?command=board_update";
	document.formm.submit();
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
	        <input class="btn" type="button" value="저장" onClick="go_update()">
			<input class="cancel" type="button" value="취소" onclick='location.href="PmServlet?command=board_form"'>
	</form>
</article>