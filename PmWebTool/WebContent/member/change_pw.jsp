<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	function idcheck() {
		opener.formm.mid.value = "${mid}"
		opener.formm.reid.value = "${mid}"
	}

	function changepw() {
		var theForm = document.formm;
		theForm.action = "PmServlet?command=change_pw";
		theForm.submit();
	}
</script>
</head>
<body>
	<h1>비밀번호 변경</h1>
	<form method=post name=formm action="PmServlet?command=change_pw_form">
		<c:choose>
ID <input type=text name="mid" value="" size="15">
			<input type=submit value="검색" class="submit">
			<c:when test="${checkId == memberVO.mid}">
	새 비밀번호 : <input type="Password" name="newPw" />
				<input type="submit" value="변경" />
			</c:when>
			<c:otherwise>
존재하지 않는 ID입니다
</c:otherwise>
		</c:choose>
	</form>