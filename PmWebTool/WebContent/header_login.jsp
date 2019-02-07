<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>Project Manager</title>
<link rel="stylesheet" type="text/css" href="pm_css.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">

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



			<!-- 로그인 후 헤더 -->

			<c:choose>
				<c:when test="${loginUser != null }">

					<div class="search-box">
						<input class="search-text" type="text" placeholder="search">
						<a class="search-btn" href=""> <i class="fas fa-search"></i>
						</a>
					</div>
					<div class="header-login-right">
						<a href="PmServlet?command=project_form"
							class="pm-link pm-link_text pm-link" data-sm-link-text="Project">
							<span class="label">Project</span>
						</a> <a href="PmServlet?command=board_form"
							class="pm-link pm-link_text pm-link" data-sm-link-text="Post">
							<span class="label">Post</span>
						</a> <a href="PmServlet?command=profile_form"
							class="pm-link pm-link_text pm-link" data-sm-link-text="Profile">
							<span class="label">Profile</span>
						</a> <a href="PmServlet?command=logout"
							class="pm-link pm-link_text pm-link" data-sm-link-text="LogOut">
							<span class="label">LogOut</span>
						</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="header-right">

						<a href="PmServlet?command=login_form"
							class="pm-link pm-link_text pm-link" data-sm-link-text="LogIn">
							<span class="label">LogIn</span>
						</a> <a href="PmServlet?command=join_form"
							class="pm-link pm-link_text pm-link" data-sm-link-text="JoIn">
							<span class="label">JoIn</span>
						</a>
					</div>
				</c:otherwise>
			</c:choose>

		</div>

	</article>