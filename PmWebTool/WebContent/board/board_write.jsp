<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script id="text/javascript">
function go_write() {
	if (document.formm.subject.value == "") {
		alert("제목을 입력해주세요");
		document.formm.subject.focus();
	} else if (document.formm.content.value == "") {
		alert("내용을 입력해주세요");
		document.formm.content.focus();
	} else {
		document.formm.action = "PmServlet?command=board_write";
		document.formm.submit();
		alert("작성 완료");
	}
}
</script>
<article>
	<h2>글 쓰기</h2>
	<form name="formm" method="post" action="PmServlet?command=board_write">
		<fieldset>
			<label>Title</label> 
			<input type="text" name="subject" size="80"><br>
			<label>Content</label>
			<textarea rows="8" cols="65" name="content"></textarea><br>
		</fieldset>
		<div class="clear"></div>
		<div id="buttons" style="float: right">	
			<input type="button" value="쓰기" class="submit" onclick="go_write()">
			<input type="button" value="취소" class="cancel" onclick='location.href="PmServlet?command=board_form"'>
		</div>
	</form>
</article>