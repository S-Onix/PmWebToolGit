<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<article>
	<h1 style="padding: 7% 15% 0 15%;">게시판</h1>
	<form name="frm" method="post">
	<div class="post-all">
	<input type="hidden" name="tpage" value="${tpage}"/>

				
				<div>
				<span style="font-size: 20px;">작성자</span>
				<input type="text" name="key"> 
				
				<a class="a-style" onClick="go_search()">검색</a>
			    <a class="a-style" onClick="go_total()">전체보기</a>			
				</div>
				
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
						<c:forEach items="${listBoard}" var="boardVO">
							<tr>
								<td>${boardVO.bseq}<td>
								<a class="title-style" href="PmServlet?command=board_view_form&bseq=${boardVO.bseq}&tpage=${tpage}&key=${key}">${boardVO.subject}</a></td>
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
		<div class="clear"></div>
		<div id="buttons" style="float: right">
			<a class="submit a-style"
				onclick="location.href='PmServlet?command=board_write_form'">글쓰기</a>
		</div>
	</div>
	</form>
</article>
<script id="text/javascript">
   function go_search(key) {
		if (document.frm.key.value == "") {
			alert("작성자를 입력해주세요");
			document.frm.key.focus();
		} else {
			document.frm.action = "PmServlet?command=board_form&tpage=" + 1;
			document.frm.submit();
		}
	}
	
	function go_total() {// 전체보기
		document.frm.action = "PmServlet?command=board_form&tpage=1&key=";
		document.frm.submit();
	}
</script>
<style type="text/css">

 /* a tag 효과 */
@import url(https://fonts.googleapis.com/css?family=Ubuntu:700);

.a-style {
  font-family: 'Ubuntu', sans-serif;
  display: inline-block;
  text-decoration: none;
  color: #584E4A;
  border: none;
  background: none;
  cursor: pointer;
}

.a-style::after {
  content: '';
  display: block;
  width: 0;
  height: 2px;
  background: #000;
  transition: width .3s;
}

.a-style:hover::after {
  width: 100%;
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
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}

table.post-wrap tbody th {
	width: 150px;
	padding: 10px;
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
.post-all{
	padding: 0 15% 0 15%;
}

</style>
</body>
</html>