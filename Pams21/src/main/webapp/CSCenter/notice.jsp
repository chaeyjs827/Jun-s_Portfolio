<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	function searchWord() {
		var getWord = $("#txtSearch").val();

		console.log(getWord);
		location.href = "noticeRead.do?boardType=notice&cPage=1&searchWord="
				+ getWord;
		
	}
</script>

<section class="container">
	<div class="col-md-2 nopadding">

		<div class="sidebar_nav">
			<h3 style="margin-bottom: 5px;">고객지원센터</h3>
			<span class="text-muted">Help Center</span>
			<hr>
			<ul class="nav" id="my-collapse-nav">
				<li id="PROD"><a
					href="./blist.do?boardType=oftenQue&cPage=1&listType=all"
					value="PROD">자주하는 질문</a></li>
				<li id="NOTICE" class="active"><a
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
				<h2 class="post-title">공지사항</h2>
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

		<div class="container">
			<div class="btn_write">
				<c:choose>
					<c:when test="${sessionID eq 'admin'}">
						<a href="./postWrite.jsp" class="btn btn-success-outline">글쓰기</a>
					</c:when>
				</c:choose>
			</div>
			<div id="displayNone">
				<table id="table_qna" class="table m-t-20">
					<c:out value="총 게시물 : ${totalTitles} 개" />
					<thead>
						<tr>
							<th class="width_No text_C">No</th>
							<th class="text_C qna_title">제목</th>
							<th class="width_Year text_C">등록일</th>
							<th class="width_File text_C"
								style="padding: 0; vertical-align: middle;">파일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="noticeRead" items="${boardList}">
							<tr>
								<td class="text_C">${noticeRead.postIndex}</td>
								<td class="qna_title"><a
									href="./bRead.do?boardType=${boardType}&postIndex=${noticeRead.postIndex}">${noticeRead.postTitle}</a></td>
								<td class="text_C">${noticeRead.postRegiDate}</td>
								<td class="text_C" style="padding: 0; vertical-align: middle;">${noticeRead.postFile}</td>
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
									<li><a href="./noticeRead.do?boardType=notice&cPage=${i}&searchWord=${searchWord}">${i}</a></li>
								</c:when>
								<c:when test="${i eq currentPage}">
									<li class="active"><a>${currentPage}</a></li>
								</c:when>
								<c:when test="${i > currentPage}">
									<li><a href="./noticeRead.do?boardType=notice&cPage=${i}&searchWord=${searchWord}">${i}</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>