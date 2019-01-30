<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
</head>
  <form id="join" action="PmServlet?command=join_form" method="post">
  <article>
    <h2>회원가입</h2>
      <fieldset>
        <label>ID</label>
        <input type="text" name="name" size="20">
        [Pop-up] <input type="button" value="중복 체크"  class="dup" onclick="location='PmServlet?command=id_check_form'"><br>
        <label>PW</label> 
        <input type="password" name="pw"><br>
        <label>NAME</label> 
        <input type="text" name="name"><br>
        <label>E-MAIL</label>
        <input type="text" name="email" size="32"><br>        
      </fieldset>
      <div id="buttons">
        <input type="button" value="가입" onclick="location='PmServlet?command=login_form'"> 
        <input type="reset"  value="취소" onclick="location='PmServlet?command=index'">
      </div>
  </article>
    </form>
</html>