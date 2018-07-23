<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="./commonLink.jsp" flush="false" />
</head>
<body>
	<div id="header">
		<jsp:include page="./headerNav.jsp" flush="false" />
	</div>

	<!-- +++++ Welcome Section +++++ -->
	<div id="section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 centered">
					<h3>You can surf and check my portfolio without login</h3>
					<h3>Login only for Admin</h3>
					<c:choose>
						<c:when test="${returnValue==0}">
							<br/><h4 style="color:red;">Invalid ID or Password! Check it again!</h4></br>
						</c:when>
					</c:choose>
					<br/>
					<form class="form-horizontal" id="loginForm" role="form"
						method="post" action="./login.do">
						<div class="form-group">
							<label for="title" class="col-sm-2 control-label"> ID </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="id" name="id" value="">
							</div>
						</div>

						<div class="form-group">
							<label for="title" class="col-sm-2 control-label"> Password</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="pw" name="pw" value="">
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-sm-10 col-sm-offset-2"><br/>
							<input id="submitBtn" name="submitBtn" type="button" value="LOGIN" class="btn btn-primary">
							<input id="resetBtn"  type="button" value="RESET" class="btn btn-primary">
							</div>
						</div>
					</form>
				</div>
				<!-- /col-lg-8 -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- +++++ Welcome Section +++++ -->


	<div id="footer">
		<jsp:include page="./footer.jsp" flush="false" />
	</div>
	<script>
		$(function() {
			$("#resetBtn").on("click", function() {
				$("#id").val("");
				$("#pw").val("");
			});
			
			$("#submitBtn").on("click", function() {
				var id = $("#id").val();
				var pw = $("#pw").val();
				
				console.log("id: " +id);
				console.log("pw: " +pw);
				
				if(id=="") {
					alert("ID is mandatory");
					$("#pw").focus();
				} else if(pw=="") {
					alert("PW is mandatory");
					$("#pw").focus();
				}
				document.getElementById("loginForm").submit();
			});
			
		});
	</script>
</body>
</html>