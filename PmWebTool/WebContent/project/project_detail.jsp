<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<style>
	.detail-wrap {
		width: 80%;
		margin: 0 auto;
	}
	.detail-name {
		margin-top: 50px;
	}
	.pname_input {
		font-size: 30px;
	}
	.list {
		background-color: #f7f7f7;
		width: 20%;
		height: 300px;
		display: inline-block;
		float: left;
		margin-right: 60px;
		margin-left: 60px;
	}
	.detail-list {
		width: 100%;
		height: 300px;
	}
	.card-wrap{
	    margin: 0 auto;
	    height: 30px;
	    width: 60%;
	    margin-top: 25;
	}
	.card{
		width: 100%;
	    height: 100%;
	    border-radius: 0.5em;
	    background: transparent;
	    font-size: 15px;
	}
</style>
<div class="container demo">
   <div class="content">
      <div id="large-header" class="large-header">
<div class="detail-wrap">
         

	<div id="project_info" class="detail-name" onclick="modifyProjectName()">
		<span class="pname_input"> ${project.pname }</span>
	</div>
	
	
	
	<div class="project_detail">
		<form name="pForm" method="post">
			<!-- [Pop-up]<input type="button" value="카드 생성" onclick="cardForm()"> -->
			
			<!-- 카드생성 -->
			<div>
				<input class="list-input" type="text" name="newCTitle"
					placeholder="Add Card"
					onkeypress="enterKey(${project.pseq}, 3)">
			</div>
					
			<!-- [Pop-up]<input type="button" value="카드 수정"
				onclick="location='PmServlet?command=card_update_form'"> -->
	
			<div class="detail-list">
				<div class="list">
					<c:forEach items="${cardList }" var="cardVO">
						<c:if test="${cardVO.ctype == 1 }">
							<div id="card${cardVO.cseq }" class="card-wrap">
								<button type="button" name="cseq" value="${cardVO.cseq }"
									class="card">${cardVO.ctitle }</button>
							</div>
						</c:if>
					</c:forEach>
				</div>
				
				<div class="list">
					<c:forEach items="${cardList }" var="cardVO">
						<c:if test="${cardVO.ctype == 2 }">
							<div id="card${cardVO.cseq }" class="card-wrap">
								<button type="button" name="cseq" value="${cardVO.cseq }"
									class="card">${cardVO.ctitle }</button>
							</div>
						</c:if>
					</c:forEach>
				</div>
		
				<div class="list">
					<c:forEach items="${cardList }" var="cardVO">
						<c:if test="${cardVO.ctype == 3 }">
							<div id="card${cardVO.cseq }" class="card-wrap">
								<button type="button" name="cseq" value="${cardVO.cseq }"
									class="card">${cardVO.ctitle }</button>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</form>
		
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
						<form method="post">
						<input type="hidden" id="mcseq" value="">
							<div class="form-group">
								<input type="text" class="form-control" id="title"
									placeholder="TITLE UPDATE">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="date"
									placeholder="SCHADULE">
							</div>
	
						</form>
					</div>
					<div class="calendar">
						<button>calendar</button>
					</div>
					<div class="modal-footer">
						<button id="mSubmit" class="btn btn-default">카드변경</button>
					</div>
				</div>
				
				<!-- center -->
				<div class="center-line"></div>
				 
				<!-- ----------right---------- -->
				<div class="modal-right">
					<span class="close">&times;</span>

							<h3>메모 사항</h3>
	
					<div class="comment-wrap">
						<div class="comment-text">
							<h3>메모 작성</h3>
							<input type="text" placeholder="COMMENT" class="cm-text">
							<button value="comment">CM</button>
	
							<div id="comment-content" style="overflow:auto;">
								<c:choose>
									<c:when test="${comments != null }">
										<c:forEach items="${commetns }" var="comment">
											<div>
												<span>
													
												</span>
											</div>
										</c:forEach>
										
									</c:when>
									<c:otherwise>
										<div>
											테스트 댓글입니다  <button>삭제</button>
										</div>
										
										<div>
											테스트 댓글입니다2  <button>삭제</button>
										</div>
										<div>
											테스트 댓글입니다3  <button>삭제</button>
										</div>
										<div>
											테스트 댓글입니다4  <button>삭제</button>
										</div>
										<div>
											테스트 댓글입니다5  <button>삭제</button>
										</div>
										
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<input type="button" id="next" value="다음단계이동" />
	<input type="button" id="pre" value="이전단계이동" />
	<input type="button" id="delete" value="카드 삭제"/>
	
	<form method="post" name="deleteForm" class="detail-form">
		<div>
			<input type="button" onclick="delete_project()" value="프로젝트 삭제" /> <input
				type="hidden" name="pseq" value="${project.pseq }" />
		</div>
	</form>
