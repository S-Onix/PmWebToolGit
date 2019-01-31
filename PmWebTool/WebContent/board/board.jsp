<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<article>
	<h2>1:1 고객 게시판</h2>
	<form name="formm" method="post">
		<table id="cartList">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>등록일</th>
				<th>답변 여부</th>
				<th>-</th>
			</tr>
			<c:forEach items="${boardList}" var="boardVO">
				<tr>
					<td>${boardVO.bseq}</td>
					<td><a href="PmServlet?command=board_view&bseq=${boardVO.bseq}"></a>${boardVO.subject}</td>
					<td><fmt:formatDate value="${boardVO.indate}" type="date" /></td>
					<td><c:choose>
							<c:when test="${boardVO.rep==1}">no</c:when>
							<c:when test="${boardVO.rep==2}">yes</c:when>
						</c:choose></td>
					<td><a href="PmServlet?command=board_delete&bseq=${boardVO.bseq}"></a>삭제</td>
				</tr>
			</c:forEach>
		</table>
		<div class="clear"></div>
		<div id="buttons" style="float: right">
			<input type="button" value="글 쓰기" class="submit" onclick="location.href='PmServlet?command=board_write_form'">
		</div>
	</form>
</article>