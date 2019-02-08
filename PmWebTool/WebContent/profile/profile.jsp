<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<script id="text/javascript">
function withdraw() { 
	var ret = prompt("탈퇴하시려면 '탈퇴'를 입력해주세요");
	if (ret == null){//취소 or 닫기
		self.close();
	}else (ret == "탈퇴");{//확인
		document.formm.action = "PmServlet?command=withdraw";
	}
	}
</script>
</head>
<article>
<form name="frm" method="post" action="PmServlet?command=profile_form">
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