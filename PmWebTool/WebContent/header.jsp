<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
         <div class="logo">
            <a href="PmServlet?command=index"
               class="pm-link pm-link_text pm-link" data-sm-link-text="안경잡이">
               <span class="label">안경잡이</span>
            </a>
         </div>

         <div class="header-right">
            
            <a href="PmServlet?command=login_form"
               class="pm-link pm-link_text pm-link" data-sm-link-text="LogIn">
               <span class="label">LogIn</span>
            </a>
            
             <a href="PmServlet?command=join_form"
               class="pm-link pm-link_text pm-link" data-sm-link-text="JoIn">
               <span class="label">JoIn</span>
            </a>
            

         </div>
      </div>
   </article>