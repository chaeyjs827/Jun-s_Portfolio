<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="./includeGroup.jsp"%>
</head>
<script>
	$(document).ready(
		function() {
			var url = location.href;
			var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');

			var pageType = parameters[0].split('=')[1];
			console.log("pageType[0] : " + pageType);
			
			if(pageType=="summary") {
				$("#test").load("./comIntro/comSummary.html");
			} else if(pageType=="trees") {
				$("#test").load("./comIntro/comTrees.html");
			} else if(pageType=="history") {
				$("#test").load("./comIntro/comHistory.html");
			} else if(pageType=="partners") {
				$("#test").load("./comIntro/comPartners.html");
			} else if(pageType=="techs") {
				$("#test").load("./comIntro/comTechs.html");
			} else if(pageType=="products") {
				$("#test").load("./comIntro/comProducts.html");
			} else if(pageType=="copyrights") {
				$("#test").load("./comIntro/comCopyrights.html");
			} else if(pageType=="maps") {
				$("#test").load("./comIntro/comMaps.html");
			}
			
		});
		
	</script>
<body>
	<jsp:include page="./topMenu.jsp" flush="false" />

	<header class="top_image"
		style="background-image:url(/Pams21/resources/images/bg_info_min-min.jpg); position:relative;">
	<div class="container">
		<div class="row">
			<div class="site-heading" style="height: 210px;"></div>
		</div>
	</div>
	<div id="gradient_white"
		style="width: 100%; position: absolute; bottom: 0; height: 57px;"></div>
	</header>

	<div id="test">
		
	</div>	

	<jsp:include page="./footer.jsp" flush="false" />
</body>
</html>