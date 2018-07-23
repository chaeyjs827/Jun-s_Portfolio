<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="./commonLink.jsp" flush="false" />

</head>
<body>
	<div id="header">
		<jsp:include page="./headerNav.jsp" flush="false" />
	</div>

	<div id="section">
		<div class="container">
			<form class="form-horizontal" id="postForm" role="form" method="post" action="./insertBoard.do" enctype="multipart/form-data">
				<div class="form-group">
					<label class="col-sm-2 control-label">Must write (*)</label>
				</div>
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">*Title</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="title" name="title" value="">
					</div>
				</div>
				
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">*Writer</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="writer" name="writer" value="Jun">
					</div>
				</div>
				
				<div class="form-group">
					<label for="startedDate" class="col-sm-2 control-label">*StartedDate</label>
					<div class="col-sm-10">
						<input type="date" class="form-control" id="startedDate" name="startedDate" value="">
					</div>
				</div>

				<div class="form-group">
					<label for="finishedDate" class="col-sm-2 control-label">*FinishedDate</label>
					<div class="col-sm-10">
						<input type="date" class="form-control" id="finishedDate" name="finishedDate" value="">
					</div>
				</div>
				
				<div class="form-group">
					<label for="" class="col-sm-2 control-label">*Summary</label>
					<div class="col-sm-10">
						<textarea class="form-control" rows="4" id="summary" name="summary"></textarea>
					</div>
				</div>
				
				<div class="form-group">
					<label for="" class="col-sm-2 control-label">*Using Skills</label>
					<div class="col-sm-10">
						<textarea class="form-control" rows="4" id="usingSkill" name="usingSkill"></textarea>
					</div>
				</div>

				<div class="form-group">
					<label for="" class="col-sm-2 control-label">*Content</label>
					<div class="col-sm-10">
						<textarea class="form-control" rows="4" id="content" name="content"></textarea>
					</div>
				</div>
				
				<div class="form-group">
					<label for="gitUrl" class="col-sm-2 control-label">Git URL</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="gitUrl" name="gitUrl" placeholder="enter git URL" value="">
					</div>
				</div>

				<div class="form-group">
					<label for="serverUrl" class="col-sm-2 control-label">Server URL</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="serverUrl" name="serverUrl" placeholder="enter server URL" value="">
					</div>
				</div>
				
				<div class="form-group">
					<label for="human" class="col-sm-2 control-label">*Project Type</label>
					<div class="col-sm-10">
						<div class="custom-select" style="width:200px;">
						  <select id="projectType" name="projectType">
						    <option value="0" selected>choose</option>
						    <option value="1">WEB</option>
						    <option value="2">APP</option>
						  </select>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for="human" class="col-sm-2 control-label">*Career OR Personal</label>
					<div class="col-sm-10">
						<div class="custom-select" style="width:200px;">
						  <select id="careerCheck" name="careerCheck">
						    <option value="0" selected>choose</option>
						    <option value="1">Career</option>
						    <option value="2">Personal</option>
						  </select>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for="thumnail" class="col-sm-2 control-label">Thumnail</label>
					<div class="col-sm-10">
				        <input type="file" id="thumnail_file" name="thumnail_file" />
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-10 col-sm-offset-2">
						<input id="submitBtn" name="submitBtn" type="button" value="POST" class="btn btn-primary">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10 col-sm-offset-2">
						<! Will be used to display an alert to the user>
					</div>
				</div>
			</form>

		</div>
	</div>

	<div id="footer">
		<jsp:include page="./footer.jsp" flush="false" />
	</div>
	
	<script>
		
	$(function() {
		$("#thumnail_file").on("change", function(e) {
			e.preventDefault();
			
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			console.log(files);
			console.log(filesArr);
			
	 		filesArr.forEach(function(f) {
				if(!f.type.match("image.*")) {
					alert("Upload only for Image files");
					$("#thumnail_file").val("");
					return;
				}
			}); 
		});
		
		$("#submitBtn").on("click", function() {
			var title = $("#title").val();
			var startedDate = $("#startedDate").val();
			var finishedDate = $("#finishedDate").val();
			var summary = $("#summary").val();
			var content = $("#content").val();
			var gitUrl = $("#gitUrl").val();
			var serverUrl = $("#serverUrl").val();
			var projectType = $("#projectType").val();
			var careerCheck = $("#careerCheck").val();
		
			if(title==""){
				alert("Write the Title");
				$("#title").focus();
				return;
			} else if(startedDate==""){
				alert("Select the Started Date");
				$("#startedDate").focus();
				return;
			} else if(finishedDate=="") {
				alert("Select the Finished Date");
				$("#finishedDate").focus();
				return;
			} else if(summary=="") {
				alert("Write the Summary");
				$("#summary").focus();
				return;
			} else if(content=="") {
				alert("Write the Content");
				$("#content").focus();
				return;
			} else if(projectType==0) {
				alert("Select the Project Type");
				$("#projectType").focus();
				return;
			} else if(careerCheck==0) {
				alert("Select the Group OR Personal");
				$("#careerCheck").focus();
				return;
			}
			
			document.getElementById("postForm").submit();	// 유효성 검사 후 submit
		});
	});
</script>
</body>
</html>