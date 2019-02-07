<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<script id="text/javascript">
function go_save() {
	if (document.formm.mid.value == "") {
		alert("아이디를 입력하세요");
		document.formm.mid.focus();
	} else if (document.formm.mid.value != document.formm.reid.value) {
		alert("중복확인을 확인하세요");
		document.formm.mid.focus();
	} else if (document.formm.password.value == "") {
		alert("비밀번호를 입력하세요");
		document.formm.password.focus();
	} else if (document.formm.mname.value == "") {
		alert("이름을 입력하세요");
		document.formm.mname.focus();
	} else if (document.formm.email.value == "") {
		alert("이메일을 입력하세요");
		document.formm.email.focus();
	} else {
		document.formm.action = "PmServlet?command=join";
		document.formm.submit();
	}
}

function idcheck() {
	if (document.formm.mid.value == "") {
		alert('아이디를 입력해주세요');
		document.formm.mid.focus();
		return;
	}
	var url = "PmServlet?command=id_check_form&mid="
			+ document.formm.mid.value;
	window.open(url, "_blank_1",
			"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=550,"
					+ " height=300, top=300, left=300, ");
}
</script>
<html>
<head>
<meta charset="UTF-8">
</head>
  <form id="join" action="PmServlet?command=join" method="post" name="formm">
  	<div class="joinWrap">
	  <article>
	    <h1 class="joinTitle">JOIN</h1>
	      <fieldset class="joinFiledset">
		      <div class="joinInputBoxWrap">
		      	<div class="joinIdWrap">
			      <input type="text" name="mid" size="20" class="joinInputBox" placeholder="아이디 입력">
			      <div class="duplicateCheck">
			      	<i class="fas fa-user-check fa-2x"></i>
			      </div>
			    </div>
		      </div>
		      <div class="joinInputBoxWrap">
		        <input type="password" name="password" class="joinInputBox" placeholder="비밀번호 입력">
		      </div>
		      <div class="joinInputBoxWrap">
		        <input type="text" name="mname" class="joinInputBox" placeholder="이름 입력">
		      </div>
		      <div class="joinInputBoxWrap">
		        <input type="text" name="email" size="32" class="joinInputBox" placeholder="이메일 입력">     
		      </div>
	      </fieldset>
	      
          <input type="button" value="JOIN" class="joinSubmit" onclick="go_save()">
	        
	      <div class="joinSubButtonWrap">
	        <input type="reset"  value="취소" onclick="location='PmServlet?command=index'" class="joinSubButton">
	      </div>
	  </article>
	 </div>
   </form>
</html>