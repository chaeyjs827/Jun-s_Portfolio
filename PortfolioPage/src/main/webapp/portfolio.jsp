<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="sessionID" value="${sessionID}" scope="session" />
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
			<div class="row mt centered">
				<div class="topOfsection">
					<div>
						<h1>Project List</h1>
						<br />
						<div class="row">
							<div class="totalCount">
								<c:out value="Total posts : ${paraMap.totalCount}" />
							</div>
							<div id="typeFilter" class="typeFilter">
								<c:choose>
									<c:when test="${sessionID eq 'admin'}">
										<a class="typeFilter toggle" href="./portWrite.jsp">WRITE</a>
									</c:when>
								</c:choose>
								<a id="portAll" class="typeFilter toggle"
									href="./portList.do?bt=0&cp=1">All</a> <a id="portCareer"
									class="typeFilter toggle" href="./portList.do?bt=1&cp=1">Career</a>
								<a id="portPersonal" class="typeFilter toggle"
									href="./portList.do?bt=2&cp=1">Personal</a> <a id="portWeb"
									class="typeFilter toggle" href="./portList.do?bt=3&cp=1">Web</a>
								<a id="portApp" class="typeFilter toggle"
									href="./portList.do?bt=4&cp=1">App</a>
							</div>
						</div>

						<div class="row">
							<c:forEach var="portList" items="${portList}" varStatus="status">
								<c:set var="indexItems" value="${status.index}" />
								<c:choose>
									<c:when test="${indexItems<=2}">
										<div class="col-lg-4">
											<a class="zoom black"
												href="./reader.do?bt=${paraMap.boardType}&cp=${paraMap.currentPage}&pi=${portList.postIndex}"><img
												class="img-responsive"
												src="/Img_Storage/${portList.thumnail}" alt="" /></a>
											<p class="section_p">${portList.title}</p>
										</div>
									</c:when>

									<c:when test="${indexItems>=3}">
										<div class="col-lg-4">
											<a class="zoom black"
												href="./reader.do?bt=${paraMap.boardType}&cp=${paraMap.currentPage}&pi=${portList.postIndex}"><img
												class="img-responsive"
												src="/Img_Storage/${portList.thumnail}" alt="" /></a>
											<p class="section_p">${portList.title}</p>
										</div>
									</c:when>
								</c:choose>
							</c:forEach>
						</div>
					</div>
					<div id="pagingArea">
						<ul class="pagination">
							<c:if test="${paraMap.currentPage > 1}">
								<li><a class="pagingFont"
									href="./portList.do?bt=${paraMap.boardType}&cp=${paraMap.currentPage-1}">Pre</a></li>
							</c:if>
							<c:forEach var="i" begin="1" end="${paraMap.totalPage}" step="1">
								<c:choose>
									<c:when test="${i < paraMap.currentPage}">
										<li><a class="pagingFont"
											href="./portList.do?bt=${paraMap.boardType}&cp=${i}">${i}</a></li>
									</c:when>
									<c:when test="${i eq paraMap.currentPage}">
										<li class="active"><a class="pagingFont active">${paraMap.currentPage}</a></li>
									</c:when>
									<c:when test="${i > paraMap.currentPage}">
										<li><a class="pagingFont"
											href="./portList.do?bt=${paraMap.boardType}&cp=${i}">${i}</a></li>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paraMap.currentPage < paraMap.totalPage}">
								<li><a class="pagingFont"
									href="./portList.do?bt=${paraMap.boardType}&cp=${paraMap.currentPage+1}">Next</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="footer">
		<jsp:include page="./footer.jsp" flush="false" />
	</div>

	<script>
		$(function() {
			
			var url = location.href;
			var parameters = (url.slice(url.indexOf('?') + 1, url.length))
					.split('&');
			var bt = parameters[0].split("=")[1];

			$("#typeFilter").children().eq(bt).addClass('active');
			$("#typeFilter").children().eq(bt).siblings().removeClass('active');

		});
	</script>
</body>
</html>