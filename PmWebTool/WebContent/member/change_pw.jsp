<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<form action="PmServlet?command=change_pw_form">
<div>
<h1>Change Pw</h1>
</div>
New Pw <input type="password" name="password" size="20"><br>
Check Pw <input type="password" name="password" size="20"><br>
<input type="button" value="변경" onclick="location='PmServlet?command=login_form'"><br>
<input type="button" value="취소" onclick="location='PmServlet?command=login_form'"><br>
</form>
</html>