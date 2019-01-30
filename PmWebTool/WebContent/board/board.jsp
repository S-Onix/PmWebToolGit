<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<form action="PmServlet?command=board_form">
<div>
<h1>Board</h1>
</div>
<input type="button" value="게시물 EX" onclick="location='PmServlet?command=board_view_form'"><br>
<input type="button" value="글 쓰기" onclick="location='PmServlet?command=board_write_form'"><br>
</form>
</html>