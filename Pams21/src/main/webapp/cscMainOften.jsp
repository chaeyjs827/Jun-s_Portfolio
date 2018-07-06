<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="./includeGroup.jsp"%>
</head>
<body>

	<!--  nav 부분(시작) -->
	<div>
		<jsp:include page="./topMenu.jsp" flush="false" />
	</div>
	<!--  nav 부분(끝) -->

	
	<!--  header 부분(시작) -->
	<div>
		<jsp:include page="./CSCenter/cscHeader.html" flush="false" />
	</div>
	<!--  header 부분(끝) -->


	<!--  section(시작) -->
		<jsp:include page="./CSCenter/oftenQue.jsp" flush="false" />
	<!--  section(끝) -->
	 
	 
	<!--  footer(시작) -->
	<jsp:include page="./footer.jsp" flush="false" />
	<!--  footer(끝) -->
</body>
</html>