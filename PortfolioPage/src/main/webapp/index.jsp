<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
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
					<img src="./resources/img/Jun_blue-min.jpg" alt="Stanley">
					<h1>Welcome to Jun's Portfolio.</h1>
				</div>
				<!-- /col-lg-8 -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- +++++ Welcome Section +++++ -->

	<!-- +++++ Projects Section +++++ -->
	<div class="container pt">
		<div class="row mt centered">
			<h1>Recent Finished Projects</h1><br/>
 		
	 		<c:forEach var="indexList" items="${indexList}" varStatus="status">
				<c:set var="indexItems" value="${status.index}"/>
				<c:choose>
					<c:when test="${indexItems<=2}">
						<div class="col-lg-4">
							<a class="zoom black" href="./reader.do?pi=${indexList.postIndex}"><img class="img-responsive"
								src="/Img_Storage/${indexList.thumnail}" alt="" /></a>
							<p class="section_p">${indexList.title}</p>
						</div>
					</c:when>
					
					<c:when test="${indexItems>=3}">
						<div class="col-lg-4">
							<a class="zoom black" href="./reader.do?pi=${indexList.postIndex}"><img class="img-responsive"
								src="/Img_Storage/${indexList.thumnail}" alt="" /></a>
							<p class="section_p">${indexList.title}</p>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>
		</div>
	</div>
	<!-- +++++ Projects Section +++++ -->

	<div id="footer">
		<jsp:include page="./footer.jsp" flush="false" />
	</div>
</body>
</html>
