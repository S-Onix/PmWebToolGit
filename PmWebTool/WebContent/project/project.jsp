<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header_login.jsp"%>


	<section>
		<form name="pForm" method="post" action="PmServlet?command=project_form">
			<div>
				<h1>Project</h1>
			</div>
			
			<div class="project-center">
			<div class="project-box">
						<input class="project-text" type="text" name='newName' placeholder="addProject">
						
						<button class="project-btn" onclick='newProject()' value="프로젝트생성">
						<i class="fas fa-folder-plus"></i>
						</button>
					</div>
			</div>
			
			<ul class="projectList">
			<c:forEach items="${projectList }" var="projectVO">
				<li class="project-card">
					<input type="button" value="${projectVO.pname }" class="cancel"
						onclick="goProjectDetail(${projectVO.pseq})">
				</li>
			</c:forEach>
			</ul>
			
			<%-- <div class="projectList">
			<c:forEach items="${projectList }" var="projectVO">
				<span class="project-card">
					<input type="button" value="${projectVO.pname }" class="cancel"
						onclick="goProjectDetail(${projectVO.pseq})">
				</span>
			</c:forEach>
			</div> --%>
			
			<!-- <div id="newProject">
				<input type="button" onclick="addProject()" value="프로젝트 생성" />
			</div> -->
			
		</form>
	</section>
	
	<script>
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
			
			/* content += "<input type='text' name='newName'/>";
			content += "<input type='button' onclick='newProject()' value='생성'>"; */
			content += "<input type='button' onclick='initButton()' value='취소'>";
			document.getElementById('newProject').innerHTML = content;
		}
		
		function newProject(){
			document.pForm.action="PmServlet?command=project_add";
			document.pForm.submit();
		}
		
	</script>
</body>
</html>