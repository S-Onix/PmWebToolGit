<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header_login.jsp"%>


	<section>
		<form name="pForm" method="post" action="PmServlet?command=project_form">
			<div class="profont-wrap">
				<h1 class="project-font">Project</h1>
			</div>
			<div class="container">
				<input class="list-input" type="text" placeholder="Add Project" onkeypress="if(event.keyCode==13){addProject();}">
				
				<ul class="list">
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
	/*
		function goProjectDetail(project){
			document.pForm.action ="PmServlet?command=project_detail_form&pseq=" + project;
			document.pForm.submit();
		}
	
		function initButton(){
			var content = "";
			content += '<input type="button" onclick="addProject()" value="프로젝트 생성" />';
			document.getElementById('newProject').innerHTML = content;
		}
		
		function addProject(){
			var content = "";
		*/
			/* content += "<input type='text' name='newName'/>";
			content += "<input type='button' onclick='newProject()' value='생성'>"; */
			/*
			content += "<input type='button' onclick='initButton()' value='취소'>";
			document.getElementById('newProject').innerHTML = content;
		}
		
		function newProject(){
			document.pForm.action="PmServlet?command=project_add";
			document.pForm.submit();
		} */
		
		function addProject()
		{
			var listValue = $(".list-input").val();
			var listItem = '<li class="list_item">' +
			'<input class="projectName" type="button" onclick='newProject()' value="'+listValue+'">' +
			'<a>' +
			'<i class="icon-close"></i>' +
		    '</a></li>';
			    
			$('.list').append(listItem);
			$('.list-input').val("");
		}
		function newProject(){
			document.pForm.action="PmServlet?command=project_add";
			document.pForm.submit();
		}
	</script>
</body>
</html>