<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>loginPage</title>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link
	href="${pageContext.request.contextPath}/resources/css/jaebbom.css"
	rel="stylesheet" type="text/css" />
</head>
<body class="body-2">
	<header id="FrontBar" class="frontbar">
		<a href="${pageContext.request.contextPath}/"
			class="button-21 w-button"> <strong> <em
				class="italic-text-2">재뿜</em>
		</strong>
		</a>
		<div class="container-5 w-container">
		</div>
	</header>
	<div class="form-block w-form">
		<form id="1qaz" name="email-form" data-name="Email Form" method="post"
			class="form"
			action="${pageContext.request.contextPath}/user/login.do">
			<h1 class="heading-11">아이디와 비밀번호를 입력해 주세요</h1>
			<div class="idformblock">
				<label for="name" class="idlabel">아이디</label> <input type="text"
					class="idform w-input" maxlength="256" name="user_id"
					placeholder="" id="user_id" />
			</div>
			<div class="pwformblock">
				<label for="Password" class="pwlabel">비밀번호</label> <input
					type="password" class="pwform w-input" maxlength="256"
					name="user_pwd" placeholder="" id="user_pwd" required="" />
			</div>
			<div class="div-block-19">
				<a href="${pageContext.request.contextPath}/user/findidPage.do"
					class="w-inline-block"> <input type="button" value="아이디 찾기"
					data-wait="Please wait..." class="findid w-button" />
				</a> <a href="${pageContext.request.contextPath}/user/findpwpage.do"
					class="w-inline-block"> <input type="button" id="btnLogin"
					value="비밀번호 찾기" data-wait="Please wait..." class="findpw w-button" />
				</a>
			</div>
			<div class="div-block-18">
				<a href="#" class="w-inline-block" id="logindoit"> <input
					type="submit" value="로그인" data-wait="Please wait..."
					class="loginbutten w-button" />
				</a>
			</div>
		</form>
		<div class="w-form-done"></div>
		<div class="w-form-fail"></div>
	</div>
</body>
</html>