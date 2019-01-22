<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pm</title>
<link rel="stylesheet" href="pm_css.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


<script type="text/javascript" src="pm_javaScript.js"></script>
<script>

$( document ).ready( function() {
  var jbOffset = $( '.headerArticle' ).offset();
  $( window ).scroll( function() {
    if ( $( document ).scrollTop() > jbOffset.top ) {
      $( '.headerArticle' ).addClass( 'jbFixed' );
    }
    else {
      $( '.headerArticle' ).removeClass( 'jbFixed' );
    }
  });
} );

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
		
		$('.plus_button').popover({
			html:true,
			content:function(){
				return $('#plus_content').html();
			}
		});
	});
	
	$(function() {
		  $('#alarm').popover();
		});
	$(function() {
		  $('#example').popover();
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
		<div class= "header-search">
			<input type="text" title= "검색텍스트" class="search-text"><button type="button" title="검색버튼" class="search-button">검색</button></input>
		</div>
		<div class="header-right">
			<button type="button" title="더보기" class="plus_button" data-trigger="focus" data-placement="bottom">+</button>
			<button type="button" title="알람" class="alarm_button" data-trigger="focus" data-placement="bottom">알람</button>
			<button type="button" title="프로필" class="profile_button" data-trigger="focus" data-placement="bottom">프로필</button>
		</div>

		<div class="popover_content_wrapper" style="display: none">
			<div id="alarm_content">
				<ul>
					<li>초대 알람 기능입니다.</li>
					<li>보드 알람 기능입니다.</li>
					<li>알람 알람 기능입니다.</li>
					<li id= "driver"></li>
					<li>알람 ㅂㅂㅂㅂ기능입니다.</li>
					<li>알람 ㅁㅁㅁㅁ 기능입니다.</li>
				</ul>
			</div>
			<div id="profile_content">
				<ul>
					<li>프로필</li>
					<li>Log out</li>
					<li id= "driver"></li>
					<li>기능입니다.</li>
					<li>기능입니다.</li>
				</ul>
			</div>
			<div id="plus_content">
				<ul>
					<li>기능 입니다 1</li>
					<li>기능 입니다 2</li>
					<li id= "driver"></li>
					<li>기능 입니다 3</li>
					<li>기능 입니다 4</li>
				</ul>
			</div>
		</div>
	</div>
	

</article>