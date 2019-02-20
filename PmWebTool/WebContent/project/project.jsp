<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header_login.jsp"%>

<style>
.project-body{
	width: 100%;
	height: 100%;
    position: absolute;
    background-image: url(https://t1.kakaocdn.net/kakaocorp/operating/co/main-banner/2928.png);
    background-repeat: no-repeat;
    background-size: 100% 100%;
    opacity: 0.9;
    z-index: 1;
}
.profont-wrap {
	width: 100%;
}
.projectName{
	color: lightgray;
    background: transparent;
    border: 0.3px solid;
}
.h1{
	font-size: 30px;
    color: white;
    height: 20px;
}
.project-driver{
	width: 100%;
    height: 2px;
    background-color: white;
    margin-top: 5px;
    margin-bottom: 10px;
}
.project-form{
	width: 400px;
    margin: 0 auto;
    margin-top: 70px;
    z-index: -1;
}
.project-font{
    font-size: 30px;
    color: white;
	width: 25%;
	margin: 0 auto;
}
</style>
<section class="project-body">
	<form name="pForm" class="project-form" method="post"
		action="PmServlet?command=project_form">
		<div class="profont-wrap">
			<h1 class="project-font">Project</h1>
		</div>
		<div class="project-driver">
		</div>
		<div class="container">
			<input class="list-input" type="text" name="newName"
				placeholder="Add Project"
				onkeypress="if(event.keyCode==13){newProject();}">
				
				
			<ul class="list">
           
				<c:forEach items="${projectList }" var="projectVO">
					<li class="list_item"><input class="projectName" type="button"
						onclick='goProjectDetail(${projectVO.pseq})'
						value="${projectVO.pname }"> <a> <i class="icon-close"></i>
					</a></li>
				</c:forEach>
			 </ul> 
		</div>

		<!-- <div class="project-center">	
			<div class="project-box">
						<input class="project-text" type="text" name='newName' placeholder="addProject">
						
						<button class="project-btn" onclick='newProject()' value="프로젝트생성">
						<i class="fas fa-folder-plus"></i>
						</button>
					</div>
			</div>
			
			<ul class="projectList">
			<c:forEach items="${projectList }" var="projectVO">
				<li class="project-wrap">
					<button class="project-card cancel"
						onclick="goProjectDetail(${projectVO.pseq})">${projectVO.pname }</button>
				</li>
			</c:forEach>
			</ul>	-->

	</form>
</section>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
		

		function newProject(){
			document.pForm.action="PmServlet?command=project_add";
			document.pForm.submit();
		}
		
		function goProjectDetail(project){
			document.pForm.action ="PmServlet?command=project_detail_form&pseq=" + project;
			document.pForm.submit();
		}

		/*
		
	
		function initButton(){
			var content = "";
			content += '<input type="button" onclick="addProject()" value="프로젝트 생성" />';
			document.getElementById('newProject').innerHTML = content;
		}
		
		function addProject(){
			var content = "";
		
			 content += "<input type='text' name='newName'/>";
			content += "<input type='button' onclick='newProject()' value='생성'>"; 
			
			content += "<input type='button' onclick='initButton()' value='취소'>";
			document.getElementById('newProject').innerHTML = content;
		}
		
		function newProject(){
			document.pForm.action="PmServlet?command=project_add";
			document.pForm.submit();
		} 
		*/
		
		
	</script>
</body>
</html>