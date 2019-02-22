<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<style>
   body {
      font-family: Arial, Helvetica, sans-serif;
   }
   .header{
   		background-color: rgba(00, 00, 00, 0.6);
   }
   .pm-link {
      --smLinkTextColor: white;
      --smLinkTextColorHover: white;
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
      border-radius: 20px;
      width: 60%;
      height: 60%;
      display: flex;
   }
   
   .modal-left {
      width: 50%;
      height: 50%;
      margin-top: 100px;
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
   
   .comment-content{
      overflow:auto;
      height : 250px;
      margin-right: 15px;
      margin-bottom: 15px;
   }
   
   #memoAdd {
   	  height: 30px;
   	  background: transparent;
   	  border: 1px solid rgb(211,211,211);
   	  border-radius: 3px;
   }
   
   .comment-message-wrap {
   	  width: 90%;
   	  height: 30px;
   	  background: rgba(211,211,211,0.4);
   	  border: 0.5px solid lightgray;
   	  border-radius: 5px;
   	  padding: 5px 0px 0px 15px;
   	  margin-bottom: 10px;
   }
   
     .comment-message {
   	  display: inline-block;
   	  width: 250px;
   	  word-break: break-all;
   }
   
   .comment-button {
   	  display: inline-block;
   	  background-color: transparent;
   	  border: none;
   	  float: right;
   	  margin-right: 5px;
   }
   
   .comment-message-wrap {
   	  width: 90%;
   	  height: auto;
   	  min-height: 25px;
   	  background: rgba(211,211,211,0.4);
   	  border: 0.5px solid lightgray;
   	  border-radius: 5px;
   	  padding: 5px 0px 0px 15px;
   	  margin-bottom: 10px;
  }
   
   .modal-right h3 {
   	  color: #83dcb7;
   	  margin-top: 10px;
   	  letter-spacing: 1px;
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
   
   .modal-body {
   	  margin-left: 10px;
   }
   .modal-title {
      color: #a1d28d;
   	  margin: 0px 0px 0px 10px;
   }
   
   .modal-footer {
      padding-left: 67.5%;
   }
   
   .modal-footer button {
   	  height: 30px;
   	  background: transparent;
   	  border: 1px solid rgb(211,211,211);
   	  border-radius: 3px;
   }
   
   .modal-footer button:hover {
   	  background: rgba(211,211,211,0.4);
   }
   
   .form-group {
      padding-top: 10px;
   }
   
   .calendar {
      padding-top: 70px;
      padding-left: 30%;
   }
   
   .form-control {
      width: 70%;
      height: 30px;
      font-size: 18px;
   }
   
   #date {
   	margin-left: 3.1px;
   }
   
   .cm-text {
      width: 80%;
      height: 30px;
      font-size: 18px;
      padding-left: 10px;
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
   
   .container{
       width: 100%;
       /* margin: 0 auto; */
       height: 100%;
   }
   
   .demo{
      letter-spacing: 0.1em;
   }
   
   .demo .detail-wrap {
      background-image: url("background/desktop.jpg");
   }
   
   /* backgrownd */
   .detail-wrap {
      position: relative;
      width: 100%;
      height: 100%;
      overflow: hidden;
      background-size: cover;
      background-position: center center;
      z-index: 1;
   }
   
   .main-title .thin {
      font-weight: 200;
   }
   
   @media only screen and (max-width: 768px) {
      .demo .main-title {
         font-size: 3em;
      }
   }
   
   .project-detail-header {
      margin-top: 30px;
      margin-left: 60px;
   }
   
   .project-detail-title {
      width: 100%;
      height: 20px;
      margin-buttom: 10px;
   }
   
   .list-title {
      width: 20%;
   	  display: inline-block;
   	  float: left;
   	  margin-left: 60px;
   	  margin-right: 122px;
   	  text-align: center;
   	  font-size: 18px;
   	  font-weight: 600;
   	  color: #17394d;
   	  margin-bottom: 10px;
      margin-top: 10px;
   }
   
   .list-input-form {
      width: 21.5%;
      display: inline-block;
   }
   
   .card-delete {
      background: transparent;
      border: 1px solid gray;
      border-radius: 3px;
      width: 80px;
      height: 35px;
      display: inline-block;
   }
   
   .project-delete {
      background: transparent;
      border: 1px solid gray;
      border-radius: 3px;
      width: 100px;
      height: 35px;
      display: inline-block;
   }
   
   .list-delete-form {
      display: inline-block;
   }
   
   .project-detail-delete {
      display: inline-block;
      margin-left: 48%;
   }
   
   .detail-center {
      width: 80%;
      margin: 0 auto;
   }
   
   .project-name {
      margin-top: 50px;
      margin-left: 60px;
   }
   
   .pname_input {
      font-size: 30px;
   }
   
   .list {
      background-color: rgba(211,211,211,0.7);
      border: 1px solid gray;
      width: 20%;
      height: 100%;
      display: inline-block;
      float: left;
      margin-right: 122px;
      margin-left: 60px;
   }
   
   .list-input {
      background: white;
      border: 1px solid gray;
      width: 100%;
   }
   
   .detail-list {
      width: 100%;
      height: 600px;
   }
   
   .card-wrap{
       margin: 0 auto;
       height: 30px;
       width: 70%;
       margin-top: 15px;
       margin-bottom: 15px;
   }
   
   .card{
      width: 100%;
       height: 100%;
       border-radius: 0.5em;
       border: 1px solid rgba(211,211,211);
       background: white;
       font-size: 15px;
   }
   
   .next {
      right: 12%;
   }
   
   .next,
   .prev {
      position: absolute;
      top: 45%;
      background: transparent;
      color: gray;
      border: none;
      cursor: pointer;
   }
</style>
<div class="container demo">
  <div class="detail-wrap">
   <div class="detail-center">
      <div id="project-name" class="project-name">
         <span class="pname_input"> ${project.pname }</span>
      </div>
      <div class="project-detail">
            <!-- [Pop-up]<input type="button" value="카드 생성" onclick="cardForm()"> -->
            
            <!-- 카드생성 -->
            <div class="project-detail-header">
               <!-- <form name="pForm" method="post" class="list-input-form"> -->
               <div class="list-input-form">
                <input class="list-input" type="text" id="newCTitle" name="newCTitle" placeholder="Add Card" onkeyup="enterCardKey()">
               </div>
              <!--  </form> -->
               <div class="project-detail-delete">
                  <input type="button" id="delete" class="card-delete" value="카드 삭제"/>
                  <form method="post" name="deleteForm" class="list-delete-form">
                     <div>
                        <input type="button" onclick="delete_project()" class="project-delete" value="프로젝트 삭제" />
                        <input type="hidden" name="pseq" value="${project.pseq }" />
                     </div>
                  </form>
               </div>
            </div>
            
            <div class="project-detail-title">
      <button id="pre" class="prev"><i class="fas fa-chevron-left fa-2x"></i></button>
 
            	<div class="list-title">Do</div>
            	<div class="list-title">Doing</div>
            	<div class="list-title">Done</div>
                <button id="next" class="next"><i class="fas fa-chevron-right fa-2x"></i></button>
 
            </div>
            
            <!-- [Pop-up]<input type="button" value="카드 수정"
               onclick="location='PmServlet?command=card_update_form'"> -->
            <div class="detail-list">
            <!-- 
               <input type="button" id="next" value="다음단계이동" />
               <input type="button" id="pre" value="이전단계이동" />
             -->
             
               <div class="list">
                  <div class="card-title"></div>
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
   
         <!-- The Modal -->
         <div id="myModal" class="modal">
      
            <!-- Modal content -->
            <div class="modal-content">
               <!-- ----------left--------- -->
               <div class="modal-left">
                  <div class="modal-header">
                     <h3 class="modal-title" id="lineModalLabel">Edit Card</h3>
                  </div>
                  <div class="modal-body">
      
                     <!-- content goes here -->
                     <form method="post">
                     <input type="hidden" id="mcseq" value="">
                        <div class="form-group">
                        	TITLE
                           <input type="text" class="form-control" id="title"
                              placeholder="TITLE UPDATE">
                        </div>
                        <div class="form-group">
                        	DATE 
                           <input type="text" class="form-control" id="date"
                              placeholder="SCHADULE">
                        </div>
      
                     </form>
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

					<h3>COMMENT</h3>
					<div class="comment-wrap">
						<div class="comment-text">
							<div id="comment-content" class="comment-content"></div>
							<input type="text" placeholder="COMMENT" id="comment" class="cm-text">
							<button id="memoAdd" class="btn">작성</button>
						</div>
					</div>
				</div>
            </div>
         </div>
      </div>
    </div>
   </div>
 </div>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script>
	var pflag = 1;
	
	var checkMap = new Map();
	var dataMap = new Map();
	var commentMap = new Map();
	var projctName = "${project.pname}";
	
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
         return;
      }
   })
	
	window.onclick = function(event){
		if(event.target == document.getElementById('myModal')){
			$('#myModal').css("display", "none");
			clearComment();
		}
	}
	$('.close').click(function(){
		$('#myModal').css("display", "none");
		clearComment();
	});
	
	function clearComment(){
		commentMap.clear();
		$('#comment').val("");
		$('#comment-content').empty();
	}
	
	
	function doModalPrint(cardSeq){
		var card = dataMap.get(cardSeq);
		var cDate = new Date(card.dueDate);
		//포맷과정있어야함
		fDate = getFormatDate(cDate);
		// 모달의 데이터 넣기 
		$('#mcseq').val(cardSeq);
		$('#title').html(card.ctitle);
		$('#title').val(card.ctitle);
		$('#date').val(fDate);
		
		
		
		$.ajax({
			url : "PmServlet?command=comment_list",
			data : {
				"cardSeq" : cardSeq
			},
			dataType : "text",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data){
				var objee = JSON.stringify(data);
				var data = decodeURIComponent(objee);
				
				var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-<>@\#$%&\\\=\(\'\"]/gi;
				var regExp2 = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/gi;
				
				var objee2 = data.split(',');
				for(var i=0; i < objee2.length; i++){
					var kV = objee2[i].split(':');
					kV[0] = kV[0].replace(regExp, '');
					kV[1] = kV[1].replace(regExp, '');
					kV[1] = kV[1].replace(regExp2, ' ');
					
					commentMap.set(kV[0], kV[1]);
					var tag = "<div id='comment" + kV[0] + "' > <div class='comment-message-wrap'><div class='comment-message'>";
					tag += kV[1];
					tag += "</div><button class='comment-button' id='" + kV[0] + "' ><i class='fas fa-minus'></i></button> </div></div>"
					$('#comment-content').append(tag);
				}
				
			}
			
		});
	}
	
	$(document).on("click", ".comment-button", function(){
		var id = $(this).attr('id');
		//해당 span 태그 제거 + commentMap의 데이터 제거
		var divId = '#comment' + id;
		$(divId).remove();
		commentMap.delete(id);

		$.ajax({
			url : "PmServlet?command=comment_delete",
			type : "post",
			data : {
				"c_cseq" : id
			}
		})
		
	});
	
	$('#memoAdd').click(function(){
		var cseq = $('#mcseq').val();
		var c_creply  = $('#comment').val();
		var pseq = ${project.pseq};
		$.ajax({
			url : "PmServlet?command=comment_add",
			type : "post",
			dataType : "text",
			data : {
				"cseq" : cseq,
				"c_creply" : c_creply,
				"pseq" : pseq
			},
			success : function(data){
				var c_cseq = data;
				var tag = "<div id='comment" + data + "' > <div class='comment-message-wrap'><div class='comment-message'>";
				tag += $('#comment').val();
				tag += "</div><button class='comment-button' id='" + data + "' ><i class='fas fa-minus'></i></button </div></div>"
				$('#comment-content').append(tag);
				$('#comment').val("");
				
			}
		})
	});

	
	$('#mSubmit').click(function(){
		var updateData = dataMap.get($('#mcseq').val());
		var cardId = '#card' + updateData.cseq;
		updateData.ctitle = $('#title').val();
		console.log($('#date').val());
		
		if($('#data').val("NaN\-0NaN\-0NaN") == true ){
			var today = new Date();
			console.log("today : " + today);
			$('#data').val(today);
		}
		dataMap.get($('#mcseq').val()).ctitle = $('#title').val();
		dataMap.get($('#mcseq').val()).dueDate = $('#date').val() + " 09:00:00.0";
		//타이틀 변경시 카드의 이름 변경
	 	if($(cardId).children().text() != $('#title').val()){
			$(cardId).children().html($('#title').val());
		}
		
	 	clearComment();
		
		$('#myModal').css('display','none');
		 	
		var data = JSON.stringify(dataMap.get($('#mcseq').val()));
		console.log(data);
		jQuery.ajaxSettings.traditional = true;

		
	 	 $.ajax({
			url: "PmServlet?command=card_update",
			type: "post",
			dataType : "text",
			data: {
				"data" : data
			},
			success : function(data){
				console.log(data)
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
		var distance = cDay - today;
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
					if($(parentN).next().prop('class') == 'list')
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
	}
	
	function toggleMapVal(card){
		if(checkMap.get(card) == "0"){
			checkMap.set(card, "1");
		}else{
			checkMap.set(card, "0");
		}
	}
	
	function pTagName(flag){
	      var a;
	      if(flag == 1){
	         a =  "<span class='pname_input'>"+ projctName + "</span>";
	      }else{
	         a = "<input type='text' style='font-size : 30px' name='newPname' id='newPname' onkeyup='enterKey()'>"
	      }
	      return a;
	   }


	   $('#project-name').click(function(){   
	      pflag *= -1;
	      var tag = pTagName(pflag);
	      $('#project-name').html(tag);
	      if(pflag == -1){
	         $('#newPname').focus();
	      }
	      
	   });

	   
	   
	   //enter 클릭시 프로젝트 명 변경
	    function enterKey() {
	      if (window.event.keyCode == 13) {
	         projctName = $('#newPname').val();
	         var pseq = ${project.pseq};

	         $.ajax({
	            url : "PmServlet?command=project_update",
	            type : "post",
	            data : {
	                  "newPname" : projctName,
	                  "pseq" : pseq
	            },
	            success : function(){
	               pflag *= -1;
	               var tag = pTagName(pflag);
	               $('#project-name').html(tag);
	            }
	         })
	      }
	   }
	   
	    function enterCardKey(){
	        if (window.event.keyCode == 13) {
	           cardName = $('#newCTitle').val();
	           var pseq = ${project.pseq} + "";
	           var mseq = ${loginUser.mseq} + "";
			   var today = new Date();
			   today = getFormatDate(today);
			   today += " 09:00:00.0";
	           
	            $.ajax({
	              url : "PmServlet?command=card_add",
	              type : "post",
	              dataType : "text",
	              data : {
	                    "newCTitle" : cardName,
	                    "pseq" : pseq
	              },
	              success : function(data){
	                 $('#newCTitle').val("");
	                 //맵에 추가하고 (카드 번호 및 ), 화면에 뿌려주기
	                 checkMap.set(data, '0');
	                 //모달 팝업의 데이터를 넣기 위해서
	                 dataMap.set(data, {
	                    cseq :  data,
	                    pseq :  pseq,
	                    mseq : mseq,
	                    ctype : "1",
	                    ctitle : cardName,
	                    dueDate : today
	                 });
	                 
	                 console.log("data :" + data + " cardName : " + cardName);
	                 var tag = "<div id='card" + data + "' class='card-wrap' >";
	                 tag += "<button type='button' name='cseq' value='" + data +"' class='card'>" + cardName + "</button>";
	                 tag += "</div>";
	                 
	                 //첫번쨰 .list에 추가되야함
	                 $('.list:first').append(tag);
	                 
	                 
	              }
	           })
	        }
	     }
	
	
	function delete_project(){
		document.deleteForm.action = "PmServlet?command=project_delete";
		document.deleteForm.submit();
	}
	
	
</script>
</body>
</html>