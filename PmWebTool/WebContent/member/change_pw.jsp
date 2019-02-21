<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script id="text/javascript">
	function idCheck() {
	    if(window.event.keyCode == 13) {
			document.idForm.action = "PmServlet?command=check_id";
			document.idForm.submit();
		}
	}
	
	function changePw() {
		if (document.idForm.id.value == "") {
			alert("아이디를 입력해주세요")
		} else {
 		var newPw = document.getElementById('newPw').value;
		var checkPw = document.getElementById('checkPw').value;
        if (document.idForm.newPw.value == "") {
			alert("비밀번호를 입력해주세요");
		} else if (document.idForm.checkPw.value == "") {
			alert("비밀번호를 입력해주세요");
		} else if (newPw === checkPw) {
			document.idForm.action = "PmServlet?command=change_pw";
			document.idForm.submit();
			alert("변경 완료");
		} else {
			alert("비밀번호가 다릅니다");
		}
		}
	}

	function back() {
		document.idForm.action = "PmServlet?command=login_form";
		document.idForm.submit();
	}
</script>
<style>

.btn {
   /* 줄어드는 모션 */
   -webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
   display: block;
   margin: 20px auto;
   max-width: 40px;
   text-decoration: none;
   border-radius: 4px;
   padding: 20px 30px;
   text-align: center;
}

.btn.button {
   color: rgba(30, 22, 54, 0.6);
   box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
   cursor: pointer;
}
 
.btn.button:hover { 
   color: rgba(255, 255, 255, 0.85);
   box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}
ul {
    list-style:none;
    margin:0;
    padding:0;
}

li {
    margin: 0 0 0 35;
    padding: 0 0 0 0;
    border : 0;
    float: left;
}
</style>
<h1>비밀번호 변경</h1>
<form method="post" name="idForm">
	<c:choose>
		<c:when test="${id == null }">
			<span>ID : <input type="text" placeholder="ID를 입력하고 Enter를 눌러주세요" name="id" size="30" onkeypress="idCheck()" /></span>
		</c:when>
		<c:otherwise>
			<span>ID : <input type="text" placeholder="ID를 입력하고 Enter를 눌러주세요" name="id" size="30" onkeypress="idCheck()" value="${id}" /></span>
		</c:otherwise>
	</c:choose>
	<br>
	<c:if test="${exitId == 0 }">
          존재하지 않는 ID 입니다
          <br>
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
	<ul>
	<li><a class="btn button" onClick="changePw()">변경</a></li>
	<li><a class="btn button" onClick="back()">취소</a></li>
	</ul>

</form>
</body>
</html>