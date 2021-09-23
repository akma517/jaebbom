<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	//검색 키워드의 한글 깨짐 현상을 방지하고자 설정, tomcat의 server.xml또한 바꿔 줘야함 
	//(서버 포트 번호와 동일한 포트 번호를 인자로 가지는 <connector> 태그에 URIEncoding="UTF-8"를 설정해야 함)
	request.setCharacterEncoding("UTF-8");

	// for each문으로 이름을 받고 벨류에는 넘버를 넣어야 하기에 따로 각 리스트마다 사용할 인덱스 변수를 초기화
	int categoryListBigIndex = 1;
	int categoryListSmallIndex = 1;
	int addressListBigIndex = 1;
	int addressListSmallIndex = 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>talentListPage</title>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link
	href="${pageContext.request.contextPath}/resources/css/jaebbom.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<!-- 검색용 -->
<c:url var="searchTalentListURL" value="/talent/talentListPage.do">
	<c:param name="searchType" value="${search.searchType }" />
	<c:param name="area1_num" value="${search.area1_num}" />
	<c:param name="area2_num" value="${search.area2_num}" />
	<c:param name="category1_num" value="${search.category1_num}" />
	<c:param name="category2_num" value="${search.category2_num}" />
</c:url>
<!-- 페이징용 -->
<c:url var="pagingTalentListURL" value="/talent/talentListPage.do"></c:url>
<!-- 상세 보기용 -->
<c:url var="getTalentPageURL" value="/talent/talentPage.do">
	<c:param name="talent_num" value="" />
