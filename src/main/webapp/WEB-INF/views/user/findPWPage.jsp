<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>findPWPage</title>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="Webflow" name="generator" />
<link
	href="${pageContext.request.contextPath}/resources/css/jaebbom.css"
	rel="stylesheet" type="text/css" />
</head>
<body class="body">
	<header id="hero-overlay" class="section"></header>
	<section id="contact-form">
		<div class="findpwcontainer w-container">
			<h2 class="heading-16">비밀번호 찾기</h2>
			<p class="paragraph-4">
				가입하실 때 입력한 Email과 아이디, 이름을 입력해 주세요.<br />
			</p>
			<div class="joinfromblock w-form">
				<form id="wf-form-Contact-Form" name="wf-form-Contact-Form"
					data-name="Contact Form" action="sendPW.do">
					<div class="idformblock">
						<label class="idlabel">이름</label> <input type="text"
							class="idform w-input" maxlength="256" name="user_name"
							data-name="user_name" id="user_name" required="" />
					</div>
					<div class="nameformblock">
						<label class="namelabel">아이디</label> <input type="text"
							class="nameform w-input" maxlength="256" name="user_id"
							data-name="user_id" id="user_id" required="" />
					</div>
					<div class="emailformblock">
						<label for="Email-2" id="contact-email" class="emaillabel">Email</label>
						<input type="email" class="emailform w-input" maxlength="256"
							name="user_mail" data-name="user_mail" id="user_mail" required="" />
						<div class="div-block-21">
							<a href="${pageContext.request.contextPath}/user/findidPage.do"
								class="w-inline-block"> <input type="button" value="아이디 찾기"
								data-wait="Please wait..." class="findid w-button" />
							</a> <input type="submit" value="전송" data-wait="Please wait..."
								class="findpwbutten w-button" />
						</div>
					</div>
				</form>
				<div class="w-form-done">
					<div>Thank you! Your submission has been received!</div>
				</div>
				<div class="w-form-fail">
					<div>Oops! Something went wrong while submitting the form.</div>
				</div>
			</div>
		</div>
		<a href="${pageContext.request.contextPath}/"
			class="button-21 w-button"> <strong> <em
				class="italic-text-2">재뿜</em>
		</strong>
		</a>
	</section>
</body>
</html>