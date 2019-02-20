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
<style>
 /* a tag 효과 */
 
@import url(https://fonts.googleapis.com/css?family=Ubuntu:700);

.a-style {
font-family: 'Ubuntu', sans-serif;
  display: inline-block;
  text-decoration: none;
  color: #584E4A;
  border: none;
  background: none;
  cursor: pointer;
}

.a-style::after {
  content: '';
  display: block;
  width: 0;
  height: 2px;
  background: #000;
  transition: width .3s;
}

.a-style:hover::after {
  width: 100%;
}
</style>
<article>
	<form name="formm" method="post" action="PmServlet?command=board_write">
	<h2>글 쓰기</h2>
		<fieldset>
			<label>제목</label> 
			<input type="text" name="subject" size="80">
			<br><br>
			<label>작성자</label>
			<input type="text" value="${loginUser.mid}" name="mid" disabled/>
			<br><br>
			<label>내용</label><br>
			<textarea rows="8" cols="80" name="content"></textarea>
			<br>
		</fieldset>
		<div class="clear"></div>
		<div id="buttons" style="float: right">	
			<a class="a-style" onclick="go_write()">Write</a>
			<a class="a-style" onclick='location.href="PmServlet?command=board_form"'>cancle</a>
		</div>
	</form>
</article>