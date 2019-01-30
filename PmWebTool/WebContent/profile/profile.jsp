<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<form action="PmServlet?command=profile_form">
<div>
<h1>Profile</h1>
</div>
[Pop-up]<input type="button" value="프로필 수정" onclick="location='PmServlet?command=profile_update_form'"><br>
<input type="button" value="회원탈퇴" onclick="location='PmServlet?command=index'"><br>
</form>
</html>