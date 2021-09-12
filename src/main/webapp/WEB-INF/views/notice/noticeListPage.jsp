<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	//검색 키워드의 한글 깨짐 현상을 방지하고자 설정, tomcat의 server.xml또한 바꿔 줘야함 
	//(서버 포트 번호와 동일한 포트 번호를 인자로 가지는 <connector> 태그에 URIEncoding="UTF-8"를 설정해야 함)
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>noticeListPage</title>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link
	href="${pageContext.request.contextPath}/resources/css/jaebbom.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<!-- 검색용 -->
<c:url var="searchNoticeListURL" value="/notice/noticeListPage.do">
	<c:param name="searchType" value="${search.searchType }" />
</c:url>
<!-- 페이징용 -->
<c:url var="pagingNoticeListURL" value="/notice/noticeListPage.do"></c:url>
<!-- 상세 보기용 -->
<c:url var="getNoticePageURL" value="/notice/noticePage.do">
	<c:param name="notice_num" value="" />
</c:url>
<script type="text/javascript">
		/* <!--페이지 보기 --> */
		function fn_noticeView(notice_num) {
			let url = "${getNoticePageURL}";
			url += notice_num;
			location.href = url;
		}
		
		/* <!-- 이전 버튼 --> */
		function fn_prev(page, range, rangeSize, searchType, keyword,){
			page = ((range - 1) * rangeSize) + 1;
			range = range - 1;
			let url = "${pagingNoticeListURL}";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&rangeSize=" + rangeSize;
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
			location.href = encodeURI(url);
		}
		
		/* <!-- 페이징 버튼 --> */
		function fn_paging(page, range, rangeSize, searchType, keyword,){
			let url = "${pagingNoticeListURL}";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&rangeSize=" + rangeSize;
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
			location.href = encodeURI(url);	
		}
	
		/* <!-- 다음 버튼 --> */
		function fn_next(page, range, rangeSize, searchType, keyword,){
			page = parseInt((range * rangeSize)) + 1;
			range = parseInt(range) + 1;
			let url = "${pagingNoticeListURL}";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&rangeSize=" + rangeSize;
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
			location.href = encodeURI(url);
		}

		/* 	<!-- 검색 이벤트 --> */
		$(document).on('click', '#btnSearch', function(e){
			e.preventDefault();
			let keyword = $("#keyword").val();
			let url = "${searchNoticeListURL}";
			url += "?keyword=" + encodeURI(keyword);
			
			location.href = encodeURI(url);
		});
	</script>
<style>
.hoverButton {
	text-decoration: none;
	color: black;
}

.hoverButton:hover {
	color: violet;
}

.talentlistblock:hover {
	border-color: violet;
}

.page-item {
	margin-left: 5px;
	margin-right: 5px;
}

.page-link {
	text-decoration: none;
}

.page-link:hover {
	color: violet;
}

.pageMoveBlock {
	align-content: "center;"
}

ul {
	padding-left: 0px;
	margin-bottom: 0px;
}

.w-input, .w-select {
	display: block;
	width: 100%;
	height: 38px;
	padding: 8px 12px;
	margin-bottom: 10px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #333333;
	vertical-align: middle;
	background-color: #ffffff;
	border: 1px solid #cccccc;
	max-width: 200px;
}

.servicelistboard {
	min-width: 860px;
}

.w-container:before, .w-container:after {
	content: " ";
	display: table;
	grid-column-start: 1;
	grid-row-start: auto;
	grid-column-end: 1;
	grid-row-end: auto;
}

.servicelist {
	display: -ms-grid;
	display: grid;
	overflow: auto;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column;
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: center;
	justify-items: stretch;
	-webkit-box-align: stretch;
	-webkit-align-items: stretch;
	-ms-flex-align: stretch;
	align-items: stretch;
	-webkit-align-content: center;
	-ms-flex-line-pack: center;
	align-content: center;
	grid-auto-columns: 1fr;
	grid-column-gap: 16px;
	grid-row-gap: 16px;
	grid-template-areas: "Area";
	-ms-grid-columns: 1fr 16px 1fr;
	grid-template-columns: 1fr;
	-ms-grid-rows: auto 16px auto 16px auto;
	grid-template-rows: auto;
}

.talentlistblock {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	overflow: visible;
	padding: 5px;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: row;
	-webkit-box-pack: center;
	-webkit-justify-content: center;
	-ms-flex-pack: center;
	justify-content: space-between;
	-webkit-box-align: stretch;
	-webkit-align-items: stretch;
	-ms-flex-align: stretch;
	align-items: center;
	border-style: solid;
	border-width: 2px;
	border-color: #1990ee;
	border-radius: 10px;
	background-color: #fff;
	flex-wrap: nowrap;
}

.talentlistblockheading {
	max-width: 700px;
	margin: 5px;
	margin-left: 40px;
	padding: 5px;
	border-style: none;
	font-size: 22px;
	text-align: left;
}

