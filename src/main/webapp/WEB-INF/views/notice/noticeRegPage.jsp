<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<html>
<head>
<meta charset="utf-8" />
<title>noticeRegPage</title>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link
	href="${pageContext.request.contextPath}/resources/css/jaebbom.css"
	rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<script>
		$(document).on('click', '#regNotice', function(e){
			e.preventDefault();
			if (document.getElementById("title") == ''){
				alert("제목을 입력해 주세요.")
			} else if (document.getElementById("content") == ''){
				alert("내용을 입력해 주세요.")
			} else {
				$("#form").submit();
			}
		});    
 
		$(document).on('click', '#backList', function(e){
			e.preventDefault();
			location.href="${pageContext.request.contextPath}/notice/noticeListPage.do";
		});
		
		$(document).ready(function(){

			let mode = '<c:out value="${mode}"/>';
			let changedText = '<c:out value="${changedText}" />';
			$("input:hidden[name='writer_num']").val(<c:out value="${user.user_num}"/>);

			if ( mode == 'edit'){
				$("input:hidden[name='notice_num']").val(<c:out value="${notice.notice_num}"/>);
				$("input:hidden[name='mode']").val('<c:out value="${mode}"/>');
				$("#title").val('<c:out value="${notice.title}"/>');
				$("#content").val(`<c:out value='${notice.content}'/>`);
			} 
		});

    </script>
<style>
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
	<section id="contact-form" class="contact-form"
		style="min-width: 500px;">
		<div class="reportboard w-container" style="min-width: 500px;">
			<div>
				<h2 class="heading-3">공지사항 ${changedText}</h2>
				<div class="w-form" style="min-width: 500px;">
					<form:form id="form" name="form" class="form-4"
						modelAttribute="noticeVO" method="post"
						action="${pageContext.request.contextPath}/notice/noticeRegPage.do">
						<form:hidden path="writer_num" />
						<form:hidden path="notice_num" />
						<input type="hidden" name="mode" />
						<div class="div-block-28">
							<label for="name" class="field-label-11"> <strong>제목</strong>
							</label>
							<form:input path="title" type="text" class="w-input"
								maxlength="140" name="title" placeholder=""
								value="${notice.title}" id="title" />
						</div>
						<div>
							<label for="node-3" class="field-label-11">내용</label>
							<form:textarea path="content" placeholder="내용을 입력해 주세요."
								maxlength="5000" id="content" class="w-input" cols="20"
								rows="10"></form:textarea>
						</div>
						<div class="div-block-29">
							<button type="button" class="button-9 w-button" id="regNotice">
								<strong>${changedText}</strong>
							</button>
							<button type="button" class="button-9 w-button" id="backList">
								<strong>목록</strong>
							</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>