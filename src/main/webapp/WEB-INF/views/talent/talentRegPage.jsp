<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<html>
<head>
<meta charset="utf-8" />
<title>talentRegPage</title>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link
	href="${pageContext.request.contextPath}/resources/css/jaebbom.css"
	rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<script>
		$(document).on('click', '#regTalent', function(e){
			e.preventDefault();
			let pay = document.getElementById('pay');
			if (isNaN(Number(pay.value))) {
				alert("재능 이용 가격에 숫자만 입력해 주세요.");
			} else {
				$("#form").submit();	
			}
		});
		$(document).on('click', '#backList', function(e){
			e.preventDefault();
			location.href="${pageContext.request.contextPath}/talent/talentListPage.do";
		});
		
		$(document).ready(function(){

			let mode = '<c:out value="${mode}"/>';
			let changedText = '<c:out value="${changedText}" />';
			
			$("input:hidden[name='writer']").val(<c:out value="${user.user_num}"/>);
			$("#mode").val('<c:out value="${mode}"/>');

			if ( mode == 'edit'){
				$("input:hidden[name='talent_num']").val(<c:out value="${talent.talent_num}"/>);
				$("input:hidden[name='mode']").val('<c:out value="${mode}"/>');
				$("#daytime").val('<c:out value="${talent.daytime}"/>');
				$("#pay").val('<c:out value="${talent.pay}"/>');
				$("#area1").val('<c:out value="${talent.area1_num}"/>');
				$("#area2").val('<c:out value="${talent.area2_num}"/>');
				$("#area_detail").val(`<c:out value="${talent.area_detail}"/>`);
				$("#content").val(`<c:out value='${talent.content}'/>`);
			} 
		});

    </script>
<style>
.contact-form {
	margin: 150px;
}
.body {
	padding: 0px;
	margin: 0px;
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
	<section id="contact-form" class="contact-form"
		style="min-width: 500px;">
		<div class="reportboard w-container" style="min-width: 500px;">
			<div>
				<h2 class="heading-3">재능 ${changedText}</h2>
				<div class="w-form" style="min-width: 500px;">
					<form:form id="form" name="form" class="form-4"
						modelAttribute="talentVO" method="post"
						action="${pageContext.request.contextPath}/talent/talentRegPage.do">
						<form:hidden path="talent_num" />
						<input type ="hidden" name = "mode" id = "mode"/>
						<form:hidden path="writer" />
						<div class="div-block-28">
							<label for="name" class="field-label-11"> <strong>제목</strong>
							</label>
							<form:input path="title" type="text" class="w-input"
								maxlength="256" name="title" placeholder=""
								value="${talent.title}" id="title" />
						</div>
						<div>
							<label for="name-2" class="field-label-11">재능 이용 가능 시간</label>
							<form:input path="daytime" type="text" class="w-input"
								maxlength="256" name="daytime" placeholder=""
								value="${talent.daytime}" id="daytime" />
						</div>
						<div>
							<label for="name-3" class="field-label-11">재능 이용 가격</label>
							<form:input path="pay" type="text" class="w-input"
								maxlength="256" name="pay" placeholder="" value="${talent.pay}"
								id="pay" />
						</div>
						<div class="div-block-25">
							<label for="node" class="field-label-11">재능 종류</label>
							<div class="div-block-26">
								<div class="div-block-27">
									<form:select path="talent_category1_num" id="node" name="talent_category2_num" required=""
										class="w-select">
										<option value="">재능 종류</option>
										<option value=1>1</option>
										<option value=2>2</option>
										<option value=3>3</option>
									</form:select>
									<form:select path="talent_category2_num" id="node-2" name="talent_category2_num"
										class="w-select">
										<option value="">재능 상세 종류</option>
										<option value=1>1</option>
										<option value=2>2</option>
										<option value=3>3</option>
									</form:select>
								</div>
							</div>
						</div>
						<div class="div-block-25">
							<label for="node" class="field-label-11">재능 이용 장소</label>
							<div class="div-block-26">
								<div class="div-block-27">
									<form:select path="area1" id="node" name="area1" required=""
										class="w-select">
										<option value="">주소1</option>
										<option value=1>1</option>
										<option value=2>2</option>
										<option value=3>3</option>
									</form:select>
									<form:select path="area2" id="node-2" name="area2"
										class="w-select">
										<option value="">주소2</option>
										<option value=1>1</option>
										<option value=2>2</option>
										<option value=3>3</option>
									</form:select>
								</div>
								<div>
									<form:input path="area_detail" type="text"
										class="text-field-7 w-input" maxlength="256"
										name="area_detail" placeholder="상세주소"
										value="${talent.area_detail}" id="area_detail" required="" />
								</div>
							</div>
						</div>
						<div>
							<label for="node-3" class="field-label-11">재능 소개</label>
							<form:textarea path="content" placeholder="재능에 대해 설명해 주세요."
								maxlength="5000" id="content" class="w-input" cols="20"
								rows="10"></form:textarea>
						</div>
						<div class="div-block-29">
							<button type="button" class="button-9 w-button" id="regTalent">
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
