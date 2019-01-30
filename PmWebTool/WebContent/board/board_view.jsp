<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<form action="PmServlet?command=board_view_form">
<div>
<h1>Board View</h1>
</div>
<input type="button" value="수정" onclick="location='PmServlet?command=board_update_form'">[작성자]<br>
<input type="button" value="삭제" onclick="location='PmServlet?command=board_form'">[작성자]<br>
<input type="button" value="목록" onclick="location='PmServlet?command=board_form'"><br>
</form>
</html>