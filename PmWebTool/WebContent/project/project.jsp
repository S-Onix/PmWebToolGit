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
						onclick="goProjectDetail(${projectVO.pseq})">
				</div>
			</c:forEach>
			<div id="newProject">
				<input type="button" onclick="addProject()" value="프로젝트 생성" />
			</div>
			
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
			content += "<input type='text' name='newName'/>";
			content += "<input type='button' onclick='newProject()' value='생성'>";
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