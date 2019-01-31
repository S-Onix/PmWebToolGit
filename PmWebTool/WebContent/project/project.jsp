<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header_login.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Project</title>

<script>

</script>

</head>


<form action="PmServlet?command=project_form">
<div>
<h1>Project</h1>
</div>

<c:forEach items="${projectList }" var="projectVO" >
	<div>
		<input type="button" value="${projectVO.pname }" class="cancel" onclick="location='PmServlet?command=project_detail_form&pseq=${projectVO.pseq}'"><br>	
	</div>
</c:forEach>
<div>
	<input type="text" />
	<button action="PmServlet?command=project_add" onclick="addProject()">프로젝트추가</button>
</div>


[Pop-up]<input type="button" value="프로젝트 생성" class="cancel" onclick="location='PmServlet?command=project_add_form'"><br> 
[Pop-up]<input type="button" value="프로젝트 수정" class="cancel" onclick="location='PmServlet?command=project_update_form'"><br>
<input type="button" value="프로젝트 삭제" class="cancel" onclick="location='PmServlet?command=project_form'"><br>
</form>
</html>