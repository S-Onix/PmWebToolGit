<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<h1>비밀번호 변경</h1>
	
	<form method="post" name="idForm">
		<c:choose>
			<c:when test="${id == null }">
				<span>아이디 입력 : <input type="text" placeholder="id 입력" name="id" onkeydown="idCheck()"/></span>
			</c:when>
			<c:otherwise>
				<span>아이디 입력 : <input type="text" placeholder="id 입력" name="id" onkeydown="idCheck()" value="${id}"/></span>
			</c:otherwise>
		</c:choose>

		 <br />
		 <c:if test="${exitId == 0 }">
		 	존재하지 않는 아이디 입니다.
		 </c:if>
		
		<c:choose>
		 	<c:when test="${exitId == 1}">
		 	<div id="checkPassword">
			<span><input type="password" id="newPw" name="password" placeholder="새 비밀번호 입력" /></span> <br />
			<span><input type="password" id="checkPw" placeholder="비밀번호 확인" onkeyup="checkPw2()"/></span>
			<div id="field"></div>
			</div>
			</c:when>
		 	<c:otherwise> 	
		 		
		 	</c:otherwise>
		 </c:choose>
	</form>
	
	<div id="correct" style="color:red; display:none;">
				일치합니다. <br>
				<input type="button" value="변경하기" onclick="changePw()"/>
	</div>
	<script>

		function idCheck(){
			if(window.event.keyCode == 13){
				document.idForm.action = "PmServlet?command=check_id";
				document.idForm.submit();
			}
		}
		
		function checkPw2(){
			var newPw = document.getElementById('newPw').value;
			var checkPw = document.getElementById('checkPw').value;
			if(newPw === checkPw){
				var div = document.createElement('div');
				div.innerHTML = document.getElementById('correct').innerHTML;
				document.getElementById('field').appendChild(div);
			}
		}
		
		function changePw(){
			document.idForm.action="PmServlet?command=change_pw";
			document.idForm.submit();
		}
	</script>
	</body>
	</html>