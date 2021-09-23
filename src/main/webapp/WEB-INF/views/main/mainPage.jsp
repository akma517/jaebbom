<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>mainPage</title>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link
	href="${pageContext.request.contextPath}/resources/css/jaebbom.css"
	rel="stylesheet" type="text/css">
</head>
<style>
.body{
	padding: 0px;
	margin: 0px;
	
}
</style>
<body class="body">
	<div>
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
			<header id="FrontBar" class="frontbar">	
				<div class="container-5 w-container">
					<a href="${pageContext.request.contextPath}" class="button-21 w-button w--current"> 
						<strong> 
							<em class="italic-text-2">재뿜</em>
						</strong>
					</a>
				<%-- 
					<a href="${pageContext.request.contextPath}/talent/talentRegPage.do"
						class="regist w-button"> <strong>재능 등록하기</strong></a> 
					<a href="${pageContext.request.contextPath}/notice/noticeRegPage.do"
						class="regist w-button"> <strong>공지사항 등록하기</strong></a> 
					<a href="#" class="button-7 w-button"> <strong class="bold-text-4">등록한 재능</strong></a> 
					<a href="#" class="button-7 w-button"> <strongclass="bold-text-4">이용 중인 재능</strong></a>
					 --%>
					<a href="${pageContext.request.contextPath}/user/myPage.do"
						class="button-6 w-button"> <strong class="bold-text-2">마이페이지</strong></a> 
					<a href="${pageContext.request.contextPath}/user/logout.do"
						class="button-5 w-button"> <strong class="bold-text">로그아웃</strong></a>
				</div>
			</header>
		</c:otherwise>
	</c:choose>
	</div>
	<div id="hero-overlay" class="hero-overlay">
		<div class="centered-container w-container">
			<h1 class="heading-2">다양한 재능을 이용하세요</h1>
			<p class="paragraph">
				<strong> 재뿜에서는 대학생들의 재능이 서비스가 되어 제공됩니다.<br />이들의 멋진 재능들을
					만나보세요
				</strong>
			</p>
			<div class="div-block-2">
				<a href="${pageContext.request.contextPath}/talent/talentListPage.do"
					class="button-8 w-button"> <strong>재능 이용하기</strong>
				</a> 
				<a href="${pageContext.request.contextPath}/talent/talentRegPage.do"
					class="button-9 w-button"> <strong class="bold-text-6">재능 등록하기</strong>
				</a>
			</div>
			<div class="div-block-3">
			<a href="${pageContext.request.contextPath}/notice/noticeListPage.do" class="button-10 w-button"> 
				<strong>공지사항</strong>
			</a>
			</div>
		</div>
	</div>
</body>
</html>
