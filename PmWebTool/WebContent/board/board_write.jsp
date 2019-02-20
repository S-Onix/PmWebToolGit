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

.header{
	background: #114f8f;
}
#buttons{
	padding-top: 10px;
}
.btn{
	padding: 1px 2px 1px 2px;
	height: 40px;
	width: 130px;
	border: 2px solid #369;
	border-radius: 10px;
	box-shadow: 3px 3px 2px #ccc;
	font-size: 16px;
	background-repeat: repeat-x;
	background-position: center center;
	background-color: white;
	color: #369;
	margin: 0 0 0 20px;
	cursor: pointer;
}
.post-all{
	padding: 5% 15% 1% 15%;
}
.driver{
	width: 80px;
    height: 5px;
    background-color: #34679a; 
    margin-top: 5px;
    margin-bottom: 10px;
}
fieldset{
	border-color: #cdd9e6;
	font-size: 20px;
}
.text{
	font-size: 17px;
}
textarea{
	height: 150px;
	width: 90%;
}
#title-text{
	width: 90%;
}
.text-wrap{
	padding: 5px 15px 10px 15px;
}
label{
    padding-left: 15px;
}

</style>
<article>
	<form name="formm" method="post" action="PmServlet?command=board_write">
	<div class="post-all">
	<div class="h2-wrap">
	<h2 style="margin: 0 0 3 0;">글 쓰기</h2>
	</div>
	<div class="driver">
		</div>
		<fieldset>
			<label>작성자</label>
			<div class="text-wrap">
			<input type="text" class="text" value="${loginUser.mid}" name="mid" disabled/>
			</div>
			<label>제목</label> 
			<div class="text-wrap">
			<input type="text" id="title-text" class="text" name="subject" size="80">
			</div>
			<label>내용</label>
			<div class="text-wrap">
			<textarea rows="8" cols="80" class="text" name="content"></textarea>
			</div>
		</fieldset>
		<div class="clear"></div>
		<div id="buttons" style="float: right">	
			<a class="btn" onclick="go_write()">글쓰기</a>
			<a class="btn" onclick='location.href="PmServlet?command=board_form"'>취소</a>
		</div>
	</div>
	</form>
</article>