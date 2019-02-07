<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<article>
<form name="frm" method="post" action="PmServlet?command=profile_form">
<div>

<h1>Profile</h1>
ID : ${loginMember.mid}<br>
E-Mail : ${loginMember.email}<br>
Name : ${loginMember.mname}


</div>
<input type="button" value="프로필 수정" onclick="location='PmServlet?command=profile_update_form'"><br>
<input type="button" value="회원탈퇴" onclick="location='PmServlet?command=index'"><br>
</form>
</article>