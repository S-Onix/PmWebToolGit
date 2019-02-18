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

		
		<div class="list">
			<c:forEach items="${cardList }" var="cardVO">
				<c:if test="${cardVO.ctype == 1 }">
					<div id="card${cardVO.cseq }">
						<button type="button" name="cseq" value="${cardVO.cseq }"
							class="card">${cardVO.ctitle }</button>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div class="list">
			<c:forEach items="${cardList }" var="cardVO">
				<c:if test="${cardVO.ctype == 2 }">
					<div id="card${cardVO.cseq }">
						<button type="button" name="cseq" value="${cardVO.cseq }"
							class="card">${cardVO.ctitle }</button>
					</div>
				</c:if>
			</c:forEach>
		</div>

		<div class="list">
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
	
	
	
<!-- 	<div id="myModal" class="modal">
		Modal content
		<div class="modal-content">
			<span class="modal-close">&times;</span>
			<div class="modal-header">
				<h3 class="modal-title" id="lineModalLabel">My Modal</h3>
			</div>
			<div class="modal-body">

				content goes here
				<form>
					<div class="form-group">
						<label for="exampleInputEmail1">TITLE</label> <input
							type="text" class="form-control" id="exampleInputEmail1"
							placeholder="TITLE UPDATE">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">SCHADULE</label> <input
							type="date" class="form-control" id="exampleInputPassword1"
							placeholder="SCHADULE">
					</div>
							<button>calendar</button>
				</form>

			</div>
			<div class="modal-footer">
				---------------------
				<p>footer..</p>
					<button type="submit" class="btn btn-default">Submit</button>
			</div>
		</div>
	</div> -->
	
	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<!-- ----------left--------- -->
			<div class="modal-left">
				<div class="modal-header">
					<h3 class="modal-title" id="lineModalLabel">My Modal</h3>
				</div>
				<div class="modal-body">

					<!-- content goes here -->
					<form>
						<div class="form-group">
							<input type="text" class="form-control" id="title"
								placeholder="TITLE UPDATE">
						</div>
						<div class="form-group">
							<input type="date" class="form-control" id="chadule"
								placeholder="SCHADULE">
						</div>

					</form>
				</div>
				<div class="calendar">
					<button>calendar</button>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default">Submit</button>
				</div>
			</div>
			
			<!-- center -->
			<div class="center-line"></div>
			 
			<!-- ----------right---------- -->
			<div class="modal-right">
				<span class="close">&times;</span>
				<div class="test1">
					<div class="test2">
						<h3>comment title</h3>
					</div>
					<div class="test3">
						<h3>comment</h3>

					</div>
				</div>
				<div class="comment-wrap">
					<div class="comment-text">
						<h3>text</h3>
						<input type="text" placeholder="COMMENT" class="cm-text">
						<button value="comment">CM</button>

						<div class="comment-btn"></div>
					</div>
				</div>
			</div>
		</div>
	</div>


</div>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>


	/////////////////////////////////////////
