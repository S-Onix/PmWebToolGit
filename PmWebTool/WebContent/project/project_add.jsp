<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<form action="PmServlet?command=project_add_form">
<div>
<h1>Project Add</h1>
</div>
<input type="button" value="생성" onclick="location='PmServlet?command=project_form'"><br>
<input type="button" value="취소" onclick="location='PmServlet?command=project_form'"><br>
</form>
</html>