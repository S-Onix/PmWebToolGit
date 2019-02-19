<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<article>
	<form name="formm" method="post">
	<input type="hidden" name="mseq" value="${loginUser.mseq}" />
	<div>
	<h2>프로필 수정</h2>
		<table class="post-wrap">
			<tr>
				<th>ID</th>
				<td colspan="20"><input type="text"
					value="${loginUser.mid}" name="mid" disabled/>
					 <input type="hidden" name="mid" value="${loginUser.mid }" >
					 </td>
			</tr>
			<tr>
				<th>Name</th>
				<td colspan="20"><input type="text" name="mname"
					value="${loginUser.mname}" /></td>
			</tr>
			<tr>
				<th>E-Mail</th>
				<td colspan="20"><input type="email" name="email"
					value="${loginUser.email}" /></td>
			</tr>
		</table>
	</div>
	<br>
		<input class="btn" type="button" value="저장" onclick="profile_update()">
		<input class="btn" type="button" value="취소" onclick="location='PmServlet?command=profile_form'">
	</form>
</article>
<script id="text/javascript">
	function profile_update() {// 저장
		if (document.formm.mname.value == "") {
			alert("이름을 입력해주세요");
			document.formm.mname.focus();
		} else if (document.formm.email.value == "") {
			alert("이메일을 입력해주세요");
			document.formm.email.focus(); 
		} else {
			document.formm.action = "PmServlet?command=profile_update";
			document.formm.submit();
			alert("프로필 수정 완료");
		}
	}
</script>
<style type="text/css">
table.post-wrap {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
}

table.post-wrap thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}

table.post-wrap tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}

table.post-wrap td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
 /* a tag 효과 */
 
.post-a:link {
	color: blue;
	text-decoration: none;
}

.post-a:visited {
	text-decoration: none;
}

.post-a:hover {
	text-decoration: underline;
}  
</style>
</html>