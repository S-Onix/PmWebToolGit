<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>

	<form method="post" name="phForm">
		<div id="project_info" onclick="modifyProjectName()">
			<span class="pname_input"> ${project.pname }</span>
		</div>
	</form>
	
	<div class="project_detail">
		<form name="pForm" method="post"
			action="PmServlet?command=card_updat_form">
	
	
			<input type="button" value="<"> <input type="button" value=">"><br>
			[Pop-up]<input type="button" value="카드 생성"
				onclick="location='PmServlet?command=card_add_form'"><br>
			[Pop-up]<input type="button" value="카드 수정"
				onclick="location='PmServlet?command=card_update_form'"><br>
			<input type="button" value="카드 삭제"
				onclick="location='PmServlet?command=project_detail_form'"><br>
		
		<c:forEach items="${cardList }" var="cardVO">
			<div id="todo">
					<c:if test="${cardVO.ctype == 1 }">
						<span class="card" onclick="startClick(${cardVO})">${cardVO.ctitle }</span>
					</c:if>
			</div>
			<div id="doing">
					<c:if test="${cardVO.ctype == 2 }">
							<span class="card" onclick="startClick(${cardVO})">${cardVO.ctitle }</span>
						</c:if>
			</div>
	
			<div id="done">
						<c:if test="${cardVO.ctype == 3 }">
							<span class="card" onclick="startClick(${cardVO})">${cardVO.ctitle }</span>
						</c:if>
			</div>
			
			
			
			</c:forEach>
		</form>
	</div>
	


<script>
	var flag = 0;
	var cardClicks = 0;
	var timeOut;

	//oneclick && doubleclick 이벤트 구분 타임 조정 가능
	function startClick(cardVO) {
		cardClicks++;

		switch (cardClicks) {
		case 2:
			doDouble(cardVO);
			break;
		case 1:
			timeOut = setTimeout("doSingle()", 150);
			break;
		}
	}

	//카드 이름 변경
	function doSingle(cardVO) {
		alert(cardVO.cseq);
		cardClicks = 0;
	}

	//카드 디테일 모달팝업
	function doDouble(cardVO) {
		alert("doubleClick");
		clearTimeout(timeOut);
		cardClicks = 0;
	}

	function modifyProjectName() {
		//크기 조정 필요할듯
		if (flag == 0) {
			var content = '';
			content += "<input type='text' id='newPname' placeholder='프로젝트이름' name='newPname' onkeydown='enterKey(${project.pseq})''>";
			document.getElementById('project_info').innerHTML = content;
			document.phForm.newPname.focus();
			flag = 1;
			return flag;
		} else if (flag == 1) { //초기화 작업
			var content = '';
			content += "<span class='pname_input'> ${project.pname }</span>";
			document.getElementById('project_info').innerHTML = content;
			flag = 2;
			return flag;
		} else {
			flag = 0;
			return flag;
		}

	}
	
	//enter 클릭시 프로젝트 명 변경
 	function enterKey(project) {
		if (window.event.keyCode == 13) {
			document.phForm.action="PmServlet?command=project_update&pseq=" + project;
			document.phForm.submit();
		}
	}

	function addCard() {

	}

	function moveNext() {
		
	}

	function moveBefore() {

	}
</script>
</body>
</html>