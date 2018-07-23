<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="sessionID" value="${sessionID}" scope="session" />
<!-- Static navbar -->
<div class="navbar navbar-inverse navbar-static-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="./index.do">Jun's Portfolio</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${sessionID ne null}">
						<li><a href="./logout.do">Logout</a>
					</c:when>
					<c:when test="${sessionID eq null}">
						<li><a href="./login.jsp">Login</a></li>
					</c:when>
				</c:choose>
				<li><a href="./aboutme.jsp">About me</a></li>
				<li><a href="./certi.jsp">Certification</a></li>
				<li><a href="./portList.do?bt=0&cp=1">Portfolio</a></li>
				<li><a href="./resources/resume/(kor_resume_cv)Chae_Young_Jun.pdf">Korean Resume</a></li>
				<li><a href="./resources/resume/(eng_resume_cv)Chae_Young_Jun.pdf">English Resume</a></li>
				<!-- <li><a href="./contact.jsp">Contact</a></li> -->
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</div>