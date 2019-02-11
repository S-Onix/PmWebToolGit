<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script id="text/javascript">
	function go_search(key) {
		if (document.frm.key.value == "") {
			alert("작성자를 입력해 주세요.");
			document.frm.key.focus();
		} else {
			document.frm.action = "PmServlet?command=board_form";
			document.frm.submit();
		}
	}

	function go_total() {// 전체보기
		document.frm.action = "PmServlet?command=board_form&tpage=1&key=";
		document.frm.submit();
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
</style>
<article>
	<h1>게시판</h1>
	<form name="frm" method="post" action="PmServlet?command=board_form">
		<table>
			<tr>
				<td width="640">작성자<input type="text" name="key"> 
				<input class="btn" type="button" name="btn_search" value="검색" onClick="go_search()"> 
			    <input class="btn" type="button" name="btn_total" value="전체보기" onClick="go_total()">
				</td>
			</tr>
		</table>
		<table id="boardList" class="post-wrap">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>
				<c:choose>
					<c:when test="${boardListSize<=0}">
						<tr>
							<td width="100%" colspan="7" align="center" height="23">등록된
								게시물이 없습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${listBoard}" var="boardVO">
							<tr>
								<td>${boardVO.bseq}<td>
								<a href="PmServlet?command=board_view_form&bseq=${boardVO.bseq}">${boardVO.subject}</a></td>
								<td>${boardVO.mid}</td>
								<td><fmt:formatDate value="${boardVO.indate}" type="date" /></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="6" style="text-align: center;">${paging}</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</thead>
		</table>
		<div class="clear"></div>
		<div id="buttons" style="float: right">
			<input type="button" value="글 쓰기" class="submit"
				onclick="location.href='PmServlet?command=board_write_form'">
		</div>
	</form>
</article>