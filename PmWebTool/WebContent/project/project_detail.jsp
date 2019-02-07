<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>

	<form method="post" name="phForm" action="">
		<div id="project_info" onclick="modifyProjectName()">
	
			<span class="flexable"> ${project.pname }</span>
	
	
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
	
			<div id="todo">
				<c:forEach items="${cardList }" var="cardVO">
					<c:if test="${cardVO.ctype == 1 }">
						<span class="card" onclick="startClick()">${cardVO.ctitle }</span>
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
	</div>

<script>
	var flag = 0;
	var cardClicks = 0;
	var timeOut;

	//oneclick && doubleclick 이벤트 구분 타임 조정 가능
	function startClick() {
		cardClicks++;

		switch (cardClicks) {
		case 2:
			doDouble();
			break;
		case 1:
			timeOut = setTimeout("doSingle()", 300);
			break;
		}
	}

	function doSingle() {
		alert("singleClick");
		cardClicks = 0;
	}

	function doDouble() {
		alert("doubleClick");
		clearTimeout(timeOut);
		cardClicks = 0;
	}

	function modifyProjectName() {
		//크기 조정 필요할듯
		if (flag == 0) {
			var content = '';
			content += "<input type='text' id='newPname' placeholder='프로젝트이름' name='newPname' onkeyup='enterKey()' onfocus='focus()''>";
			document.getElementById('project_info').innerHTML = content;
			document.phForm.newPname.focus();
			flag = 1;
			return flag;
		} else if (flag == 1) { //초기화 작업
			var content = '';
			content += "<h1>${project.pname }</h1>";
			document.getElementById('project_info').innerHTML = content;
			flag = 2;
			return flag;
		} else {
			flag = 0;
			return flag;
		}

	}

	function enterKey() {
		if (window.event.keyCode == 13) {
			alert("enter Key Event");
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