<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<article>
	<form name="frm" method="post" action="PmServlet?command=board_view_form">
		<table>
			<tr>
				<th>글쓴이</th>
				<th>제목</th>
				<th>내용</th>
			</tr>
			<c:forEach items="${listBoard}" var="boardVO">
				<tr>
					<td>${boardVO.mid}</td>
					<td>${boardVO.subject}</td>
					<td>${boardVO.content}</td>
				</tr>
			</c:forEach>
		</table>
		<div class="clear"></div>
		<div id="buttons" style="float: right">
			<input type="button" value="목록" onclick="location.href='PmServlet?command=board_form'">
		</div>
	</form>
</article>