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


         <div class="header-right">
            <input type="button" value="로그인" class="cancel"
               onclick="location='PmServlet?command=login_form'"> <input
               type="button" value="회원가입" class="cancel"
               onclick="location='PmServlet?command=join_form'">
         </div>
      </div>
   </article>