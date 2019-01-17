<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<script type="text/javascript">
	function clickPopup(){
	    var modal = document.getElementById("headerWrap");
	    modal.style.display = "block";
			alert("click");
		}
	
		function test() {
			var modal = document.getElementById("headerWrap");
			var focusModal = document.getElementById("profilePopup");
			if(focusModal != document.activeElement){
				modal.style.display = 'none';	
			}
			alert("AAAAA");
		}
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
	  height:10%
	}
	.contentWrap{
		display: none;
		border: 1px solid black;
		/* margin-top: 10px; */
		width: 200px;
	}
	</style>
	
	</head>
	
	
	<div id="test" onclick="test()">
		<%@ include file="/header.jsp"%>
	</div>
	<%@ include file="/footer.jsp"%>
