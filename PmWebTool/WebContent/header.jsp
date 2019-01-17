<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function clickPopup(){
    var modal = document.getElementById("headerWrap");
    modal.style.display="block";
    alert("click");
}


/* window.onclick(event){
	var modal = document.getElementById("headerWrap");
    modal.style.display = 'none';
    alert("AAAAA");
} */

function test() {
     var modal = document.getElementById("headerWrap");
     modal.style.display = 'none';
     alert("AAAAA");
 }

/* window.onclick = function(event) {
	var body = document.body;
	var modal = document.getElementById("contentWrap");
	if(event.target== body) {
		modal.style.display= "none";
	}
} */
</script>
<style type="text/css">

 html,body{
  height:100%
}
body{
  display:table;
  width:100%
}
#test {
	width: 100%;
	height: 100%;
	display: table;
}
article{
  display:table-row;
  width:100%;
  height:100%
}
.contentWrap{
	display: none;
	border: 1px solid black;
	margin-top: 10px;
	width: 200px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
		<%@ include file="/modalPopup.jsp"%>
		<article>
			<button id="profilePopup" onclick="clickPopup()">프로필사진</button>
		</article>

