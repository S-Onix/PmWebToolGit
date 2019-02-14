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

<input type="button" id="next" value="다음단계이동" />
<input type="button" id="pre" value="이전단계이동" />

<div class="project_detail">
	<form name="pForm" method="post">



		<input type="button" value="<"> <input type="button" value=">"><br>
		[Pop-up]<input type="button" value="카드 생성" onclick="cardForm()"><br>
		
		<!-- 카드생성 -->
		<input class="list-input" type="text" name="newCTitle"
				placeholder="Add Card"
				onkeypress="enterKey(${project.pseq}, 3)">
				
				
				
		<div ></div>
		[Pop-up]<input type="button" value="카드 수정"
			onclick="location='PmServlet?command=card_update_form'"><br>
		<input type="button" id="delete" />

		<div id="todo">
			<c:forEach items="${cardList }" var="cardVO">
				<c:if test="${cardVO.ctype == 1 }">
					<div id="card${cardVO.cseq }">
						<button type="button" name="cseq" value="${cardVO.cseq }"
							class="card">${cardVO.ctitle }</button>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div id="doing">
			<c:forEach items="${cardList }" var="cardVO">
				<c:if test="${cardVO.ctype == 2 }">
					<div id="card${cardVO.cseq }">
						<button type="button" name="cseq" value="${cardVO.cseq }"
							class="card">${cardVO.ctitle }</button>
					</div>
				</c:if>
			</c:forEach>
		</div>

		<div id="done">
			<c:forEach items="${cardList }" var="cardVO">
				<c:if test="${cardVO.ctype == 3 }">
					<div id="card${cardVO.cseq }">
						<button type="button" name="cseq" value="${cardVO.cseq }"
							class="card">${cardVO.ctitle }</button>
					</div>
				</c:if>
			</c:forEach>
		</div>

	</form>


</div>
<!-- 
<img src="http://lorempixel.com/400/200/" id="HoldListener"> -->


