<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>

	<section>
		<form action="PmServlet?command=card_updat_form">
			<div>
				<h1>${project.pname }</h1>
			</div>
			<input type="button" value="<"> <input type="button" value=">"><br>
			[Pop-up]<input type="button" value="카드 생성"
				onclick="location='PmServlet?command=card_add_form'"><br>
			[Pop-up]<input type="button" value="카드 수정"
				onclick="location='PmServlet?command=card_update_form'"><br>
			<input type="button" value="카드 삭제"
				onclick="location='PmServlet?command=project_detail_form'"><br>
	
			<div id="todo">
				<c:forEach items="${cardList }" var="cardVO">
					<c:if test="${cardVO.ctype == 1 }">
						${cardVO.ctitle }
					</c:if>
				</c:forEach>
			</div>
			<div id="doing">
				<c:forEach items="" var="cardVO">
					<c:if test="${cardVO.ctype == 2 }">
						${cardVO.ctitle }
					</c:if>
				</c:forEach>
			</div>
	
			<div id="done">
				<c:forEach items="" var="cardVO">
					<c:if test="${cardVO.ctype == 3 }">
						${cardVO.ctitle }
					</c:if>
				</c:forEach>
			</div>
		</form>
	</section>
	<script>
		function addCard(){
			
		}
		
		function moveNext(){
			
		}
		
		function moveBefore(){
			
		}
	</script>
</body>
</html>