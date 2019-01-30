<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<form action="PmServlet?command=profile_update_form">
<div>
<h1>Profile Update</h1>
</div>
<input type="button" value="저장" onclick="location='PmServlet?command=profile_form'"><br>
<input type="button" value="취소" onclick="location='PmServlet?command=profile_form'"><br>
</form>
</html>