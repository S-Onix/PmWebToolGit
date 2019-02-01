<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복 확인</title>
<style type="text/css">
body {
	background-color: #B96D85;
	font-family: Verdana;
}

#wrap {
	margin: 0 20px;
}

h1 {
	font-family: "Times New Roman", Times, serif;
	font-size: 45px;
	color: #CCC;
	font-weight: normal;
}

input[type=button], input[type=submit] {
	float: right;
}
</style>
<script type="text/javascript">
	function idcheck() {
		opener.formm.mid.value = "${mid}"
		opener.formm.reid.value = "${mid}"
		self.close();
	}
</script>
</head>
<body>
<div id="wrap">
<h1>비밀번호 변경</h1>
<form method=post name=formm style="margin-right:0" action="PmServlet?command=change_pw_form">
User ID <input type=text name="mid" value="" size="15">
        <input type=submit value="검색" class="submit"><br>
        <div style="margin-top: 20px">
        <c:if test="${message == 1}">
        <script type="text/javascript">
        opener.document.formm.mid.value="";
        </script>
        ${mid}는 이미 사용중입니다
        </c:if>
        <c:if test="${message==-1}">
        ${mid}는 사용 가능합니다
        <input type="button" value="사용" class="cancel" onclick="idok()">
        </c:if>
</div>
</form>
</div>
</body>
</html>