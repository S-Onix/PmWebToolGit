<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script id="text/javascript">
	function profile_update() {// 저장
		document.formm.action = "PmServlet?command=profile_update";
		document.formm.submit();
	}
</script>
<article>
	<h2>프로필 수정</h2>
	<form name="formm" method="post">
	<input type="hidden" name="mseq" value="${loginMember.mseq}"/>
		<table>
			<tr>
				<th>ID</th>
				<td colspan="20"><input type="text" name="mid" value="${loginMember.mid}" /></td>
			
			</tr>
			<tr>
				<th>E-Mail</th>
				<td colspan="20"><input type="text" name="email" value="${loginMember.email}" /></td>
			</tr>
			<tr>
				<th>Name</th>
				<td colspan="20"><input type="text" name="mname" value="${loginMember.mname}" /></td>
			</tr>
		</table>
		<input class="btn" type="button" value="저장" onclick="profile_update()">
		<input class="btn" type="button" value="취소"
			onclick="location='PmServlet?command=profile_form'">
	</form>
</article>