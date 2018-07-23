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

	<div id="sectioon">

		<div class="container pt">
			<div class="row mt centered">
				<div class="col-lg-4">
					<img class="aboutImg" src="./resources/img/certification/bar.jpg" >
					<h4>Bachelor's Degree</h4>
				</div>
				<div class="col-lg-4">
					<img class="aboutImg" src="./resources/img/certification/info.jpg">
					<h4>Engineer Information Processing</h4>
					<h5>(National technique qualification)</h5>
				</div>
				<div class="col-lg-4">
					<img class="aboutImg" src="./resources/img/certification/Opic.jpg">
					<h4>Opic Test Level</h4>
					<h5>Intermediate High</h5>
				</div>
			</div>
			
			<div class="row mt centered">
				<div class="col-lg-4">
					<img class="aboutImg" src="./resources/img/certification/javacourse.jpg" >
					<h4>JAVA course of Gorverment System</h4>
				</div>
				<div class="col-lg-4">
					<img class="aboutImg" src="./resources/img/certification/APC.jpg">
					<h4>APC shorterm English Study</h4>
					<h5>Upper-Intermediate</h5>
				</div>
				<div class="col-lg-4">
					<img class="aboutImg" src="./resources/img/certification/NewcastleLC.jpg">
					<h4>Newcastle Uni shorterm English Study</h4>
					<h5>Intermediate</h5>
				</div>
			</div>
			
			<div class="row mt centered">
				<div class="col-lg-4">
					<img class="aboutImg" src="./resources/img/certification/infoIndu.jpg" >
					<h4>Engineer Industry Information Processing</h4>
					<h5>(National technique qualification)</h5>
				</div>
			</div>
		</div>

	</div>

	<div id="footer">
		<jsp:include page="./footer.jsp" flush="false" />
	</div>
</body>
</html>