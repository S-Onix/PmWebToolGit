<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>




<form method="post" name="phForm">
	<div id="project_info" onclick="modifyProjectName()">
		<span class="pname_input"> ${project.pname }</span>
	</div>
	<div>
		<input type="button" onclick="delete_project()" value="프로젝트 삭제"/>
		<input type="hidden" name="pseq" value="${project.pseq }"/>
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
					<span class="card" id="card${cardVO.cseq }" onclick="startClick(${cardVO.cseq})" ondblclick="doDouble(${cardVO.cseq})">${cardVO.ctitle }</span>
				</c:if>
			</c:forEach>
		</div>
		<div id="doing">
			<c:forEach items="${cardList }" var="cardVO">
				<c:if test="${cardVO.ctype == 2 }">
					<span class="card" id="card${cardVO.cseq }" onclick="startClick(${cardVO.cseq})" ondblclick="doDouble(${cardVO.cseq})">${cardVO.ctitle }>${cardVO.ctitle }</span>
				</c:if>
			</c:forEach>
		</div>

		<div id="done">
			<c:forEach items="${cardList }" var="cardVO">
				<c:if test="${cardVO.ctype == 3 }">
					<span class="card" id="card${cardVO.cseq }" onclick="startClick(${cardVO.cseq})" ondblclick="doDouble(${cardVO.cseq})">${cardVO.ctitle }>${cardVO.ctitle }</span>
				</c:if>
			</c:forEach>
		</div>

	</form>
	
	<input type="button" value="테스트" onclick="findKey()"/>
</div>



<script>
	var flag = 0;
	var cardClicks = 0;
	var timeOut;
	
	//리스트 초기화 (카드 구분을 위해서)
	var list = new Array();
	<c:forEach items="${cardList }" var="item">
		list.push({key : "${item.cseq }", ctype : "${item.ctype}", value : 0});
	</c:forEach>

	function findKey(){
		for(var i = 0; i < list.length; i++){
			if(list[i].key == 5)
				alert('찾았다');
		}
	}
	
	//oneclick && doubleclick 이벤트 구분 타임 조정 가능
	function startClick(cardVO) {
		cardClicks++;
		switch (cardClicks) {
		case 2:
			doDouble(cardVO);
			break;
		case 1:
			timeOut = setTimeout(doSingle(cardVO), 150);
			break;
		}
	}

	//카드 이름 변경
	function doSingle(cardVO) {
		cardClicks = 0;
		var cardIndex = 'card' + cardVO;
	}

	//카드 디테일 모달팝업
	function doDouble(cardVO) {
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
	
	function delete_project(){
		document.phForm.action = "PmServlet?command=project_delete";
		document.phForm.submit();
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