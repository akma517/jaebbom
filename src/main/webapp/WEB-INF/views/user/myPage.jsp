<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html data-wf-domain="hyeonus-blank-site.webflow.io"
	data-wf-page="604df31c9b7b0964b15bc5d3"
	data-wf-site="5fd9ee091ea535bf0ad45aa6">
<head>
<meta charset="utf-8" />
<title>myPage</title>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link
	href="${pageContext.request.contextPath}/resources/css/jaebbom.css"
	rel="stylesheet" type="text/css" />
</head>
<body class="body">
	<header id="FrontBar" class="frontbar">
		<a href="${pageContext.request.contextPath}/"
			class="button-21 w-button"> <strong> <em
				class="italic-text-2">재뿜</em>
		</strong>
		</a>
		<div class="container-5 w-container">
			<a href="${pageContext.request.contextPath}/user/logout.do"
				class="button-5 w-button"> <strong class="bold-text">로그아웃</strong>
			</a>
		</div>
	</header>
	<section id="contact-form" class="contact-form-2">
		<h2 class="mypagehead">마이페이지</h2>
		<div class="container-7 w-container">
			<div class="w-form">
				<form id="wf-form-Contact-Form" name="wf-form-Contact-Form"
					data-name="Contact Form" class="form-3">
					<div class="mypagegrid">
						<div id="w-node-be1ad685-51ef-57c2-9ab3-9c8cfdb80725-b15bc5d3"
							class="div-block-4">
							<h1 class="heading-6">회원 정보</h1>
							<div class="w-layout-grid grid-2">
								<div class="textofuserinfo">아이디:</div>
								<div class="userinfo">${userInfo.user_id}</div>
								<div class="textofuserinfo">닉네임:</div>
								<div class="userinfo">${userInfo.nickname}</div>
								<div class="textofuserinfo">주소:</div>
								<div class="userinfo">${userInfo.user_adress}</div>
								<div class="textofuserinfo">Email:</div>
								<div class="userinfo">${userInfo.user_mail}</div>
							</div>
							<div class="userinfobuttenblock">
								<a href="${pageContext.request.contextPath}/user/drawPage.do"
									class="dodraw w-button">회원 탈퇴</a> <a
									href="${pageContext.request.contextPath}/user/rePWPage.do"
									class="dodraw w-button">비밀번호 변경</a> <a
									href="${pageContext.request.contextPath}/user/changeUserInfo.do"
									class="manageuserinfo w-button">회원 정보 변경</a>
							</div>
						</div>
						<div id="w-node-be1ad685-51ef-57c2-9ab3-9c8cfdb8076a-b15bc5d3"
							class="div-block-4">
							<h1 class="heading-6">대학 정보</h1>
							<div class="w-layout-grid grid-2">
								<div class="textofuserinfo">대학 이름:</div>
								<div class="useruniv">${userUniv.univ}</div>
								<div class="textofuserinfo">전공:</div>
								<div class="useruniv">${userUniv.major}</div>
								<div class="textofuserinfo">학년:</div>
								<div class="useruniv">${userUniv.school_year}</div>
							</div>
							<div class="unibuttenbllock">
								<a href="${pageContext.request.contextPath}/user/regUnivInfo.do"
									target="_blank" class="doprovider w-button">대학교 인증</a> <a
									href="#" class="manageuniinfo w-button">대학 정보 변경</a>
							</div>
						</div>
						<div id="w-node-be1ad685-51ef-57c2-9ab3-9c8cfdb80743-b15bc5d3"
							class="div-block-4">
							<h1 class="heading-6">이용 중인 서비스</h1>
							<ul role="list" class="useservicelist">
								<li class="list-item-3">철학과 학생의 인생 여행</li>
								<li class="list-item-4">호텔요리과 출신의 와인 수업</li>
								<li class="list-item-5">서울대 수학과 1학년의 발칙한 미적분 과외</li>
							</ul>
						</div>
						<div id="w-node-be1ad685-51ef-57c2-9ab3-9c8cfdb8074d-b15bc5d3">
							<div class="div-block-4">
								<h1 class="heading-6">이용 중인 채팅</h1>
								<div class="columns w-row">
									<div class="column w-col w-col-9">
										<ul role="list" class="useservicelist">
											<li class="list-item-4">호텔요리과 출신의 와인 수업</li>
											<li class="list-item-3">철학과 학생의 인생 여행</li>
											<li class="list-item-5">서울대 수학과 1학년의 발칙한 미적분 과외</li>
										</ul>
									</div>
									<div class="column-2 w-col w-col-3">
										<ul role="list" class="list-3">
											<li class="list-item-4">- 요잘남 -</li>
											<li class="list-item-3">- 디카르고 -</li>
											<li class="list-item-5">- 제이팍 -</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div id="w-node-be1ad685-51ef-57c2-9ab3-9c8cfdb80762-b15bc5d3">
							<div>
								<div class="div-block-4">
									<h1 class="heading-6">등록한 서비스</h1>
									<ul role="list" class="useservicelist">
										<c:forEach var="TalentList" items="${registeredTalent}">
											<li class="list-item-3">${TalentList.title}</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
						<div id="w-node-be1ad685-51ef-57c2-9ab3-9c8cfdb80721-b15bc5d3"
							class="div-block-4">
							<h1 class="heading-6">경력</h1>
							<div class="w-layout-grid grid-3">
								<div class="textofcaree">자격증:</div>
								<div class="career">${userCareer.career_name}</div>
								<div class="textofcaree">기타:</div>
								<div class="career">${userCareer.etc_career}</div>
							</div>
							<div class="careerbuttenblock">
								<a
									href="${pageContext.request.contextPath}/user/careerRegPage.do"
									target="_blank" class="docareer w-button"> <strong>경력
										등록</strong>
								</a> <a href="#" class="managecareer w-button"> <strong>경력
										정보 변경</strong>
								</a>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
</body>
</html>