</div>
      </div>
   </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script>
    var pflag = 0;
	var cflag = 0;
	
	var checkMap = new Map();
	var dataMap = new Map();
	//변경 정보를 한번에 보내기 위해서 
	<c:forEach items="${cardList }" var="item">
		//클릭된 카드의 정보를 보내기위해(todo, doing, done 으로 이동을 위한 cseq check)
		checkMap.set('${item.cseq}', '0');
		//모달 팝업의 데이터를 넣기 위해서
		dataMap.set('${item.cseq}', {
			cseq : "${item.cseq }",
			pseq : "${item.pseq}" ,
			mseq : "${item.mseq}"  ,
			ctype : "${item.ctype}",
			ctitle : "${item.ctitle }",
			dueDate : "${item.dueDate }"
		});

	</c:forEach>
	
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
		}else{
			doModalPrint($(this).attr('value'));
			var card = dataMap.get($(this).attr('value'));
			$('#myModal').css("display", "block");
			 //	*/
			if(card.dueDate != "" || card.dueDate !== null){
				var compareDate = calDate(card.dueDate);
				if(compareDate === 1){
					$(this).css("background-color", "red");	
				}else if (compareDate === 2){
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
		var card = dataMap.get(cardSeq);
		console.log(card.dueDate);
		var cDate = new Date(card.dueDate);
		//포맷과정있어야함
		fDate = getFormatDate(cDate);
		console.log(fDate);
		// 모달의 데이터 넣기
		$('#mcseq').val(cardSeq);
		$('#title').html(card.ctitle);
		$('#title').val(card.ctitle);
		$('#date').val(fDate);
		
	}
	
	
	$('#mSubmit').click(function(){
		var updateData = dataMap.get($('#mcseq').val());
		var cardId = '#card' + updateData.cseq;
		updateData.ctitle = $('#title').val();
		
		dataMap.get($('#mcseq').val()).ctitle = $('#title').val();
		dataMap.get($('#mcseq').val()).dueDate = $('#date').val() + " 09:00:00.0";
		
		//타이틀 변경시 카드의 이름 변경
	 	if($(cardId).children().text() != $('#title').val()){
			$(cardId).children().html($('#title').val());
		} 
		
		$('#myModal').css('display','none');
		 	
		var data = JSON.stringify(dataMap.get($('#mcseq').val()));
		jQuery.ajaxSettings.traditional = true;
		console.log("data : " + data);
		
	 	 $.ajax({
			url: "PmServlet?command=card_update",
			type: "post",
			data: {
				"data" : data
			}
		})
		
	});
	
	$("#date").datepicker({
	      dateFormat:"yy-mm-dd",
	      dayNamesMin:["일","월","화","수","목","금","토"],
	      monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	      onSelect:function( d ){

	    	  var arrDate = d.split("-");
	          var year = arrDate[0];
	          var month = arrDate[1];
	          var day = arrDate[2];
	         
	          //날자 구하기          
	          var date = new Date($("#date").datepicker({dateFormant:"yy-mm-dd hh:mm:ss"}).val() );
	          
	      }
	   });
	
	
	
	function getFormatDate(date){
		var year = date.getFullYear();                                
		var month = (1 + date.getMonth());             
		month = month >= 10 ? month : '0' + month;     
		var day = date.getDate();                                     
		day = day >= 10 ? day : '0' + day;                            
		return  year + '-' + month + '-' + day;
	}
	
	function calDate(cardDate){
		console.log(cardDate);
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
		return result;
	}


 	$('#pre').click(function(){
		var preCardList = new Array();
		var pseq = ${project.pseq};
		for(var [key, value] of dataMap){
			if(checkMap.get(key) == "1" && value.ctype == 2){
				var cardId = '#card' + key;
				preCardList.push(value);
				if($(cardId).parent().prop('class') == 'list'){
					var $div = $('.list').children(cardId).html();
					var parentN = $(cardId).parent();
					$div = $div.replace("color: rgb(255, 0, 0)", "color: black");
					$(cardId).remove();
					var tag = "<div id='card" + key + "' class='card-wrap' >";
					tag += $div;
					tag += "</div>";
					$(parentN).prev().append(tag);
				}
				toggleMapVal(key);
				value.ctype = (value.ctype*1) - 1;
				value.ctype += "";
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

		for(var [key, value] of dataMap){
			if(checkMap.get(key) == "1" && value.ctype < 3){
				var cardId = '#card' + key;
				nextCardList.push(value);
				if($(cardId).parent().prop('class') == 'list'){
					var $div = $('.list').children(cardId).html();
					console.log($div);
					var parentN = $(cardId).parent();
					$div = $div.replace("color: rgb(255, 0, 0)", "color: black");
					console.log($div);
					$(cardId).remove();
					var tag = "<div id='card" + key + "' class='card-wrap' >";
					tag += $div;
					tag += "</div>";
					$(parentN).next().append(tag);
				}
				toggleMapVal(key);
				value.ctype = (value.ctype*1) + 1;
				value.ctype += "";
			}
		}
		
		 //JSON으로 데이터 변환
		var data = JSON.stringify(nextCardList);
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
		for(var [key, value] of dataMap){
			if(checkMap.get(key) == "1"){
				var cardId = '#card' + key;
				deleteCardList.push(value.cseq);
				$(cardId).remove();
				checkMap.delete(key);
				dataMap.delete(key);
			}
		}
		
		console.log(deleteCardList);
		
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

	
	function clickCard(cardVO){
		toggleMapVal(cardVO);
		console.log(cardVO + ' ' + checkMap.get(cardVO));
	}
	
	function toggleMapVal(card){
		if(checkMap.get(card) == "0"){
			checkMap.set(card, "1");
		}else{
			checkMap.set(card, "0");
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
		document.deleteForm.action = "PmServlet?command=project_delete";
		document.deleteForm.submit();
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
/* backgrownd */
.large-header {
   position: relative;
   width: 100%;
   height: 100%;
   background: #111;
   overflow: hidden;
   background-size: cover;
   background-position: center center;
   z-index: 1;
}
.container{
    width: 100%;
    /* margin: 0 auto; */
    height: 100%;
}
.demo .large-header {
   background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/499416/demo-bg.jpg");
}

.demo{
   text-transform: uppercase;
   font-size: 4.2em;
   letter-spacing: 0.1em;
}

.main-title .thin {
   font-weight: 200;
}

@media only screen and (max-width: 768px) {
   .demo .main-title {
      font-size: 3em;
   }
}
</style>
</body>
</html>