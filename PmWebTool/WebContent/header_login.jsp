<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>Project Manager</title>
<link rel="stylesheet" type="text/css" href="pm_css.css" />

<script>
   /* $( document ).ready( function() {
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
    }); */
</script>

</head>
<body>
   <article class="headerArticle">

      <div class="header">
         <a id="logo" href="PmServlet?command=index">안경잡이</a>
         <!-- 
         <div class="header-right">
            <a class="active" href="PmServlet?command=login_form">LogIn</a> <a
               href="PmServlet?command=join_form">Join</a>
         </div>

         <!-- 로그인 후 헤더 -->
         <input type="button" value="프로젝트" onclick="location='PmServlet?command=project_form'">
         <input type="button" value="게시판" onclick="location='PmServlet?command=board_form'">
         <input type="button" value="프로필" onclick="location='PmServlet?command=profile_form'">
         <input type="button" value="로그아웃" onclick="location='PmServlet?command=index'">
      </div>

<!-- 
      <div class="popover_content_wrapper" style="display: none">
         <div id="alarm_content">
            <ul>
               <li>초대 알람 기능입니다.</li>
               <li>보드 알람 기능입니다.</li>
               <li>알람 알람 기능입니다.</li>
               <li id="driver"></li>
               <li>알람 ㅂㅂㅂㅂ기능입니다.</li>
               <li>알람 ㅁㅁㅁㅁ 기능입니다.</li>
            </ul>
         </div>
         <div id="profile_content">
            <ul>
               <li><a href="PmServlet?command=profile_form">프로필</a></li>
               <li>Log out</li>
               <li id="driver"></li>
               <li>기능입니다.</li>
               <li>기능입니다.</li>
            </ul>
         </div>
         <div id="plus_content">
            <ul>
               <li>기능 입니다 1</li>
               <li>기능 입니다 2</li>
               <li id="driver"></li>
               <li>기능 입니다 3</li>
               <li>기능 입니다 4</li>
            </ul>
         </div>
      </div>
      </div>
 -->

   </article>