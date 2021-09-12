<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="utf-8" />
<title>사용자 정보 변경</title>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link
	href="${pageContext.request.contextPath}/resources/css/jaebbom.css"
	rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script>
    function checkValid() {
		var f = window.document.updateForm;
		if ( f.nickname.value == "" ) {
			alert( "닉네임을 입력해 주세요." );
			f.nickname.focus();
			return false;
		}
		if ( f.user_adress.value == "" ) {
			alert( "주소를 입력해 주세요." );
			f.user_adress.focus();
			return false;
		}
		if ( f.user_mail.value == "" ) {
	        alert( "E-mail을 입력해 주세요" );
	        f.user_mail.focus();
	        return false;
	    }
	}
	$(document).ready(function(){
		$("input:hidden[name='user_num']").val(<c:out value="${userInfo.user_num}"/>);
		$("#nickname").val('<c:out value="${userInfo.nickname}"/>');
		$("#user_mail").val('<c:out value="${userInfo.user_mail}"/>');
		$("#user_adress").val('<c:out value="${userInfo.user_adress}"/>');
	});
    </script>
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
	<section id="contact-form" class="contact-form"
		style="min-width: 500px;">
		<div class="reportboard w-container" style="min-width: 500px;">
			<div>
				<h2 class="heading-3">사용자 정보 변경</h2>
				<div class="w-form" style="min-width: 500px;">
					<form:form id="form" name="form" class="form-4"
						modelAttribute="userVO" method="post"
						action="${pageContext.request.contextPath}/user/updateUserInfo.do"
						onSubmit="return checkValid()">
						<form:hidden path="user_num" />
						<input type="hidden" name="mode" />
						<div class="div-block-28">
							<label for="name" class="field-label-11"> <strong>닉네임</strong>
							</label>
							<form:input path="nickname" type="text" class="w-input"
								maxlength="256" name="nickname" data-name="nickname"
								placeholder="" value="${userInfo.nickname}" id="nickname" />
						</div>
						<div>
							<label for="name-2" class="field-label-11">주소</label>
							<form:input path="user_adress" type="text" class="w-input"
								maxlength="256" name="user_adress" data-name="user_adress"
								placeholder="" value="${userInfo.user_adress}" id="user_adress" />
						</div>
						<!-- 뭔가 있었던 곳 -->
						<div class="div-block-25">
							<label for="node" class="field-label-11">E-mail</label>
							<div class="div-block-26">
								<div>
									<form:input path="user_mail" type="text"
										class="text-field-7 w-input" maxlength="256" name="user_mail"
										data-name="user_mail" placeholder=""
										value="${userInfo.user_mail}" id="user_mail" required="" />
								</div>
							</div>
						</div>
						<div class="div-block-29">
							<button type="submit" class="button-9 w-button" id="regUser">
								<strong>변경</strong>
							</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>