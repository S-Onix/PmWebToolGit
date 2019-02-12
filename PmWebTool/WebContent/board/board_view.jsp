<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script id="text/javascript">
	function go_update_form(bseq) {// 수정화면으로
		var theForm = document.frm;
		theForm.action = "PmServlet?command=board_update_form" + "&bseq="
				+ bseq;
		theForm.submit();
	}
	
	function go_delete() { 
		var ret = confirm("삭제하시겠습니까?");
		if (ret == true){
			document.frm.action = "PmServlet?command=board_delete&bseq=${boardVO.bseq}";
			document.frm.submit();
			alert("삭제 완료");
		} else {
			alert("취소되었습니다");
		}
	}
	
	function go_list(tpage, key){
		document.frm.action = "PmServlet?command=board_form&tpage=" + tpage + "&key=" + key;
		document.frm.submit();
	}
</script>
<article>
	<form name="frm" method="post">
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

		<c:choose>
			<c:when test="${checkId == boardVO.mid}">
				<input class="btn" type="button" value="수정"
					onClick="go_update_form('${boardVO.bseq}')">
				<input type="button" value="삭제"
				    onClick="go_delete()">
				<input type="button" value="목록"
					onclick="go_list('${tpage}', '${key }')">
			</c:when>
			<c:otherwise>
				<input type="button" value="목록"
					onclick="go_list('${tpage}', '${key }')" >
			</c:otherwise>
		</c:choose>
	</form>
</article>