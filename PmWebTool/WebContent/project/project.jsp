<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header_login.jsp"%>


	<section>
		<form name="pForm" method="post" action="PmServlet?command=project_form">
			<div>
				<h1>Project</h1>
			</div>
	
			<c:forEach items="${projectList }" var="projectVO">
				<div>
					<input type="button" value="${projectVO.pname }" class="cancel"
						onclick="goProjectDetail(${projectVO.pseq})"><br>
					<input type="hidden" name="project${projectVO.pseq}" />
				</div>
			</c:forEach>
			<div id="newProject">
				<!-- <input type="text" name="newName"/> <input type="button" onclick="addProject()">프로젝트추가 -->
				<input type="button" onclick="addProject()" value="프로젝트 생성" />
			</div>
			
			
	
	
			[Pop-up]<input type="button" value="프로젝트 생성" class="cancel"
				onclick="location='PmServlet?command=project_add_form'"><br>
			[Pop-up]<input type="button" value="프로젝트 수정" class="cancel"
				onclick="location='PmServlet?command=project_update_form'"><br>
			<input type="button" value="프로젝트 삭제" class="cancel"
				onclick="location='PmServlet?command=project_delete&'"><br>
		</form>
	</section>
	
	<script>
		function goProjectDetail(project){
			document.pForm.action ="PmServlet?command=project_detail_form&pseq=" + project;
			document.pForm.submit();
		}
	
		function addProject(){
			var content = "";
			content += "<input type='text' name='newName'/>";
			content += "<input type='button' onclick='newProject()'>";
			document.getElementById('newProject').innerHTML = content;
		}
		
		function newProject(){
			document.pForm.action="PmServlet?command=project_add";
			document.pForm.submit();
		}
		
		function modifyProject(project){
			document.pForm.action = "PmServlet?command=project_update&pseq=" + project;
			document.pForm.submit();
		}
	</script>
</body>
</html>