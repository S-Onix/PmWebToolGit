<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복 확인</title>
<script type="text/javascript">
	function idok() {
		opener.formm.mid.value = "${mid}"
		opener.formm.reid.value = "${mid}"
		self.close();
	}
</script>
<style type="text/css">
.check-submit{	
    border: none;
    background-color: black;
    color: white;
    width: 40;
    height: 25;
    font-size: 15;
    font-family: fantasy;
    cursor: pointer;
    margin-top: 20px;
}
.check-cancle{	
    border: none;
    background-color: black;
    color: white;
    width: 58;
    height: 38;
    font-size: 18;
    font-family: fantasy;
    cursor: pointer;
    margin-top: 60;
    margin-left: 250;
}
.check-id{
    width: 200;
    height: 25;
}
.m-id{
font-weight: bold;
}
.check-text{
	width: 60%;
    margin: 0 auto;
    margin-top: 50;
}
</style>
</head>
<body>
<div id="wrap">
<h1>ID 중복확인</h1>
<form method=post name=formm style="margin-right:0" action="PmServlet?command=id_check_form">
ID : <input type=text class="check-id" placeholder="Check ID" name="mid" value="" size="15">
        <input type=submit value="검색" class="check-submit"><br>
        <div style="margin: 0 auto;">
        <c:if test="${message == 1}">
        <script type="text/javascript">
        opener.document.formm.mid.value="";
        </script>
        <div class="check-text">
        <span class="m-id">${mid}</span>는 이미 사용중입니다
        </div>
        </c:if>
        <c:if test="${message==-1}">
        <div class="check-text">
        <span class="m-id">${mid}</span>는 사용 가능합니다
        </div>
        <input type="button" value="사용" class="check-cancle" onclick="idok()">
        </c:if>
</div>
</form>
</div>
</body>
</html>