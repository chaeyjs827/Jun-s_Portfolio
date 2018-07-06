<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="./includeGroup.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
	<jsp:include page="./topMenu.jsp" flush="false" />

	<header class="top_image"
		style="background-image:url(./resources/images/home_bg_blue2.jpg); position:relative;">
	<div class="container">
		<div class="row">
			<div class="site-heading top_login">
				<div>
					<h2 style="color: #fff;">로그인 페이지 입니다.</h2>
					<p style="font-size: 18px;"></p>
				</div>
			</div>
		</div>
	</div>
	<div id="gradient_white"
		style="width: 100%; position: absolute; bottom: 0; height: 57px;"></div>
	</header>
	
<script>
	function submitIdPw() {
		var userId = $("#UserId").val();
		var userPw = $("#UserPw").val();
		
		if(userId=="admin" && userPw=="12345") {
			location.href="./login.do?userId="+userId+"&userPw="+userPw;
		} else {
			alert("아이디 또는 비밀번호가 잘 못 되었습니다");
			$("#UserId").val("");
			$("#UserPw").val("");
			$("#UserId").focus();
		}
		
		console.log(userId + " , " + userPw);
	}
</script>

	<section class="container">
	<div class="form-horizontal">
				<h4>대리점 정보를 입력해주세요.</h4>
				<span class="field-validation-valid text-danger" data-valmsg-for="CustomError" data-valmsg-replace="true"></span>
				<hr>
				<div>
					<div class="form-group">
						<label class="control-label col-md-3">사업자 번호</label>
						<div class="col-md-9">
							<input class="form-control" id="UserId" maxlength="12" minlength="10" name="UserId" type="text" value="">
						</div>
						<div class="col-m1-3"></div>
						<span class="col-md-9"> "-" 를 제외하고 입력해주세요.</span>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">비밀 번호</label>
						<div class="col-md-9">
							<input class="form-control" id="UserPw" maxlength="12" minlength="10" name="UserId" type="password" value="">
						</div>
						<div class="col-m1-3"></div>
					</div>
					<div class="form-group">
						<div class="col-md-offset-3 col-md-9" style="text-align:right;">
							<input type="button" value="Login" onclick="submitIdPw()" class="btn btn-success btn-block">
							<br>
						</div>
					</div>
				</div>
			</div>
	</section>

	<div id="gradient_white"
		style="width: 100%; position: absolute; bottom: 0; height: 57px;"></div>
	</header>

	<jsp:include page="./footer.jsp" flush="false" />

</body>
</html>