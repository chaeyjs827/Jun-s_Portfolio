<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="./includeGroup.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<jsp:include page="./topMenu.jsp" flush="false" />

	<header class="top_image"
		style="background-image:url(./resources/images/bg_info_min.jpg); position:relative;">
	<div class="container">
		<div class="row">
			<div class="site-heading" style="height: 210px;"></div>
		</div>
	</div>
	<div id="gradient_white"
		style="width: 100%; position: absolute; bottom: 0; height: 57px;"></div>
	</header>

	<section class="container"> <c:forEach items="${rlist}"
		var="rlist">
		<div class="col-md-2 nopadding">

			<div class="sidebar_nav">
				<h3 style="margin-bottom: 5px;">고객지원센터</h3>
				<span class="text-muted">Help Center</span>
				<hr>
				<ul class="nav" id="my-collapse-nav">
					<c:choose>
						<c:when test="${boardType eq 'oftenQue'}">
							<li id="PROD" class="active"><a href="./blist.do?boardType=oftenQue&cPage=1&listType=all" value="PROD">자주하는
									질문</a></li>
							<li id="NOTICE"><a href="./noticeRead.do?boardType=notice&cPage=1">공지사항</a></li>
						</c:when>
						<c:when test="${boardType eq 'notice'}">
							<li id="PROD"><a
								href="./blist.do?boardType=oftenQue&cPage=1&listType=all">자주하는
									질문</a></li>
							<li id="NOTICE" class="active"><a
								href="./noticeRead.do?boardType=notice&cPage=1">공지사항</a></li>
						</c:when>
					</c:choose>

				</ul>
				<div class="sub_phnum container">
					<div>
						<p>
							<b>고객센터</b> 02-555-6695
						</p>
						<hr>
						<p>
							<b>이용시간</b>
						</p>
						<p>평일 09:00 ~ 18:00</p>
						<p>점심시간 12:00 ~ 13:00</p>
						<hr>
						<p>
							<b>팩스</b> 02-552-5868
						</p>
					</div>
				</div>
			</div>

		</div>

		<div class="col-md-10 write_form"
			style="padding: 0; padding-left: 40px;">
			<!-- 게시판 상단 -->
			<div style="overflow: hidden; position: relative;">
				<div>
					<h2 class="post-title">제목 : ${rlist.postTitle}</h2>
				</div>
				<div class="nopadding" style="text-align: right;">
					<div class="ctrlBtn_group">
						<a class="btn btn-secondary"
							href="./blist.do?boardType=${boardType}&cPage=1&listType=all">목록</a>
						<a class="btn btn-secondary"
							href="./postDelete.do?boardType=${boardType}&postIndex=${postIndex}"
							id="btnDelete">삭제</a>
						<a class="btn btn-secondary"
							href="#"
							id="btnDelete">수정</a>
					</div>
				</div>
			</div>
			<hr>
			<div class="entry-content" style="overflow: hidden;">
				<div class="pull-right">
					<a href="/Common/download?table=NOTICE&amp;filename="
						style="text-decoration: underline; display: inline-block;"></a>
					<p class="author">작성자 : ${rlist.postWriter}</p>
					<span class="comment-date vertical-divider">
						${rlist.postRegiDate}</span>
				</div>
			</div>
			<div class="entry-content qna_page">${rlist.postContent}</div>
			<hr>
		</div>
	</c:forEach> </section>


	<jsp:include page="./footer.jsp" flush="false" />

</body>
</html>