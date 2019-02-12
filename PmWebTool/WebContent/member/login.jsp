<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<script id="text/javascript">
function go_login() { 
	if (document.frm.mid.value == "") {
		alert("아이디를 입력해주세요");
		document.frm.mid.focus();
	} else if (document.frm.password.value == "") {
		alert("비밀번호를 입력해주세요");
		document.frm.password.focus();
	} else { 
	document.frm.action = "PmServlet?command=login";
	document.frm.submit();
 }
}
</script>
<html>
<head>
</head>
<form name="frm" method="post">
	<div class="loginWrap">
		<h1 class="longinTitle">LOGIN</h1>
		<div>
			<div class="loginInputBoxWrap">
				<input type="text" name="mid" size="20" class="loginInputBox" placeholder="아이디 입력"> 
			</div>
			<div class="loginInputBoxWrap">
				<input type="password" name="password" size="20" class="loginInputBox" placeholder="비밀번호 입력">
			</div>
			<div class="saveId">
				<input type="checkbox" name="savemid"> SAVE ID
			</div>
		</div>
		
		<!-- <input type="submit" value="LOGIN" class="loginSubmit" onclick="location='PmServlet?command=login()'"> -->		
		<input type="button" value="LOGIN" class="loginSubmit" onclick="go_login()">
		<div class="loginSubButtonWrap">
			<input type="button" value="비밀번호 변경" class="loginSubButton" onclick="location='PmServlet?command=change_pw_form'"> |
			<input type="button" value="취소" class="loginSubButton" onclick="location='PmServlet?command=index'">
		</div>
	</div>
</form>
</html>