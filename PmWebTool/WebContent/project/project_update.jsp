<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<form action="PmServlet?command=project_update_form">
<div>
<h1>Project Update</h1>
</div>
<input type="button" value="저장" onclick="location='PmServlet?command=project_form'"><br>
<input type="button" value="취소" onclick="location='PmServlet?command=project_form'"><br>
</form>
</html>