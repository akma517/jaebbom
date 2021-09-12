<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<meta charset="utf-8" />
<title>talentPage</title>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link
	href="${pageContext.request.contextPath}/resources/css/jaebbom.css"
	rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script>
		// 뒤로 가기
		$(document).on('click', '#backList', function(e){
			e.preventDefault();
			location.href="${pageContext.request.contextPath}/talent/talentListPage.do";
		});
		
		// 재능 업데이트(내용 변경)
		function fn_talentUpdate(talent_num){
			let url = "${pageContext.request.contextPath}/talent/talentUpdatePage.do";
			url = url + "?talent_num=" + talent_num;
			url = url + "&mode=edit";
			location.href = url;
		}
		
		// 재능 삭제
		function fn_talentDelete(talent_num){
			let url = "${pageContext.request.contextPath}/talent/talentDelete.do";
			url = url + "?talent_num=" + talent_num;
			location.href = url;
		}
		
		// 채팅하기
		function fn_chat(talent_num) {
			let url = "${pageContext.request.contextPath}/chat/chat.do";
			url +=  "?talent_num=" + talent_num;
			let newWin = window.open(url);
			newWin.focus();
		}
		
		// 리뷰 등록
		function fn_regReview(talent_num){
			let url = "${pageContext.request.contextPath}/talent/reviewRegPage.do";
			url = url + "?talent_num=" + talent_num;
			let newWin = window.open(url);
			newWin.focus();
		}
		
		// 리뷰 삭제
		function fn_reviewDelete(review_num, talent_num){
			let url = "${pageContext.request.contextPath}/talent/reviewDelete.do";
			url = url + "?review_num=" + review_num;
			url = url + "&talent_num=" + talent_num;
			location.href = url;
		}
		
		// 리뷰 신고
		function fn_report_review(review_num){
			let url = "${pageContext.request.contextPath}/reportPage.do";
			url = url + "?reivew_num=" + review_num;
			let newWin = window.open(url);
			newWin.focus();
		}
		
		// 재능 신고
		function fn_report_talent(talent_num){
			let url = "${pageContext.request.contextPath}/reportPage.do";
			url = url + "?talent_num=" + talent_num;
			let newWin = window.open(url);
			newWin.focus();
		}
		
		// 뒤로 가기
		$(document).on('click', '#backMain', function(e){
			e.preventDefault();
			location.href="${pageContext.request.contextPath}";
		});
		
		/* <!-- 이전 버튼 --> */
		function fn_prev(page, range, rangeSize, talent_num){
			page = ((range - 1) * rangeSize) + 1;
			range = range - 1;
			let url = "${pageContext.request.contextPath}/talent/talentPage.do";
			url = url + "?talent_num=" + talent_num;
			url = url + "&page=" + page;
			url = url + "&range=" + range;
			url = url + "&rangeSize=" + rangeSize;
			location.href = encodeURI(url);
		}
		
		/* <!-- 페이징 버튼 --> */
		function fn_paging(page, range, rangeSize, talent_num){
			let url = "${pageContext.request.contextPath}/talent/talentPage.do";
			url = url + "?talent_num=" + talent_num;
			url = url + "&page=" + page;
			url = url + "&range=" + range;
			url = url + "&rangeSize=" + rangeSize;
			location.href = encodeURI(url);	
		}
	
		/* <!-- 다음 버튼 --> */
		function fn_next(page, range, rangeSize, talent_num){
			page = parseInt((range * rangeSize)) + 1;
			range = parseInt(range) + 1;
			let url = "${pageContext.request.contextPath}/talent/talentPage.do";
			url = url + "?talent_num=" + talent_num;
			url = url + "&page=" + page;
			url = url + "&range=" + range;
			url = url + "&rangeSize=" + rangeSize;
			location.href = encodeURI(url);
		}
    </script>
<style>
.body {
	margin-top: 0px;
	padding: 0px;
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

.review_manage {
	text-decoration: none;
	color: black;
	font-size: 8px;
}

.review_manage:hover {
	color: violet;
}

.reviewwriter {
	text-align: right;
}

#write_date {
	font-size: 8px;
}

