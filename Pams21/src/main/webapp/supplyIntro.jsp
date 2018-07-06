<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="./includeGroup.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<script>
	$(document).ready(
		function() {
			var url = location.href;
			var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
			
			var pageType = parameters[0].split('=')[1];
			console.log("listType[0] : " + pageType);
			
			var ajaxUrl;
			
			if(pageType=="agent") {
				ajaxUrl = "./supplyIntro/supplyAgent.html";
			} else if(pageType=="mobile") {
				ajaxUrl = "./supplyIntro/supplyMobile.html";
			} else if(pageType=="black") {
				ajaxUrl = "./supplyIntro/supplyBlack.html";
			} else if(pageType=="etc") {
				ajaxUrl = "./supplyIntro/supplyEtc.html";
			}
			
			$.ajax({
				type : 'POST',
				url : ajaxUrl,
				async : false,
				data : "",
				success : function(data) {
					$("#test").html(data);
				},
				error: function(request, status, error) {
					alert(error);
				}
			});
		}
	);
	
</script>
<body>

<jsp:include page="./topMenu.jsp" flush="false" />

<header class="top_image" style="background-image:url(/Pams21/resources/images/home_bg_storage.jpg); position:relative;">
	<div class="container">
		<div class="row">
			<div class="site-heading" style="height:210px;">
			</div>
		</div>
	</div>
	<div id="gradient_white" style="width:100%; position:absolute; bottom:0; height:57px;"></div>
</header>

<div id="test">

</div>


<jsp:include page="./footer.jsp" flush="false" />

</body>
</html>