<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>findIDPage</title>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link
	href="${pageContext.request.contextPath}/resources/css/jaebbom.css"
	rel="stylesheet" type="text/css" />
</head>
<body class="body">
	<header id="hero-overlay" class="section">
		<a href="${pageContext.request.contextPath}/"
			class="button-21 w-button"> <strong> <em
				class="italic-text-2">재뿜</em>
		</strong>
		</a>
	</header>
	<section id="contact-form">
		<div class="container-2 w-container">
			<h2 class="heading-15">아이디 찾기</h2>
			<p class="paragraph-4">가입하실 때 입력한 Email과 이름을 입력해 주세요.</p>
			<div class="joinfromblock w-form">
				<form id="wf-form-Contact-Form" name="wf-form-Contact-Form"
					data-name="Contact Form" action="sendID.do">
					<div class="nameformblock">
						<label class="namelabel">이름</label> <input type="text"
							class="nameform w-input" maxlength="256" name="user_name"
							data-name="user_name" id="user_name" required="" />
					</div>
					<div class="emailformblock">
						<label for="Email-2" id="contact-email" class="emaillabel">Email
						</label> <input type="email" class="emailform w-input" maxlength="256"
							name="user_mail" data-name="user_mail" id="Euser_mail"
							required="" />
						<div class="div-block-21">
							<a href="${pageContext.request.contextPath}/user/findpwpage.do"
								class="w-inline-block"> <input type="button" value="비밀번호 찾기"
								data-wait="Please wait..." class="findpw w-button" />
							</a> <input type="submit" value="인증" data-wait="Please wait..."
								class="findidbutten w-button" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
</body>
</html>