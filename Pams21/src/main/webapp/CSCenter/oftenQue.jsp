<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="container">
	<div class="col-md-2 nopadding">

		<div class="sidebar_nav">
			<h3 style="margin-bottom: 5px;">고객지원센터</h3>
			<span class="text-muted">Help Center</span>
			<hr>
			<ul class="nav" id="my-collapse-nav">
				<li id="PROD" class="active"><a
					href="./blist.do?boardType=oftenQue&cPage=1&listType=all"
					value="PROD">자주하는 질문</a></li>
				<li id="NOTICE"><a
					href="./noticeRead.do?boardType=notice&cPage=1">공지사항</a></li>
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
	<div class="col-md-10" style="padding: 0; padding-left: 40px;">
		<div style="overflow: hidden;">
			<div class="col-md-7 col-lg-8">
				<h2 class="post-title">자주하는 질문</h2>
				<p class="text-muted">PDS 제품에 자주하는 질문을 모아두었습니다.</p>
			</div>
			<div class="col-md-5 col-lg-4 input-group" style="margin-top: 20px;">
				<input id="txtSearch" type="text" class="form-control"
					placeholder="검색하실 단어를 입력해주세요" aria-describedby="basic-addon2"
					style="font-size: 12px;" onkeydown="EnterKeyPress(event);" value="">
				<a class="input-group-addon" onclick="searchWord()" id="btnSearch">검색</a>
			</div>
		</div>
		<hr>

		<script>
			function searchWord() {
				var getWord = $("#txtSearch").val();

				if (getWord.length < 1) {
					alert('검색어를 입력해 주세요');
					$("#txtSearch").focus();
					event.preventDefault();
					return;
				}
				console.log(getWord);
				location.href = "blist.do?boardType=oftenQue&cPage=1&listType=all&searchWord="
						+ getWord;
			}

			$(document).ready(
					function() {
						var url = location.href;
						var parameters = (url.slice(url.indexOf('?') + 1,
								url.length)).split('&');

						console.log("url : " + url);
						/* for(var i=0; i<parameters.length; i++) {
							var listType = parameters[i].split('=')[1];
							console.log("listType[1] : " + listType);
						} */
						var listType = parameters[2].split('=')[1];
						console.log("listType[1] : " + listType);

						if (listType == "all") {
							$("#selector ul li:eq(0)").addClass('active')
									.siblings().removeClass('active');
						} else if (listType == "S2Lite") {
							$("#selector ul li:eq(1)").addClass('active')
									.siblings().removeClass('active');
						} else if (listType == "M2") {
							$("#selector ul li:eq(2)").addClass('active')
									.siblings().removeClass('active');
						} else if (listType == "S2") {
							$("#selector ul li:eq(3)").addClass('active')
									.siblings().removeClass('active');
						} else if (listType == "TAMOS") {
							$("#selector ul li:eq(4)").addClass('active')
									.siblings().removeClass('active');
						} else if (listType == "PDA") {
							$("#selector ul li:eq(5)").addClass('active')
									.siblings().removeClass('active');
						} else if (listType == "PHONE") {
							$("#selector ul li:eq(6)").addClass('active')
									.siblings().removeClass('active');
						} else if (listType == "TEMP") {
							$("#selector ul li:eq(7)").addClass('active')
									.siblings().removeClass('active');
						} else if (listType == "BUY") {
							$("#selector ul li:eq(8)").addClass('active')
									.siblings().removeClass('active');
						} else if (listType == "ETC") {
							$("#selector ul li:eq(9)").addClass('active')
									.siblings().removeClass('active');
						}
					});
		</script>

		<div class="container">
			<div class="btn_write">
				<c:choose>
					<c:when test="${sessionID eq 'admin'}">
						<a href="./postWrite.jsp" class="btn btn-success-outline">글쓰기</a>
					</c:when>
				</c:choose>
			</div>
			<div id="selector" class="p-b-20" style="padding: 0 !important;">
				<ul>
					<li><a class="mybtn"
						href="./blist.do?boardType=oftenQue&cPage=1&listType=all" id="ALL"">전체</a></li>
					<li><a class="mybtn"
						href="./blist.do?boardType=oftenQue&cPage=1&listType=S2Lite"
						id="S2LITE">S2Lite</a></li>
					<li><a class="mybtn"
						href="./blist.do?boardType=oftenQue&cPage=1&listType=M2" id="M2">M2</a></li>
					<li><a class="mybtn"
						href="./blist.do?boardType=oftenQue&cPage=1&listType=S2" id="S2">S2</a></li>
					<li><a class="mybtn"
						href="./blist.do?boardType=oftenQue&cPage=1&listType=TAMOS"
						id="TAMOS">TAMOS</a></li>
					<li><a class="mybtn"
						href="./blist.do?boardType=oftenQue&cPage=1&listType=PDA" id="PDA">PDA</a></li>
					<li><a class="mybtn"
						href="./blist.do?boardType=oftenQue&cPage=1&listType=PHONE"
						id="PHONE">스마트폰</a></li>
					<li><a class="mybtn"
						href="./blist.do?boardType=oftenQue&cPage=1&listType=TEMP"
						id="TEMP">온도계</a></li>
					<li><a class="mybtn"
						href="./blist.do?boardType=oftenQue&cPage=1&listType=BUY" id="BUY">장비구매</a></li>
					<li><a class="mybtn"
						href="./blist.do?boardType=oftenQue&cPage=1&listType=ETC" id="ETC">기타</a></li>
				</ul>
			</div>
			<div id="displayNone">
				<table id="table_qna" class="table m-t-20">
					<c:out value="총 게시물 : ${totalTitles} 개" />
					<thead>
						<tr>
							<th class="width_No text_C">No</th>
							<th class="width_Writer text_C">구분</th>
							<th class="text_C qna_title">제목</th>
							<th class="width_Year text_C">등록일</th>
							<th class="width_File text_C"
								style="padding: 0; vertical-align: middle;">파일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="blist" items="${boardList}">
							<tr>
								<td class="text_C">${blist.postIndex}</td>
								<td class="text_C prod_gubun">${blist.postType}</td>
								<td class="qna_title"><a
									href="./bRead.do?boardType=${boardType}&postIndex=${blist.postIndex}">${blist.postTitle}</a></td>
								<td class="text_C">${blist.postRegiDate}</td>
								<td class="text_C" style="padding: 0; vertical-align: middle;">${blist.postFile}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:choose>
					<c:when test="${totalTitles eq 0}">
						Page 0 of 0
					</c:when>
					<c:when test="${currentPage ne 0}">
						Page ${currentPage} of ${totalPage}
					</c:when>
				</c:choose>


				<div class="pagination-container">
					<ul class="pagination">
						<c:forEach var="i" begin="1" end="${totalPage}" step="1">
							<c:choose>
								<c:when test="${i < currentPage}">
									<li><a
										href="./blist.do?boardType=oftenQue&cPage=${i}&listType=${paramListType}&searchWord=${searchWord}">${i}</a></li>
								</c:when>
								<c:when test="${i eq currentPage}">
									<li class="active"><a>${currentPage}</a></li>
								</c:when>
								<c:when test="${i > currentPage}">
									<li><a
										href="./blist.do?boardType=oftenQue&cPage=${i}&listType=${paramListType}&searchWord=${searchWord}">${i}</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>