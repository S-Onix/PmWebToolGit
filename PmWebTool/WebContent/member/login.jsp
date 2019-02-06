<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<form method="post" action="PmServlet?command=login">
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
		
		<input type="submit" value="LOGIN" class="loginSubmit">
		
		<div class="loginSubButtonWrap">
			<input type="button" value="비밀번호 변경" class="loginSubButton"
				onclick="location='PmServlet?command=change_pw_form'"> |
			<input type="button" value="취소" class="loginSubButton"
				onclick="location='PmServlet?command=index'">
		</div>
	</div>
</form>
</html>