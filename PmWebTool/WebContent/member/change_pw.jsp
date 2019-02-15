<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script id="text/javascript">
	function idCheck() {
		if (window.event.keyCode == 13) {
			document.idForm.action = "PmServlet?command=check_id";
			document.idForm.submit();
		}
	}
	
	function changePw() {
 		var newPw = document.getElementById('newPw').value;
		var checkPw = document.getElementById('checkPw').value;
		if (newPw === checkPw) {
			document.idForm.action = "PmServlet?command=change_pw";
			document.idForm.submit();
			alert("변경 완료");
		} else {
			alert("비밀번호가 다릅니다");
		}
	}

	function back() {
		document.idForm.action = "PmServlet?command=login_form";
		document.idForm.submit();
	}
</script>
<h1>비밀번호 변경</h1>
<form method="post" name="idForm">
	<c:choose>
		<c:when test="${id == null }">
			<span>ID : <input type="text" placeholder="ID 입력" name="id" onkeydown="idCheck()" /></span>
		</c:when>
		<c:otherwise>
			<span>ID : <input type="text" placeholder="ID 입력" name="id" onkeydown="idCheck()" value="${id}" /></span>
		</c:otherwise>
	</c:choose>
	<br>
	<c:if test="${exitId == 0 }">
          존재하지 않는 아이디 입니다
       </c:if>
	<c:choose>
		<c:when test="${exitId == 1}">
          ${id}님 변경할 비밀번호를 입력해주세요
          <div id="checkPassword">
				<span><input type="password" id="newPw" name="password" placeholder="새 비밀번호 입력" /></span> 
				<br>
				<span><input type="password" id="checkPw" placeholder="비밀번호 확인"/></span>
			</div>
		</c:when>
		<c:otherwise>

		</c:otherwise>
	</c:choose>
	<input type="button" name="change" value="변경" onClick="changePw()"><br>
	<input type="button" name="cancel" value="취소" onClick="back()">
</form>
</body>
</html>