<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	var pflag = 0;
	var cflag = 0;
	
	/* 타임 테스트 */
	var time1, time2;
	
	$('.card').mousedown(function(){
		time1 = new Date();
	});
	
	$('.card').mouseup(function(){
		time2 = new Date();
		var flag = true;
		if(time2 - time1 < 300){
			clickCard($(this).attr('value'));
			if(this.flag == true){
				$(this).css('color','black');
				this.flag = false;
			}else{
				$(this).css('color', 'red');
				this.flag = true;
			}
			return;
		}else if(time2 - time1 < 800){
			console.log('change cardname');
			doChangeCTitle($(this).attr('value'));
			return;
		}else{
			console.log('card detail');
			doModalPrint($(this).attr('value'));
			return;
		}
	});
	
	$('#pre').click(function(){
		var preCardList = new Array();
		for(var i = 0; i < list.length; i++){
			if(map.get(list[i].cseq) == "1" && list[i].ctype == 2){
				var cardId = '#card' + list[i].cseq;
				preCardList.push(list[i].cseq);
				if($(cardId).parent().prop('id') == 'doing'){
					var $div = $(cardId).html();
					$('#todo').append($div);
					$(cardId).remove();
				}
			}
		}
		
		
		/* $.ajax({
			url: "PmServlet?command=card_move",
			type : "POST",
			data : {
				"preCardList" : preCardList,
				"flag" : "0"
			}
		}) */
	});
	
	$('#next').click(function(){
		var nextCardList = new Array();
		for(var i = 0 ; i < list.length; i++){
			if(map.get(list[i].cseq) == "1" && list[i].ctype < 3){
				var cardId = '#card' + list[i].cseq;
				nextCardList.push(list[i].cseq);
				if($(cardId).parent().prop('id') == 'todo'){
					var $div = $('#todo').children(cardId).html();
					$('#doing').append($div);
					$(cardId).remove();
				}else if($(cardId).parent().prop('id') == 'doing'){
					var $div = $(cardId).html();
					$('#done').append($div);
					$(cardId).remove();
				}
			}
		}
	/* 	$.ajax({
			url: "PmServlet?command=card_move",
			type: "POST",
			data: {
				"nextCardList" : nextCardList,
				"flag" : "1"		
			},
			async: false
		}) */
		
	});
	
	$('#delete').click(function(){
		var deleteCardList = new Array();
		var pseq = ${project.pseq};
		for(var i = 0; i < list.length; i++){
			if(map.get(list[i].cseq) == "1"){
				var cardId = '#card' + list[i].cseq;
				deleteCardList.push(list[i].cseq);
				$(cardId).css("display", "none");
			}
		}
		
		jQuery.ajaxSettings.traditional = true;
		
		$.ajax({
			url: "PmServlet?command=card_delete",
			type : "post",
			data : {
				"deleteCardList" : deleteCardList,
				"pseq" : pseq
			},
			aysnc: false
		})
	});
	
	
	//카드 관련
	
	//카드 오브젝트 리스트 (카드 구분을 위해서)
	var list = new Array();
	var map = new Map();
	//변경 정보를 한번에 보내기 위해서 
	<c:forEach items="${cardList }" var="item">
		list.push({
			cseq : "${item.cseq }",
			pseq : "${item.pseq}" ,
			mseq : "${item.mseq}"  ,
			ctype : "${item.ctype}",
			ctitle : "${item.ctitle }",
			dueDate : "${item.dueDate }",
			}
		);
		//클릭된 카드의 정보를 보내기위해(todo, doing, done 으로 이동을 위한 cseq check)
		map.set('${item.cseq}', '0');

	</c:forEach>
	
	var checkCardList = new Array();
	
	function clickCard(cardVO){
		console.log(cardVO);
		toggleMapVal(cardVO);
		console.log(cardVO + ' ' + map.get(cardVO));
	}
	
	
	

	function findKey(cseq){
		for(var i = 0; i < list.length; i++){
			if(list[i].cseq == cseq)
				return list[i];
		}
	}
	
	function toggleMapVal(key){
		if(map.get(key) == "0"){
			map.set(key, "1");
		}else{
			map.set(key, "0");
		}
	}
	
	//카드 이름 변경
	function doChangeCTitle(cardVO) {
		var item = findKey(cardVO);
	 	modifyCardName(item);
	 }
	
	function modifyCardName(item){
		var cardId = 'card' + item.cseq; 
		
		
		if(cflag == 0){//클릭시
			var content = "";
			content += "<input type='text' id='newCtitle' name='newCtitle' placeholder='카드이름' onkeydown='enterKey(" + item.pseq +", 2)' >";
			content += "<input type='hidden' name='cseq' value='"+ item.cseq +"'>";
			content += "<input type='button' onclick='modifyCardName("+ item.cseq +")' value='취소')'>"
			document.getElementById(cardId).innerHTML = content;
			document.pForm.newCtitle.focus();
			cflag = 1;
			return cflag;
		}else if(cflag == 1){//초기화
			/* 
			
				<div id="card${cardVO.cseq }">
						<button type="button" name="cseq" value="${cardVO.cseq }"
							class="card"> ${cardVO.ctitle }</button>
				</div>
			
			*/
			
			var content = '';
			
			content += "<button type='button' name ='cseq' value='";
			content += item.cseq + "' class ='card'>";
			content += item.ctitle + "</button>";
			document.getElementById(cardId).innerHTML = content;
			cflag = 2;
			return cflag;
		}else{
			cflag = 0;
			return cflag;
		}
	}

	
	
	//카드 디테일 모달팝업 출력되야함
	function doModalPrint(cardVO) {
		console.log('double click');
	}

	function modifyProjectName() {
		//크기 조정 필요할듯
		if (pflag == 0) {
			var content = '';
			content += "<input type='text' id='newPname' placeholder='프로젝트이름' name='newPname' onkeydown='enterKey(${project.pseq}, 1)'>";
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
		}else if(window.event.keyCode == 13 && flag == 3){
			document.pForm.action="PmServlet?command=card_add&pseq=" + project;
			document.pForm.submit();
		}
	}
	
	function delete_project(){
		document.phForm.action = "PmServlet?command=project_delete";
		document.phForm.submit();
	}
	
	
	
	/*  $(':root').on('mousedown', '*', function() {
	    var el = $(this),
	        events = $._data(this, 'events');
	    if (events && events.clickHold && flag == 1) {
	        el.data(
	            'clickHoldTimer',
	            setTimeout(
	                function() {
	                    el.trigger('clickHold')
	                },
	                el.data('clickHoldTimeout')
	            )
	        );
	    }
	}).on('mouseup mouseleave mousemove', '*', function() {
	    clearTimeout($(this).data('clickHoldTimer'));
	    flag = 0;
	});
	
	//Attach it to the element
	$('#HoldListener').data('clickHoldTimeout', 1000); //Time to hold
	$('#HoldListener').on('clickHold', function() {	  
	    alert('이벤트 발생!!!');
	});	 */
	
	


	
	
	

	
	
	
	function getMouseEvent(){
		
	}

	function cardForm(){
		var content ='';	
		content += "<intput type='text' name='cardName'>";
	}
	
	function addCard() {
		
		content = "";
		content += "<input";
		
		
	}

	function moveNext() {
		
	}

	function moveBefore() {

	}
	
	

	
	
</script>
</body>
</html>