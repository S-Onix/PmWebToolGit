<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script id="text/javascript">
function withdraw() { 
	var ret = confirm("정말 탈퇴하시겠습니까?");
	if (ret == true){
		document.frm.action = "PmServlet?command=withdraw";
		document.frm.submit();
		alert("탈퇴 완료");
	} else {
		alert("취소되었습니다");
	}
}
</script>
</head>
<article>
<form name="frm" method="post">
	<input type="hidden" name="mseq" value="${loginMember.mseq}"/>
<div>
<h1>Profile</h1>
ID : ${loginMember.mid}<br>
E-Mail : ${loginMember.email}<br>
Name : ${loginMember.mname}
</div>
<br>
<input type="button" value="프로필 수정" onclick="location='PmServlet?command=profile_update_form'">
<input type="button" value="회원탈퇴" onclick="withdraw()">
</form>
</article>
</html>