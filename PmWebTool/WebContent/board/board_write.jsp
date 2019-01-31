<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<article>
	<h2>글 쓰기</h2>
	<form name="formm" method="post" action="PmServlet?command=board_form">
		<fieldset>
			<label>Title</label> 
			<input type="text" name="subject" size="80"><br>
			<label>Content</label>
			<textarea rows="8" cols="65" name="content"></textarea><br>
		</fieldset>
		<div class="clear"></div>
		<div id="buttons" style="float: right">	
			<input type="submit" value="쓰기" class="submit">
			<input type="button" value="취소" class="cancel" onclick='location.href="PmServlet?command=board_form"'>
		</div>
	</form>
</article>