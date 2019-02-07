<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script id="text/javascript">
function go_update_form(bseq) {// 수정화면으로
	var theForm = document.frm;
	theForm.action = "PmServlet?command=board_update_form"
			+ "&bseq=" + bseq;
	theForm.submit();
}
</script>
<article>
	<form name="frm" method="post" action="PmServlet?command=board_view_form">
		<table>
			<tr>
				<td>제목</td>
				<td>${boardVO.subject}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${boardVO.content}</td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td>${boardVO.mid}</td>
			</tr>
		</table>
		<c:if test="${mid == mid}">
			<input class="btn" type="button" value="수정" onClick="go_update_form('${boardVO.bseq}')"> 
			<input type="button" value="삭제" onclick="location.href='PmServlet?command=board_delete&bseq=${boardVO.bseq}'">
		</c:if>
			<input type="button" value="목록" onclick="location.href='PmServlet?command=board_form'">
	</form>
</article>