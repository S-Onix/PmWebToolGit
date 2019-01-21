<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="pm_css.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="pm_javaScript.js"></script>
<script>
	$(document).ready(function(){
		$('.alarm_button').popover({
			html:true,
			content:function(){
				return $('#alarm_content').html();
			}
		});
		
		$('.profile_button').popover({
			html:true,
			content:function(){
				return $('#profile_content').html();
			}
		});
	});
</script>
</head>
<body>
<%@ include file="/modalPopup.jsp"%>
<article class="headerArticle">

	<div class="header">
		<a id="logo" href="">ㅇㄱㅈㅇ</a>
		<!-- <div class="header-right">
			<a class="active" href="#home">LogIn</a> <a href="#contact">Sign Up</a>
		</div>  -->
		<div class="header-right">
			<button type="button">+</button>
			<button type="button" title="알람 타이틀" class="alarm_button" data-placement="bottom">알람</button>
			<button type="button" title="알람 타이틀" class="profile_button" data-placement="bottom">프로필</button>
		</div>
		
		<div class="popover_content_wrapper" style="display: none">
			<div id="alarm_content">
				<ul>
					<li>알람</li>
					<li>알람</li>
					<li>알람</li>
				</ul>
			</div>
			<div id="profile_content">
				<ul>
					<li>프로필</li>
					<li>Log out</li>
				</ul>
			</div>
		</div>
	</div>
	
	

</article>