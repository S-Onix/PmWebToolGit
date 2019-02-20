<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<article>
<form name="frm" method="post">
<input type="hidden" name="tpage" value="${tpage}"/>
<input type="hidden" name="key" value="${key}"/>
<input type="hidden" name="mid" value="${boardVO.mid}"/>
<input type="hidden" name="mseq" value="${loginUser.mseq}"/>
<div class="post-all">
<h1 style="padding:7% 15% 0 15%;">프로필</h1>

<table class="post-wrap">
<thead>
				<tr>
					<th>아이디</th>
					<td>${loginUser.mid}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${loginUser.mname}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${loginUser.email}</td>
				</tr>
				</thead>
</table>
<br>
 <div id="buttons">
	<input type="button" class="btn" value="프로필 수정" onclick="location='PmServlet?command=profile_update_form'">
	<input type="button" class="btn" value="회원탈퇴" onclick="withdraw()">
	<br><br><br>
 </div>
</div>
<div class="post-all">
<table id="boardList" class="post-wrap">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>
				<c:choose>
					<c:when test="${boardListSize<=0}">
						<tr>
							<td width="100%" colspan="7" align="center" height="23">등록된
								게시물이 없습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${profileBoard}" var="boardVO">
							<tr>
								<td>${boardVO.bseq}<td>
								<a class="post-a" href="PmServlet?command=board_view_form&bseq=${boardVO.bseq}&tpage=${tpage}&key=${key}">${boardVO.subject}</a></td>
								<td>${boardVO.mid}</td>
								<td><fmt:formatDate value="${boardVO.indate}" type="date" /></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="6" style="text-align: center;">${paging}</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</thead>
		</table>
		</div>
		<br>
</form>

</article>
<script id="text/javascript">
function withdraw() { 
	var ret = confirm("정말 탈퇴하시겠습니까?");
	if (ret == true){
		document.frm.action = "PmServlet?command=withdraw";
		document.frm.submit();
		alert("탈퇴 완료");
	} else {
		alert("취소되었습니다");
	}
}
</script>
<style type="text/css">
form #buttons {
	margin: 20px 0 0 0;
}

form  .btn {
	height: 30px;
	width: 120px;
	border: 2px solid #369;
	border-radius: 10px;
	box-shadow: 3px 3px 2px #ccc;
	font-size: 16px;
	background-repeat: repeat-x;
	background-position: center center;
	background-color: white;
	color: #369;
	margin: 0 0 0 20px;
}

.header{
	background: #114f8f;
}

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

.post-all{
	padding: 0 15% 0 15%;
}
</style>
</html>