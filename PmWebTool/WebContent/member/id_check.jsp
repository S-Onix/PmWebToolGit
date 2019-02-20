<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복 확인</title>
</head>
<div id="wrap">
<h1>ID 중복확인</h1>
<form method=post name=formm style="margin-right:0" action="PmServlet?command=id_check_form">
ID : <input type=text class="check-id" placeholder="아이디를 입력해주세요" name="mid" size="15">
        <input type=submit class="bt" value="검색">
        <br>
        <div style="margin: 0 auto;">
        <c:if test="${message == 1}">
        <script type="text/javascript">
        opener.document.formm.mid.value="";
        </script>
        <div class="check-text">
        <span class="m-id">${mid}</span>는 이미 사용중입니다
        </div>
        </c:if>
        <c:if test="${message==-1}">
        <div class="check-text">
        <span class="m-id">${mid}</span>는 사용 가능합니다
        </div>
        <a href="#" class="btn button" onclick="idok()">사용</a>
        <!-- <input type="button" value="사용" class="btn button" onclick="idok()"> -->
        </c:if>
        <a href="#" class="btn button" onclick="back()">취소</a>
        <!-- <input type="button" value="취소" class="btn button" onClick="back()"> -->       
</div>
</form>
</div>
<script type="text/javascript">
	function idok() {
		opener.formm.mid.value = "${mid}"
		opener.formm.reid.value = "${mid}"
		self.close();
	}
	
	function back() {
		self.close();
	}
</script>
<style type="text/css">
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
}

.btn.button:hover {
   color: rgba(255, 255, 255, 0.85);
   box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}

.bt{
    padding-top: 10px;
	padding: 1px 2px 1px 2px;
	height: 40px;
	width: 55px;
	border: 2px solid grey;
	border-radius: 10px;
	box-shadow: 3px 3px 2px #ccc;
	font-size: 16px;
	background-repeat: repeat-x;
	background-position: center center;
	background-color: white;
	color: grey;
	margin: 0 0 0 20px;
	cursor: pointer;
}

.check-id{
    width: 200;
    height: 25;
}
.m-id{
font-weight: bold;
}
.check-text{
	width: 60%;
    margin: 0 auto;
    margin-top: 50;
}

form {
 margin: 20px auto;
}
</style>
</html>