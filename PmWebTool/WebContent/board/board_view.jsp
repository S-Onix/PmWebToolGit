<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<article>
	<form name="frm" method="post">
	<input type="hidden" name="tpage" value="${tpage}"/>
	<input type="hidden" name="key" value="${key}"/>
		<table class="post-wrap">
		<thead>
			<tr>
				<th>제목</th>
				<td>${boardVO.subject}</td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td>${boardVO.mid}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${boardVO.content}</td>
			</tr>
			</thead>
		</table>
		<br>
		<c:choose>
			<c:when test="${checkId == boardVO.mid}">
				<input type="button" value="수정" class="btn button" onClick="go_update_form('${boardVO.bseq}', '${tpage}', '${key}')">
				<!-- <input type="button" value="삭제" class="btn button" onClick="go_delete()"> -->
				<a href="#" class="btn button" onclick="go_delete()">삭제</a>
				<input type="button" value="목록" class="btn button"
					onclick="go_list('${tpage}', '${key}')">
			</c:when>
			<c:otherwise>
				<input type="button" value="목록" class="btn"
					onclick="go_list('${tpage}', '${key}')" >
			</c:otherwise>
		</c:choose>
	</form>
</article>
<script id="text/javascript">
	function go_update_form(bseq, tpage, key) {// 수정화면으로
		var theForm = document.frm;
		theForm.action = "PmServlet?command=board_update_form&bseq="
				+ bseq + "&tpage=" + tpage + "&key=" + key;
		theForm.submit();
	}
	
/* 	function go_delete(bseq) { 
		var ret = confirm("삭제하시겠습니까?");
		if (ret == true){
			document.frm.action = "PmServlet?command=board_delete&bseq=" + ${boardVO.bseq};
			document.frm.submit();
			alert("삭제 완료");
		} else {
			alert("취소되었습니다");
		}
	} */
	
	function go_delete() { 
		var ret = confirm("삭제하시겠습니까?");
		if (ret == true){
			location.href = "PmServlet?command=board_delete&bseq=" + ${boardVO.bseq};
			alert("삭제 완료");
		} else {
			alert("취소되었습니다");
		}
	}
	
	function go_list(tpage, key){
		document.frm.action = "PmServlet?command=board_form&tpage=" + tpage + "&key=" + key;
		document.frm.submit();
	}
</script>
<style type="text/css">
.btn {
   /* 줄어드는 모션 */
   -webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
   display: block;
   margin: 20px auto;
   max-width: 80px;
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
</style>
</html>