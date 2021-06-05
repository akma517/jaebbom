<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>rePWPage</title>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link
	href="${pageContext.request.contextPath}/resources/css/jaebbom.css"
	rel="stylesheet" type="text/css" />

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script>
    var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
    var pw = $("#newPW").val();
    if(false === reg.test(password)) {
        alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
    }
	    $(document).on("keyup", "input[noSpecial]", function() {$(this).val( $(this).val().replace(/[^a-zA-Z0-9<>(){}[\]\-_=+|\/\\\;.:\`~!?@#$%^&*,]/gi,"") );})
	</script>
</head>
<body class="body">
	<header id="hero-overlay" class="section"></header>
	<section id="contact-form">
		<div class="container-2 w-container">
			<h2 class="heading-17">비밀번호 재설정</h2>
			<p class="paragraph-4">
				새로 사용할 비밀번호를 입력해 주세요.<br />
			</p>
			<div class="joinfromblock w-form">
				<form id="wf-form-Contact-Form" name="wf-form-Contact-Form"
					data-name="Contact Form" action="modifyPW.do">
					<div class="pwformblock">
						<label class="pwlabel"> 현재 비밀번호<br />
						</label> <input type="password" class="pwform w-input" maxlength="256"
							name="oldPW" data-name="oldPW" id="oldPW" required="" noSpecial />
					</div>
					<div class="pwformblock">
						<label class="pwlabel"> 새로운 비밀번호<br />(영문 특수기호, 숫자를 혼합한
							8자리 이상의 비밀번호를 입력해 주세요)
						</label> <input type="password" minlength="8" maxlength="12"
							class="pwform w-input" maxlength="256" name="newPW"
							data-name="newPW" id="newPW" required=""
							pattern="[0-9A-Za-z!@#$%^&*()-_=+\|{}[];:,./?]" />
					</div>

					<div class="pwformblock">
						<label class="pwlabel"> 비밀번호 확인<br />(입력한 비밀번호와 동일한 값을 입력해
							주세요)
						</label> <input type="password" minlength="8" maxlength="12"
							class="pwform w-input" maxlength="256" name="checkPW"
							data-name="checkPW" id="checkPW" required="" noSpecial />
					</div>
					<div class="div-block-21">
						<input type="submit" value="재설정" id="btn"
							data-wait="Please wait..." class="repwbutten w-button" />
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