.review {
	text-align: center;
}
</style>
</head>
<body class="body">
	<header id="FrontBar" class="frontbar">
		<a href="${pageContext.request.contextPath}" class="button-21 w-button w--current"> 
			<strong> 
				<em class="italic-text-2">재뿜</em>
			</strong>
		</a>
		<c:choose>
			<c:when test="${sessionScope.login == null}">
				<div class="container-5 w-container">
					<a href="${pageContext.request.contextPath}/user/loginPage.do"class="button-6 w-button">
						<strong class="bold-text-2">로그인</strong>
					</a> <a href="${pageContext.request.contextPath}/user/joinPage.do"class="button-5 w-button">
						<strong class="bold-text">회원가입</strong>
					</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="container-5 w-container">
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
			</c:otherwise>
		</c:choose>
	</header>
	<div class="serviceboard container-6 w-container">
		<h1 class="heading-9">
			<c:out value="${talent.title}"></c:out>
		</h1>
		<div class="w-form">
			<form id="wf-form-Contact-Form" name="wf-form-Contact-Form"
				data-name="Contact Form">
				<div class="servicebaordgrid">
					<div id="w-node-_24ab8e2a-1c0f-b3b4-e68f-29eb56362e6b-1e040547"
						class="div-block-4">
						<h1 class="heading-6">재능 소개</h1>
						<div class="text-block-11">
							<c:out value="${talent.content}"></c:out>
						</div>
					</div>
					<div class="div-block-4">
						<h1 class="heading-6">재능 이용 방법</h1>
						<ul role="list" class="useservicelist"></ul>
						<div class="w-layout-grid grid-2">
							<div class="textofuserinfo">재능 이용 가능 시간:</div>
							<div class="userinfo">
								<c:out value="${talent.daytime}"></c:out>
							</div>
							<div class="textofuserinfo">재능 이용 가격:</div>
							<div class="userinfo">
								<c:out value="${talent.pay}원"></c:out>
							</div>
							<div class="textofuserinfo">재능 이용 장소:</div>
							<div id="w-node-_24ab8e2a-1c0f-b3b4-e68f-29eb56362e8a-1e040547"
								class="userinfo">
								<c:out value="${talent.area1} "></c:out>
								<c:out value="${talent.area2} "></c:out>
								<c:out value="${talent.area_detail}"></c:out>
							</div>
						</div>
					</div>
					<div id="w-node-_24ab8e2a-1c0f-b3b4-e68f-29eb56362e8c-1e040547"
						class="div-block-4">
						<h1 class="heading-6">경력</h1>
						<div class="w-layout-grid grid-3">
							<div class="textofcaree">자격증:</div>
							<div class="career">
								<c:out value="${talent.career}"></c:out>
							</div>
							<div class="textofcaree">기타:</div>
							<div class="career">
								<c:out value="${talent.etc_career}"></c:out>
							</div>
						</div>
					</div>
					<div id="w-node-_24ab8e2a-1c0f-b3b4-e68f-29eb56362e98-1e040547"
						class="div-block-4">
						<h1 class="heading-6">재능 제공자 정보</h1>
						<div class="w-layout-grid grid-2">
							<div class="textofuserinfo">닉네임:</div>
							<div class="userinfo">
								<c:out value="${talent.writer}"></c:out>
							</div>
							<div class="textofuserinfo">소속 대학:</div>
							<div class="userinfo">
								<c:out value="${talent.univ}"></c:out>
							</div>
							<div class="textofuserinfo">전공:</div>
							<div class="userinfo">
								<c:out value="${talent.major}"></c:out>
							</div>
							<div class="textofuserinfo">학년:</div>
							<div class="userinfo">
								<c:out value="${talent.school_year}"></c:out>
							</div>
						</div>
					</div>
					<div id="w-node-_24ab8e2a-1c0f-b3b4-e68f-29eb56362eae-1e040547"
						class="div-block-4">
						<h1 class="heading-6">작성된 리뷰</h1>
						<!--                   <div class="w-layout-grid reviewgrid">
                        <div id="w-node-_24ab8e2a-1c0f-b3b4-e68f-29eb56362eb2-1e040547" class="review">너무 좋았어요! 산미가 뭔지 처음 알았어요!</div>
                        <div id="w-node-_24ab8e2a-1c0f-b3b4-e68f-29eb56362eb4-1e040547" class="reviewwriter">- 링컨 - </div>
                        <a href="./reportPage.html" class="reviewreport w-button">
                            <strong class="bold-text-5">신고</strong>
                        </a>
                        <div id="w-node-_24ab8e2a-1c0f-b3b4-e68f-29eb56362eb9-1e040547" class="review">마지막에 커피랑 같이 드시라고 주신 다과가 너무 맛있었요!</div>
                        <div id="w-node-_24ab8e2a-1c0f-b3b4-e68f-29eb56362ebb-1e040547" class="reviewwriter">- 뚱이 - </div>
                        <a href="./reportPage.html" class="reviewreport w-button">
                            <strong class="bold-text-5">신고</strong>
                        </a>
                        <div id="w-node-_24ab8e2a-1c0f-b3b4-e68f-29eb56362ec0-1e040547" class="review">좀 어수선하긴 한데 그래도 재밌었어요</div>
                        <div id="w-node-_24ab8e2a-1c0f-b3b4-e68f-29eb56362ec2-1e040547" class="reviewwriter">- 깐깐징어 -</div>
                        <a href="./reportPage.html" class="reviewreport w-button">
                            <strong class="bold-text-5">신고</strong> 
                        </a> -->
						<c:forEach var="review" items="${reviewList}">
							<div class="w-layout-grid reviewgrid">
								<div id="w-node-_24ab8e2a-1c0f-b3b4-e68f-29eb56362eb2-1e040547"
									class="review">${review.content}</div>
								<div id="w-node-_24ab8e2a-1c0f-b3b4-e68f-29eb56362ec2-1e040547"
									class="reviewwriter">
									<div>${review.writer}<br />
										<span id="write_date">${review.write_date}</span>
									</div>
								</div>
								<div class="review">
									<span class="review_score" id="udateReview">
										${review.score}점<br />
									</span> <span> <a href="#" class="review_manage" id="deleteReview" 
									onclick="fn_reviewDelete(${review.review_num}, ${talent.talent_num})"> 삭제 </a> | <a href="#" class="review_manage"
										id="reportReview" onclick="fn_report_review(${review.review_num})" > 신고 </a>
									</span>
								</div>
							</div>
						</c:forEach>
						<!--  페이징  -->
						<div class="talentlistcheck">
							<div class="pageMoveBlock">
								<ul class="paging">
									<c:if test="${paging.prev}">
										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_prev('${paging.page}', '${paging.range}', '${paging.rangeSize}', '${talent.talent_num}')">이전</a>
										</li>
									</c:if>
									<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
										var="idx">
										<span class="page-item"
											<c:out value="${pagingn.page == idx ? 'active' : ''}"/>>
											<a class="page-link" href="#"
											onClick="fn_paging('${idx}', '${paging.range}', '${paging.rangeSize}', '${talent.talent_num}')">
												${idx} </a>
										</span>
									</c:forEach>
									<c:if test="${paging.next}">
										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_next('${paging.range}', '${paging.range}', '${paging.rangeSize}', '${talent.talent_num}')">다음</a>
										</li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="div-block-17">
			<!--         <a href="./chatPage.html" target="_blank" class="chattinglist w-button">
            <strong>활성중인 채팅</strong>
        </a> -->
			<a href="#" class="manageservice w-button"
				onClick="fn_talentUpdate(<c:out value="${talent.talent_num}"></c:out>)">
				<strong>재능 수정하기</strong>
			</a> <a href="#" class="manageservice w-button"
				onClick="fn_talentDelete(<c:out value="${talent.talent_num}"></c:out>)">
				<strong>재능 삭제하기</strong>
			</a> 
			<a href=# class="manageservice w-button"
			onClick="fn_chat(<c:out value="${talent.talent_num}"></c:out>)"> 
			<strong>재능 이용하기</strong>
			</a> <a href="#" class="manageservice w-button"
				onClick="fn_regReview(${talent.talent_num})"> 
				<strong>리뷰 작성하기</strong>
			</a>
			<a href=# class="report w-button" onClick="fn_report_talent(${talent.talent_num})">
				<strong class="bold-text-5">신고</strong>
			</a> 
			<a href=# target="_blank" class="use w-button" id="backList"> 
				<strong>목록</strong>
			</a>
		</div>
	</div>
</body>
</html>