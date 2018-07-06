<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<c:set var="sessionID" value="${sessionID}" scope="session" />
<c:out value="${sessionID}" />
<c:set var="sessionPW" value="${sessionPW}" scope="session" />
<c:out value="${sessionPW}" />

<nav id="nav" class="navbar navbar-default">
	<div class="container">
		<div class="optionMenu">
			<button type="button" onclick="addBookmark()">즐겨찾기</button>
		</div>
		<div class="navbar-header">
			<i class="helper"></i>
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-collapse" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"> <img
				src="./resources/images/logo_perfectdatasystem.png"
				alt="PDS | 퍼펙트데이타시스템(주)" />
			</a>
		</div>
		<div id="navbar-collapse" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="./mainBody.do" class="nav_Home nav_mainmenu">
						<span>홈으로</span>
				</a></li>
				<li class="dropdown"><a href="#"
					class="nav_Info dropdown-toggle nav_mainmenu graycolor"
					data-toggle="dropdown"> <span>회사소개</span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="./comIntroBody.jsp?pageType=summary">회사개요</a></li>
						<li><a href="./comIntroBody.jsp?pageType=trees">조직도</a></li>
						<li><a href="./comIntroBody.jsp?pageType=history">회사연혁</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="./comIntroBody.jsp?pageType=partners">협력업체</a></li>
						<li><a href="./comIntroBody.jsp?pageType=techs">보유기술</a></li>
						<li><a href="./comIntroBody.jsp?pageType=products">보유제품</a></li>
						<li><a href="./comIntroBody.jsp?pageType=copyrights">저작권</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="./comIntroBody.jsp?pageType=maps">회사약도</a></li>
					</ul></li>
				<li class="dropdown"><a href="#"
					class="nav_Product dropdown-toggle nav_mainmenu graycolor"
					data-toggle="dropdown"> <span>제품소개</span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="./productIntroBody.jsp?pageType=agent1">대리점 제품군</a></li>
						<li><a href="./productIntroBody.jsp?pageType=mobile">모바일 제품군</a></li>
						<li><a href="./productIntroBody.jsp?pageType=black">블랙박스 제품군</a></li>
					</ul></li>
				<li class="dropdown"><a href="#"
					class="nav_Sold dropdown-toggle nav_mainmenu graycolor"
					data-toggle="dropdown"> <span>납품실적</span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="./supplyIntro.jsp?pageType=agent">대리점</a></li>
						<li><a href="./supplyIntro.jsp?pageType=mobile">모바일</a></li>
						<li><a href="./supplyIntro.jsp?pageType=black">블랙박스</a></li>
						<li><a href="./supplyIntro.jsp?pageType=etc">기타</a></li>
					</ul></li>
			</ul>
			<!-- 로그인, 게시판 -->
			<ul class="nav navbar-nav navbar-right">
				<li>
					<!--  로그인 버튼 --> <c:choose>
						<c:when test="${sessionID eq null}">
							<a href="./login.jsp" class="nav_Login nav_mainmenu"> <span
								style="background-position: -110px -16px;">로그인</span>
							</a>
						</c:when>
						<c:otherwise>
							<a id="btnLogOut" class="nav_Logout nav_mainmenu"
								href="./logout.jsp"> <span
								style="background-position: 0px -16px;">로그아웃</span>
							</a>
						</c:otherwise>
					</c:choose>

				</li>
				<li class="dropdown"><a href="#"
					class="nav_QnA dropdown-toggle nav_mainmenu" data-toggle="dropdown">
						<span>고객지원센터</span><i class="caret"></i>
				</a>
					<ul class="dropdown-menu">
						<li><a href="./blist.do?boardType=oftenQue&cPage=1&listType=all">자주하는 질문</a></li>
						<li><a href="./noticeRead.do?boardType=notice&cPage=1">공지사항</a></li>
					</ul></li>
			</ul>
			<!-- // 로그인, 게시판 -->
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>