.body {
	margin: 0px;
	padding: 45px;
}
</style>
</head>
<body class="body">
	<c:choose>
		<c:when test="${sessionScope.login == null}">	
			<header id="FrontBar" class="frontbar">
				<div class="container-5 w-container">
					<a href="${pageContext.request.contextPath}" class="button-21 w-button w--current"> 
						<strong> 
							<em class="italic-text-2">재뿜</em>
						</strong>
					</a>
					<a href="${pageContext.request.contextPath}/user/loginPage.do"class="button-6 w-button">
						<strong class="bold-text-2">로그인</strong>
					</a> <a href="${pageContext.request.contextPath}/user/joinPage.do"class="button-5 w-button">
						<strong class="bold-text">회원가입</strong>
					</a>
				</div>
			</header>
			</c:when>
		<c:otherwise>
			<header id="FrontBar" class="frontbar" style="padding:20px">	
				<div class="container-5 w-container">
					<a href="${pageContext.request.contextPath}" class="button-21 w-button w--current"> 
						<strong> 
							<em class="italic-text-2">재뿜</em>
						</strong>
					</a>		
					<a href="${pageContext.request.contextPath}/talent/talentRegPage.do"
						class="regist w-button"> <strong>재능 등록하기</strong></a> 
					<a href="${pageContext.request.contextPath}/notice/noticeRegPage.do"
						class="regist w-button"> <strong>공지사항 등록하기</strong></a> 
					<a href="#" class="button-7 w-button"> <strong class="bold-text-4">등록한 재능</strong></a> 
					<a href="#" class="button-7 w-button"> <strongclass="bold-text-4">이용 중인 재능</strong></a>
					<a href="${pageContext.request.contextPath}/user/myPage.do"
						class="button-6 w-button"> <strong class="bold-text-2">마이페이지</strong></a> 
					<a href="${pageContext.request.contextPath}/user/logout.do"
						class="button-5 w-button"> <strong class="bold-text">로그아웃</strong></a>
				</div>
			</header>
		</c:otherwise>
	</c:choose>
	<div id="serviceBoardBlock" class="serviceboardblock">
		<h2 class="servicelistheadname">공지사항</h2>
		<main id="serviceListBoard" class="servicelistboard">
			<div class="w-form">
				<form id="searchBox" name="searchBox" class="serviceboardcategory">
					<div class="category">
						<label for="name" class="servicelistboardlabel">검색</label> <select
							id="searchType" name="searchType"
							class="smalladdresscategory w-select">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="writer">작성자</option>
						</select>
					</div>
					<div class="category">
						<div class="searchservicblock">
							<input type="text" class="searchserviceinput w-input"
								maxlength="256" placeholder="키워드를 입력해 주세요." id="keyword"
								name="keyword" autocomplete="off" />
							<button name="btnSearch" class="searchservicebutten w-button">검색</button>
						</div>
					</div>
				</form>
			</div>
			<div class="servicelist w-container">
				<c:forEach var="notice" items="${noticeList}">
					<div class="talentlistblock">
						<p class="talentlistblockheading">
							<a class="hoverButton" href="#"
								onClick="fn_noticeView('${notice.notice_num}')">${notice.title}</a>
						</p>
						<div class="talentPay" align="right" style="margin-right: 10px;">
							${notice.write_date}<br> ${notice.writer}
						</div>
					</div>
				</c:forEach>
			</div>

			<!--  페이징  -->
			<div class="talentlistcheck">
				<div class="pageMoveBlock">
					<ul class="paging">
						<c:if test="${paging.prev}">
							<li class="page-item"><a class="page-link" href="#"
								onClick="fn_prev('${paging.page}', '${paging.range}', '${paging.rangeSize}', '${search.searchType }', '${search.keyword }')">이전</a>
							</li>
						</c:if>
						<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
							var="idx">
							<span class="page-item"
								<c:out value="${pagingn.page == idx ? 'active' : ''}"/>>
								<a class="page-link" href="#"
								onClick="fn_paging('${idx}', '${paging.range}', '${paging.rangeSize}', '${search.searchType }', '${search.keyword }')">
									${idx} </a>
							</span>
						</c:forEach>
						<c:if test="${paging.next}">
							<li class="page-item"><a class="page-link" href="#"
								onClick="fn_next('${paging.range}', '${paging.range}', '${paging.rangeSize}', '${search.searchType }', '${search.keyword }')">다음</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</main>
	</div>
<%-- 
	<footer id="footer" class="footer">
		<div class="container w-container">
			<a href="${pageContext.request.contextPath}/talent/talentRegPage.do"
				class="regist w-button"> <strong>재능 등록하기</strong>
			</a> <a href="${pageContext.request.contextPath}/notice/noticeRegPage.do"
				class="regist w-button"> <strong>공지사항 등록하기</strong>
			</a> <a href="#" class="button-7 w-button"> <strong
				class="bold-text-4">등록한 재능</strong>
			</a> <a href="#" class="button-7 w-button"> <strong
				class="bold-text-4">이용 중인 재능</strong>
			</a>
		</div>
	</footer>
 --%>
 </body>
</html>