/* 
	var modal = document.getElementById('myModal');

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks the button, open the modal 
		btn.onclick = function() {
			modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
		 */
	/////////////////////////////////////////

	var pflag = 0;
	var cflag = 0;
	
	/* 타임 테스트 */
	var time1, time2;
	
	//동적 html 이벤트 바인딩
	$(document).on("mousedown", ".card", function (){
		time1 = new Date();
	});
	
	$(document).on("mouseup", ".card", function(){
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
			var card = testMap.get($(this).attr('value'));
			
			$('#myModal').css("display", "block");
	
			
			if(card.dueDate != "" || card.dueDate !== null){
				console.log('들어왔나?');
				var compareDate = calDate(card.dueDate);
				
				if(compareDate == 1){
					$(this).css("background-color", "yello");	
				}else if (compareDate == 2){
					$(this).css("background-color", "blue")
				}else{
					$(this).css("background-color", "green");
				}
			}
			
			
			return;
		}
	})
	window.onclick = function(event){
		if(event.target == document.getElementById('myModal')){
			$('#myModal').css("display", "none");
		}
	}
	$('.close').click(function(){
		$('#myModal').css("display", "none");
	});
	
	
	function doModalPrint(cardSeq){
		var card = testMap.get(cardSeq);
		console.log(card.dueDate);
		var cDate = new Date(card.dueDate);
		//포맷과정있어야함
		fDate = getFormatDate(cDate);
		// 모달의 데이터 넣기
		$('#title').html(card.ctitle);
		$('#title').val(card.ctitle);
		$('#chadule').val(fDate);
		


		
	}
	
	function getFormatDate(date){
		var year = date.getFullYear();                                
		var month = (1 + date.getMonth());             
		month = month >= 10 ? month : '0' + month;     
		var day = date.getDate();                                     
		day = day >= 10 ? day : '0' + day;                            
		return  year + '-' + month + '-' + day;
	}
	
	function calDate(cardDate){
		var result = 0;
		var today = new Date();
		var cDay = new Date(cardDate);
		var distance = today - cDay;
		var oneDayMs = 86400000;
		
		if(distance / oneDayMs  < 1){
			result = 1;
		}else if(distance / oneDayMs < 4){
			result = 2;
		}
		console.log("result : " + result);
		return result;
	}

	

	
	
 	$('#pre').click(function(){
		var preCardList = new Array();
		var pseq = ${project.pseq};
		for(var i = 0; i < list.length; i++){
			if(map.get(list[i].cseq) == "1" && list[i].ctype == 2){
				var cardId = '#card' + list[i].cseq;
				preCardList.push(list[i]);
				if($(cardId).parent().prop('class') == 'list'){
					var $div = $('.list').children(cardId).html();
					var parentN = $(cardId).parent();
					$div = $div.replace("color: red", "color: black");
					$(cardId).remove();
					var tag = "<div id='card" + list[i].cseq + "' >";
					tag += $div;
					tag += "</div>";
					$(parentN).prev().append(tag);
				}
				toggleMapVal(list[i].cseq);
				list[i].ctype = (list[i].ctype*1) - 1;
				list[i].ctype += "";
			}
		}
		
		var data = JSON.stringify(preCardList);
		jQuery.ajaxSettings.traditional = true;
		
	 	 $.ajax({
			url: "PmServlet?command=card_move",
			type: "post",
			data: {
				"data" : data
			}
		}) 
	});
	
		
	
	
	$('#next').click(function(){
		var nextCardList = new Array();
		var pseq = ${project.pseq};
		for(var i = 0 ; i < list.length; i++){
			if(map.get(list[i].cseq) == "1" && list[i].ctype < 3){
				var cardId = '#card' + list[i].cseq;
				console.log(cardId);
				nextCardList.push(list[i]);
				console.log(nextCardList);
				if($(cardId).parent().prop('class') == 'list'){
					var $div = $('.list').children(cardId).html();
					var parentN = $(cardId).parent();
					$div = $div.replace("color: red", "color: black");
					$(cardId).remove();
					var tag = "<div id='card" + list[i].cseq + "' >";
					tag += $div;
					tag += "</div>";
					$(parentN).next().append(tag);
				}
				toggleMapVal(list[i].cseq);
				list[i].ctype = (list[i].ctype*1) + 1;
				list[i].ctype += "";
			}
		}
		
		//JSON으로 데이터 변환
		var data = JSON.stringify(nextCardList);
		
		console.log(data);
		
		jQuery.ajaxSettings.traditional = true;
		
	 	 $.ajax({
			url: "PmServlet?command=card_move",
			type: "post",
			data: {
				"data" : data
			}
		}) 
		
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
	var testMap = new Map();
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
		
		//모달 팝업의 데이터를 넣기 위해서
		testMap.set('${item.cseq}', {
			cseq : "${item.cseq }",
			pseq : "${item.pseq}" ,
			mseq : "${item.mseq}"  ,
			ctype : "${item.ctype}",
			ctitle : "${item.ctitle }",
			dueDate : "${item.dueDate }"
		});

	</c:forEach>
	
	
	var checkCardList = new Array();
	
	function clickCard(cardVO){
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
	
	
</script>

<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* background / opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 60%;
	height: 60%;
	display: flex;
}

.modal-left {
	width: 50%;
	float: left;
	flex: 5;
}

.center-line {
	border-left: 0.5px solid #cccccc;;
  	height: 360px;
	flex: 0.5;
}

.modal-right {
	width: 50%;
	float: right;
	flex: 5;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.center {
	margin-top: 50px;
}

.modal-header {
	padding-bottom: 5px;
}

.modal-footer {
	padding: 0;
}

.modal-footer .btn-group button {
	height: 40px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
	border: none;
	border-right: 1px solid #ddd;
}

.modal-footer .btn-group:last-child>button {
	border-right: 0;
}

.form-group {
	padding-top: 10px;
}

.modal-footer {
	padding-top: 70px;
	padding-left: 30%;
}

.calendar {
	padding-top: 70px;
	padding-left: 30%;
}

.form-control {
	width: 80%;
	height: 30px;
	font-size: 18px;
}

.cm-text {
	width: 80%;
	height: 50px;
	font-size: 18px;
}

.test1 {
	width: 80%;
	height: 170px;
}

.test2 {
	height: 50%;
}

.test3 {
	height: 50%;
}


</style>
</body>
</html>