<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<form method="post" action="PmServlet?command=login">
<h1>Log in</h1><br>
ID : <input type="text" name="mid" size="20"><br>
PW : <input type="password" name="password" size="20"><br>
<input type="submit" value="로그인" class="submit"><br>
<!-- <input type="button" value="로그인" class="submit" onclick="location='PmServlet?command=project_form'"><br> -->
[Pop-up] <input type="button" value="비밀번호 변경" class="cancel" onclick="location='PmServlet?command=change_pw_form'"><br>
<input type="button" value="취소" onclick="location='PmServlet?command=index'">
</form>
</html>