</c:url>
<script type="text/javascript">
		/* <!--페이지 보기 --> */
		function fn_talentView(talent_num) {
			let url = "${getTalentPageURL}";
			url += talent_num;
			location.href = url;
		}
		
		/* <!-- 이전 버튼 --> */
		function fn_prev(page, range, rangeSize, searchType, keyword,
				area1_num, area2_num, category1_num, category2_num){
			page = ((range - 1) * rangeSize) + 1;
			range = range - 1;
			let url = "${pagingTalentListURL}";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&rangeSize=" + rangeSize;
			url = url + "&area1_num=" + area1_num;
			url = url + "&area2_num=" + area2_num;
			url = url + "&category1_num=" + category1_num;
			url = url + "&category2_num=" + category2_num;
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
			location.href = encodeURI(url);
		}
		
		/* <!-- 페이징 버튼 --> */
		function fn_paging(page, range, rangeSize, searchType, keyword,
				area1_num, area2_num, category1_num, category2_num){
			let url = "${pagingTalentListURL}";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&rangeSize=" + rangeSize;
			url = url + "&area1_num=" + area1_num;
			url = url + "&area2_num=" + area2_num;
			url = url + "&category1_num=" + category1_num;
			url = url + "&category2_num=" + category2_num;
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
			location.href = encodeURI(url);	
		}
	
		/* <!-- 다음 버튼 --> */
		function fn_next(page, range, rangeSize, searchType, keyword,
			area1_num, area2_num, category1_num, category2_num){
			page = parseInt((range * rangeSize)) + 1;
			range = parseInt(range) + 1;
			let url = "${pagingTalentListURL}";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&rangeSize=" + rangeSize;
			url = url + "&area1_num=" + area1_num;
			url = url + "&area2_num=" + area2_num;
			url = url + "&category1_num=" + category1_num;
			url = url + "&category2_num=" + category2_num;
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
			location.href = encodeURI(url);
		}

		/* 	<!-- 검색 이벤트 --> */
		$(document).on('click', '#btnSearch', function(e){
			e.preventDefault();
			let keyword = $("#keyword").val();
			let url = "${searchTalentListURL}";
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
		<h2 class="servicelistheadname">재능을 선택하세요</h2>
		<main id="serviceListBoard" class="servicelistboard">
			<div class="w-form">
				<form id="searchBox" name="searchBox" class="serviceboardcategory">
					<div class="category1">
						<label for="name" class="servicelistboardlabel">재능 종류</label> <select
							id="category1_num" name="category1_num"
							class="bigservicecategory w-select">
							<option value="0">전체</option>
							<c:forEach var="categoryListBigItem" items="${categoryListBig}">
								<option value="<%=categoryListBigIndex++ %>">${categoryListBigItem}</option>
							</c:forEach>
						</select>
					</div>
					<div class="category">
						<label for="name" class="servicelistboardlabel">재능 상세 종류</label> <select
							id="category2_num" name="category2_num"
							class="smallservicecategory w-select">
							<option value="0">전체</option>
							<c:forEach var="categoryListSmallItem" items="${categoryListSmall}">
								<option value="<%=categoryListSmallIndex++ %>">${categoryListSmallItem}</option>
							</c:forEach>
						</select>
					</div>
					<div class="category">
						<label for="name" class="servicelistboardlabel">지역</label> <select
							id="area1_num" name="area1_num"
							class="bigaddresscategory w-select">
							<option value="0">전체</option>
							<c:forEach var="addressListBigItem" items="${addressListBig}">
								<option value="<%=addressListBigIndex++ %>">${addressListBigItem}</option>
							</c:forEach>
						</select>
					</div>
					<div class="category">
						<label for="name" class="servicelistboardlabel">상세 지역</label> <select
							id="area2_num" name="area2_num"
							class="smalladdresscategory w-select">
							<option value="0">전체</option>
							<c:forEach var="addressListSmallItem" items="${addressListSmall}">
								<option value="<%=addressListSmallIndex++ %>">${addressListSmallItem}</option>
							</c:forEach>
						</select>
					</div>
					<div class="category">
						<label for="name" class="servicelistboardlabel">재능 검색</label> <select
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
								maxlength="256" placeholder="재능 이름을 입력해 주세요." id="keyword"
								name="keyword" autocomplete="off" />
							<button name="btnSearch" class="searchservicebutten w-button">검색</button>
						</div>
					</div>
				</form>
			</div>
			<div class="servicelist w-container">
				<c:forEach var="talent" items="${talentList}">
					<div class="talentlistblock">
						<h2 class="talentlistblockheading">
							<a class="hoverButton" href="#"
								onClick="fn_talentView('${talent.talent_num}')">${talent.title}</a>
						</h2>
						<div class="talentlistblocksubtitle">
							<div class="talentlistblockcategory">
								${talent.category1} | ${talent.category2} | ${talent.area1} |
								${talent.area2}<br />
							</div>
							<div class="talentlistblockprovider">${talent.writer}</div>
						</div>
						<div class="talentPay" align="right" style="margin-right: 10px;">
							${talent.pay}원</div>
					</div>
				</c:forEach>
			</div>

			<!--  페이징  -->
			<div class="talentlistcheck">
				<div class="pageMoveBlock">
					<ul class="paging">
						<c:if test="${paging.prev}">
							<li class="page-item"><a class="page-link" href="#"
								onClick="fn_prev('${paging.page}', '${paging.range}', '${paging.rangeSize}', '${search.searchType }', '${search.keyword }','${search.area1_num}', '${search.area2_num}', '${search.category1_num}', '${search.category2_num}')">이전</a>
							</li>
						</c:if>
						<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
							var="idx">
							<span class="page-item"
								<c:out value="${pagingn.page == idx ? 'active' : ''}"/>>
								<a class="page-link" href="#"
								onClick="fn_paging('${idx}', '${paging.range}', '${paging.rangeSize}', '${search.searchType }', '${search.keyword }','${search.area1_num}', '${search.area2_num}', '${search.category1_num}', '${search.category2_num}')">
									${idx} </a>
							</span>
						</c:forEach>
						<c:if test="${paging.next}">
							<li class="page-item"><a class="page-link" href="#"
								onClick="fn_next('${paging.range}', '${paging.range}', '${paging.rangeSize}', '${search.searchType }', '${search.keyword }', '${search.area1_num}', '${search.area2_num}', '${search.category1_num}', '${search.category2_num}')">다음</a>
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