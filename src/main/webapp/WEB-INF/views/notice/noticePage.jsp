<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<meta charset="utf-8" />
<title>noticePage</title>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link
	href="${pageContext.request.contextPath}/resources/css/jaebbom.css"
	rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script>
		//뒤로 가기
		$(document).on('click', '#backList', function(e){
			e.preventDefault();
			location.href="${pageContext.request.contextPath}/notice/noticeListPage.do";
		});
		
		// 공지사항 변경
		function fn_noticeUpdate(notice_num){
			let url = "${pageContext.request.contextPath}/notice/noticeUpdatePage.do";
			url = url + "?notice_num=" + notice_num;
			url = url + "&mode=edit";
			location.href = url;
		}
		
		// 공지사항 삭제
		function fn_noticeDelete(notice_num){
			let url = "${pageContext.request.contextPath}/notice/noticeDelete.do";
			url = url + "?notice_num=" + notice_num;
			location.href = url;
		}
		
		// 메인 페이지 가기
		$(document).on('click', '#backMain', function(e){
			e.preventDefault();
			location.href="${pageContext.request.contextPath}";
		});
    </script>
<style>
.w-form {
	min-height: 300px;
	min-width: 500px;
	margin: 40 10 10 10;
}

.div-block-17 {
	
}

.notice-sub-info {
	padding-top: 10px;
	padding-left: 10px;
	padding-right: 10px;
	padding-bottom: 10px;
	text-align: right;
	background-color: #2895f7;
	color: white;
	border-radius: 10px;
	border-style: solid;
	border-width: 2px;
	border-color: #1d8df6;
	border-style: solid;
	border-width: 3px;
	border-color: #185bf6;
}

.serviceboard {
	padding-left: 10px;
	padding-right: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.container-6 {
	margin-top: 0;
}

.heading-6 {
	padding-left: 5px;
}

.notice-sub-title {
	align-content: left;
	text-align: left;
	font-weight: bold;
	font-size: 26px;
}

.body {
	margin-top: 0px;
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
	<div class="serviceboard container-6 w-container">
		<div class="notice-sub-info">
			<div class="notice-sub-title">
				<c:out value="${notice.title}"></c:out>
			</div>
			<c:out value="${notice.write_date}"></c:out>
			<br />
			<c:out value="${notice.writer}"></c:out>
		</div>
		<div class="w-form">
			<c:out value="${notice.content}"></c:out>
		</div>
		<div class="div-block-17">
			<a href="#" class="manageservice w-button"
				onClick="fn_noticeUpdate(<c:out value="${notice.notice_num}"></c:out>)">
				<strong>수정하기</strong>
			</a> <a href="#" class="manageservice w-button"
				onClick="fn_noticeDelete(<c:out value="${notice.notice_num}"></c:out>)">
				<strong>삭제하기</strong>
			</a> <a href="./chatPage.html" target="_blank" class="use w-button"
				id="backList"> <strong>목록</strong>
			</a>
		</div>
	</div>
</body>
</html>