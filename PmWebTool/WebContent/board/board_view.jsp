<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<article>
	<h2>1:1 고객 게시판</h2>
	<form name="formm" method="post">
		<table id="notice">
			<tr>
				<td>제목</td>
				<td>${boardVO.subject}</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><fmt:formatDate value="${boardVO.indate}" type="date" /></td>
			</tr>
			<tr>
				<th>질문내용</th>
				<td>${boardVO.content}
			</tr>
			<tr>
				<th>답변내용</th>
				<td>${boardVO.reply}
			</tr>
		</table>

		<div class="clear"></div>
		<div id="buttons" style="float: right">
			<input type="button" value="목록보기" class="submit" onclick="location.href='PmServlet?command=board'">
		</div>
	</form>
</article>