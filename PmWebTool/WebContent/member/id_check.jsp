<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
</head>
<form action="PmServlet?command=id_check_form">
<div>
<h1>Id Check Form</h1>
</div>
ID <input type=text name="id" value="" size="20">
 <input type=submit value="검색" class="submit"><br>
</form>
</html>
<%-- <script type="text/javascript">
	function idok() {
		opener.formm.id.value = "${id}"
		opener.formm.reid.value = "${id}"
		self.close();
	}
	function idcheck() {
		if (document.formm.id.value == "") {
			alert('아이디를 입력해주세요');
			document.formm.id.focus();
			return;
		}
</script>
</head>
<form method=post name=formm style="margin-right:0" action="NonageServlet?command=id_check_form">
ID <input type=text name="id" value="" size="20">
   <input type=submit value="검색" class="submit"><br>
        <div style="margin-top: 20px">
        <c:if test="${message == 1}">
        <script type="text/javascript">
        opener.document.formm.id.value="";
        </script>
        ${id}는 이미 사용중입니다
        </c:if>
        <c:if test="${message==-1}">
        ${id}는 사용 가능합니다
        <input type="button" value="사용" class="cancel" onclick="idok()">
        </c:if>
</div> --%>