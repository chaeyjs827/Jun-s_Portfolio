<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="./includeGroup.jsp"%>
</head>
<body>
	<div id="wholePage">
		<jsp:include page="./topMenu.jsp" flush="false" />
	</div>

	<header class="top_image"
		style="background-image:url(./resources/images/bg_main_min.jpg); position:relative;">
	<div class="container">
		<div class="row">
			<div class="site-heading">
				<div>
					<p
						style="font-size: 36px; font-weight: bold; line-height: 50px; color: #fff; text-shadow: 0 -1px 10px #000;">
						1996년 창업하여, 식.음료 IT솔루션을<br />전문적으로 연구개발, 공급하고 있습니다.
					</p>
				</div>
			</div>
		</div>
	</div>
	<div id="gradient_white"
		style="width: 100%; position: absolute; bottom: 0; height: 57px;"></div>
	</header>

	<div id="contentDiv">
		<section class="container"> <!-- left menu -->
		<div class="col-md-3 col-lg-3">
			<!-- Quick Menu -->
			<div class="quick-btn" style="text-align: center;">
				<a href="#"
					class="btn_callcenter col-lg-12 col-md-12 col-sm-6 col-xs-6 nopadding"
					onclick="openWin();"> <i class="icon-callcenter"></i> <span>고객지원</span>
				</a> <a href="./blist.do?boardType=oftenQue&cPage=1&listType=all"
					class="btn_qna col-lg-12 col-md-12 col-sm-6 col-xs-6 nopadding">
					<i class="icon-qna"></i> <span>자주하는 질문</span>
				</a>
			</div>
			<!-- // Quick Menu -->
			<!-- 택배 조회 -->
			<div class="delivery">
				<!-- 택배 배송, 레이아웃 예제 떄문에 남겨놓음 -->
				<h5>택배 배송 조회</h5>
				<div name="door_to_door_frm" style="overflow: hidden;">
					<select class="form-control" name="dtd_select" id="dtd_select"
						onchange="ChangeOption();">
						<option value="CJ GLS">CJ GLS</option>
					</select>
					<div class="input-group" style="margin-top: 5px;">
						<input type="text" class="form-control" id="txt_number_query"
							onclick="this.value=''" placeholder="'-'를 제외하고 입력하세요."> <span
							class="input-group-btn"> <input class="btn btn-primary"
							type="submit" onclick="doorToDoorSearch(); return false;"
							value="조회">
						</span>
					</div>
				</div>
			</div>
			<!-- // 택배 조회 -->
			<!-- 은행 계좌 -->
			<div>
				<div class="bank">
					<img src="./resources/images/bank_NH.png">
					<p>( 예금주:퍼펙트데이타시스템 )</p>
					<br>
					<div>
						<span>소모품</span>
						<h4>317-0004-2398-51</h4>
						<br> <span>사용료</span>
						<h4>565-01-021091</h4>
					</div>
				</div>
			</div>
			<!-- // 은행 계좌 -->
		</div>

		<!-- 자주하는 질문, 공지사항 -->
		<div id="home_listdata" class="col-md-7 col-lg-7 nopadding">
			<!-- 자주하는 질문 -->
			<div class="col-sm-6 col-md-6 col-md-6">
				<h4>자주하는 질문</h4>
				<div style="overflow: hidden;">
					<table id="table_news" class="table m-t-20">
						<thead>
							<tr>
								<th style="display: none";>제목</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${mainOftenQB}">
								<tr>
									<td class="text-overflow"><a
										href="./bRead.do?boardType=${boardTypeOften}&postIndex=${row.postIndex}"><c:out
												value="${row.postTitle}" /></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="./blist.do?boardType=oftenQue&cPage=1&listType=all"
						class="moreInfo" style="float: right;">MORE &gt;</a>
				</div>
			</div>
			<!-- // 자주하는 질문 -->
			<!-- 공지사항 -->
			<div class="col-sm-6 col-md-6 col-md-6">
				<h4>공지사항</h4>
				<div style="overflow: hidden;">
					<table id="table_notice" class="table m-t-20">
						<thead>
							<tr>
								<th style="display: none;">제목</th>
							</tr>
						</thead>
						<tbody>
							<!--noticeObject 이건 page 속성에 있던 애튜로뷰트 값이라    -->
							<c:forEach var="rows" items="${noticeObject}">
								<tr>
									<td class="text-overflow"><a
										href="./bRead.do?boardType=${boardTypeNotice}&postIndex=${rows.postIndex}"><c:out
												value="${rows.postTitle}" /></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="./noticeRead.do?boardType=notice&cPage=1I'"
						class="moreInfo" style="float: right;">MORE &gt;</a>
				</div>
			</div>
			<!-- // 공지사항 -->
		</div>
		<!-- // 자주하는 질문, 공지사항 --> <!-- PDS 개발제품 -->
		<div id="home_product" class="col-md-2 col-lg-2">
			<div class="noliststyle">
				<h4>PDS 개발제품</h4>
				<ul>
					<li><a href="./productIntroBody.jsp?pageType=agent1"
						class="m-t-20"><img src="./resources/images/banner_s2.jpg"
							alt="S2"></a></li>
					<li><a href="./productIntroBody.jsp?pageType=agent3"
						class="m-t-20"><img src="./resources/images/banner_s2lite.jpg"
							alt="S2/Lite"></a></li>
					<li><a href="./productIntroBody.jsp?pageType=agent2"
						class="m-t-20"><img src="./resources/images/banner_m2.jpg"
							alt="M2"></a></li>
					<li><a href="./productIntroBody.jsp?pageType=agent1"
						class="m-t-20"><img src="./resources/images/banner_pams21.jpg"
							alt="pams21"></a></li>
					<li><a href="./productIntroBody.jsp?pageType=black"
						class="m-t-20"><img src="./resources/images/banner_logpro.jpg"
							alt="Logpro"></a></li>
					<li><a href="./productIntroBody.jsp?pageType=black"
						class="m-t-20"><img
							src="./resources/images/banner_ptracks.jpg" alt="PTracks"></a></li>
				</ul>
			</div>
		</div>
		<div id="divContaiPopup" class="table-responsive"></div>
		</section>
	</div>

	<jsp:include page="./footer.jsp" flush="false" />
	</footer>

	<div id="popUp">
		<div style="height: 370px;">
			<p>퍼펙트 스프링 기반 홈페이지 입니다.</p>
			<p></p>
			<p></p>
			<p> 현재 DB에는 admin 밖에 없습니다 </p>
			<p> ID는 'admin' </p>
			<p> PW는 '12345'로 로그인 해주세요</p>
			<div>
				<div id="close" style="width: 100px; margin: auto;"><b>팝업 창 닫기</b></div>
			</div>
		</div>
	</div>
</body>
</html>