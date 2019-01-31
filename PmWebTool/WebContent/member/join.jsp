<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
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
  <article>
    <h2>회원가입</h2>
      <fieldset>
        <label>ID</label>
        <input type="text" name="mid" size="20">
        <input type="hidden"    name="reid">
        <input type="button" value="중복 체크"  class="dup" onclick="idcheck()"><br>
        <label>PW</label> 
        <input type="password" name="password"><br>
        <label>NAME</label> 
        <input type="text" name="mname"><br>
        <label>E-MAIL</label>
        <input type="text" name="email" size="32"><br>        
      </fieldset>
      <div id="buttons">
<!--    <input type="button" value="가입" onclick="location='PmServlet?command=join'">  -->
        <input type="button" value="회원가입"   class="submit" onclick="go_save()">
        <input type="reset"  value="취소" onclick="location='PmServlet?command=index'">
      </div>
  </article>
    </form>
</html>