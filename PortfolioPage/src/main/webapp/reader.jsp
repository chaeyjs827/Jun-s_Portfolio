<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <c:set var="sessionID" value="${sessionID}" scope="session" /> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="./commonLink.jsp" flush="false" />
<script>
	
</script>
</head>
<body>
	<div id="header">
		<jsp:include page="./headerNav.jsp" flush="false" />
	</div>

	<div id="section">
		<div class="container">
			<div class="col-md-13 write_form"
				style="padding: 0; padding-left: 40px;">
				<!-- 게시판 상단 -->
				<c:forEach var="blist" items="${blist}" varStatus="status">
					<div style="overflow: hidden; position: relative;">
						<div>
							<h2 class="post-title">Title : ${blist.title}</h2>
						</div>
						<div class="nopadding" style="text-align: right;">
							<div class="ctrlBtn_group">
								<c:choose>
									<c:when test="${sessionID eq 'admin'}">
										<a class="btn btn-secondary"
											href="./modify.do?bt=${bt}&cp=${cp}&pi=${pi}&mc=1">Modify</a>
										<a class="btn btn-secondary"
											href="./deletePost.do?bt=${bt}&cp=${cp}&pi=${pi}" onclick="return confirm('Are you sure you want to delete this ?');">Delete</a>
										<c:choose>
											<c:when test="${bt eq null}">
												<a class="btn btn-secondary" href="./index.do">List</a>
											</c:when>
											<c:when test="${bt ne null}">
												<a class="btn btn-secondary"
													href="./portList.do?bt=${bt}&cp=${cp}">List</a>
											</c:when>
										</c:choose>
									</c:when>
									<c:when test="${sessionID ne 'admin'}">
										<c:choose>
											<c:when test="${bt eq null}">
												<a class="btn btn-secondary" href="./index.do">List</a>
											</c:when>
											<c:when test="${bt ne null}">
												<a class="btn btn-secondary"
													href="./portList.do?bt=${bt}&cp=${cp}">List</a>
											</c:when>
										</c:choose>
									</c:when>
								</c:choose>



								<%-- <c:choose>
								<c:when test="${sessionID eq 'admin'}">
									<a class="btn btn-secondary"
										href="./postDelete.do?boardType=${boardType}&postIndex=${postIndex}">삭제</a>
								</c:when>
							</c:choose> --%>
							</div>
						</div>
					</div>
					<hr>
					<div id="row" class="marginRow">
						<h5 class="post-title">Started Date : ${blist.startedDate} -
							Finished Date : ${blist.finishedDate}</h5>
						<h5 class="post-title">
							Github URL : <a href="${blist.gitUrl}">${blist.gitUrl}</a>
						</h5>
						<h5 class="post-title">
							Access URL : <a href="${blist.serverUrl}">${blist.serverUrl}</a>
						</h5>
						<c:choose>
							<c:when test="${blist.projectType eq 1}">
								<h5 class="post-title">Project Type : Web Application</h5>
							</c:when>
							<c:when test="${blist.projectType eq 2}">
								<h5 class="post-title">Project Type : Mobile Application</h5>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${blist.careerCheck eq 1}">
								<h5 class="post-title">Project of Practical Experience</h5>
							</c:when>
							<c:when test="${blist.careerCheck eq 2}">
								<h5 class="post-title">Project of Personal Studying</h5>
							</c:when>
						</c:choose>
					</div>
					<div id="row" class="marginRow">
						<div class="entry-content" style="overflow: hidden;">
							<hr>
							<div>
								<h4 class="post-title">Summary :</h4>
								<h5 class="post-title">${blist.summary}</h5>
							</div>
						</div>
					</div>
					<div id="row" class="marginRow">
						<hr>
						<h4 class="post-title">Content :</h4>
						<h5 class="post-title">${blist.content}</h5>
						<hr>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<div id="footer">
		<jsp:include page="./footer.jsp" flush="false" />
	</div>
	<script>

	</script>
</body>
</html>