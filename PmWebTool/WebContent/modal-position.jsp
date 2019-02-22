<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>




<form method="post" name="phForm">
	<div id="project_info" onclick="modifyProjectName()">
		<span class="pname_input"> ${project.pname }</span>
	</div>
	<div>
		<input type="button" onclick="delete_project()" value="프로젝트 삭제" /> <input
			type="hidden" name="pseq" value="${project.pseq }" />
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
		<input id="openPopup" type="button" value="modal수정"
			onclick="clickPopup()"><br>
		<!-- modal -->
		
		<div id="article">
			<div id="contentWrap">
				<div id="title">MODAL TITLE</div>
				<div id="schedule">2019-02-11 ~ 2019-02-25</div>
				<div id="calendar">calendar</div>
				<div id="comment">comment</div>
				<input type="button" value="저장" onclick="location='PmServlet?command=project_detail_form'">
				<input type="button" value="취소" onclick="location='PmServlet?command=project_detail_form'">
			</div>
		</div>
		
		<input type="button" value="카드 삭제"
			onclick="location='PmServlet?command=project_detail_form'"><br>

		<div id="todo">
			<c:forEach items="${cardList }" var="cardVO">
				<c:if test="${cardVO.ctype == 1 }">
					<div id="card${cardVO.cseq }">
						<button type="button" name="cseq" value="${cardVO.cseq }"
							class="card" onclick="startClick(${cardVO.cseq})"
							ondblclick="doDouble(${cardVO.cseq})">${cardVO.ctitle }</button>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div id="doing">
			<c:forEach items="${cardList }" var="cardVO">
				<c:if test="${cardVO.ctype == 2 }">
					<div id="card${cardVO.cseq }">
						<button type="button" name="cseq" value="${cardVO.cseq }"
							class="card" onclick="startClick(${cardVO.cseq})"
							ondblclick="doDouble(${cardVO.cseq})">${cardVO.ctitle }</button>
					</div>
				</c:if>
			</c:forEach>
		</div>

		<div id="done">
			<c:forEach items="${cardList }" var="cardVO">
				<c:if test="${cardVO.ctype == 3 }">
					<div id="card${cardVO.cseq }">
						<button type="button" name="cseq" value="${cardVO.cseq }"
							class="card" onclick="startClick(${cardVO.cseq})"
							ondblclick="doDouble(${cardVO.cseq})">${cardVO.ctitle }</button>
					</div>
				</c:if>
			</c:forEach>
		</div>

	</form>

	<input type="button" value="테스트" onclick="findKey()" />
</div>



<script>
	var pflag = 0;
	var cflag = 0;
	var cardClicks = 0;
	var timeOut;
	
	//카드 오브젝트 리스트 (카드 구분을 위해서)
	var list = new Array();
	<c:forEach items="${cardList }" var="item">
		list.push({
			cseq : "${item.cseq }",
			pseq : "${item.pseq}" ,
			mseq : "${item.mseq}"  ,
			ctype : "${item.ctype}",
			ctitle : "${item.ctitle }",
			dueDate : "${item.dueDate }"
			}
		);

	</c:forEach>

	function findKey(cseq){
		for(var i = 0; i < list.length; i++){
			if(list[i].cseq == cseq)
				return list[i];
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
		var item = findKey(cardVO);
		modifyCardName(item);
	}
	
	function modifyCardName(item){
		alert(item.pseq + " " + item.cseq + " " + item.ctitle);
		var cardId = 'card' + item.cseq; 
		if(cflag == 0){//클릭시
			
			var content = "";
			content += "<input type='text' id='newCtitle' name='newCtitle' placeholder='카드이름' onkeydown='enterKey(" + item.pseq +", 2)' >";
			content += "<input type='hidden' name='cseq' value='"+ item.cseq +"'>";
			content += "<input type='hidden' name='pseq' value=${project.pseq}>";
			document.getElementById(cardId).innerHTML = content;
			document.pForm.newCtitle.focus();
			cflag = 1;
			return cflag;
		}else if(cflag == 1){//초기화
			var content = '<button type="button" name="cseq" value="' 
			+ item.cseq 
			+ '" class="card" id="card' 
			+ item.cseq + '" onclick="startClick(' 
					+ item.cseq 
					+ ')" ondblclick="doDouble("' 
							+ item.cseq + '")">' 
							+ item.ctitle 
							+ '</button>';
			document.getElementById(cardId).innerHTML = content;
			cflag = 2;
			return cflag;
		}else{
			cflag = 0;
			return cflag;
		}
	}

	//카드 디테일 모달팝업
	function doDouble(cardVO) {
		clearTimeout(timeOut);
		cardClicks = 0;
	}

	function modifyProjectName() {
		//크기 조정 필요할듯
		if (pflag == 0) {
			var content = '';
			content += "<input type='text' id='newPname' placeholder='프로젝트이름' name='newPname' onkeydown='enterKey(${project.pseq}, 1)''>";
			document.getElementById('project_info').innerHTML = content;
			document.phForm.newPname.focus();
			pflag = 1;
			return pflag;
		} else if (pflag == 1) { //초기화 작업
			var content = '';
			content += "<span class='pname_input'> ${project.pname }</span>";
			document.getElementById('project_info').innerHTML = content;
			pflag = 2;
			return pflag;
		} else {
			pflag = 0;
			return pflag;
		}

	}
	
	//enter 클릭시 프로젝트 명 변경
 	function enterKey(project, flag) {
		if (window.event.keyCode == 13 && flag == 1) {
			document.phForm.action="PmServlet?command=project_update&pseq=" + project;
			document.phForm.submit();
		}else if(window.event.keyCode == 13 && flag == 2){
			document.pForm.action="PmServlet?command=card_update&pseq=" + project;
			document.pForm.submit();
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
	
	/* modal popup */
	function clickPopup(){
		document.getElementById("contentWrap").style.display="block";
		document.getElementByTagName("BODY").style.opacity="0.2";

		document.getElementByTagName("body").style.background="red";
	}

	window.onclick = function(event) {
		var article = document.getElementById("article");
		var modal = document.getElementById("contentWrap");
		if(event.target== article) {
			modal.style.display= "none";
		}
	}
	
</script>
<style>
#contentWrap {
	display: none;
	border: 1px solid black;
	margin-top: 30px;
	margin-left: 9%;
	width: 80%;
	height: 80%;
}

#article {
	width: 100%;
	height: 100%;
}
.project_detail{
    height: 500px;
}
</style>
</body>
</html>