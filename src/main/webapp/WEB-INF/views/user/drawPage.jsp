<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8" />
<title>drawPage</title>
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
		<div class="drawcontainer w-container">
			<h2 class="heading-14">정말로 회원 탈퇴를 하시겠습니까?</h2>
			<p class="paragraph-2">
				회원 탈퇴를 할 경우 등록된 회원 정보 및 서비스는 모두 삭제됩니다.<br />비밀번호 확인 절차를 진행하면 정상적으로
				회원 탈퇴가 진행됩니다.
			</p>
			<div class="drawform-block w-form">
				<form id="wf-form-Contact-Form" name="wf-form-Contact-Form"
					data-name="Contact Form"
					action="${pageContext.request.contextPath}/user/draw.do">
					<div class="contact-form-grid">
						<div id="w-node-_29785f59-1c6c-dd15-6950-2b4ba8248911-0bb115a5"
							class="pwformblock">
							<label for="Last-Name-2" id="contact-last-name" class="pwlabel">
								비밀번호 확인<br />
							</label> <input type="password" class="pwform w-input" maxlength="256"
								name="password" data-name="password" id="password" required="" />
							<div class="div-block-9">
								<input type="submit" value="회원 탈퇴" data-wait="Please wait..."
									class="drawbutten w-button" />
							</div>
						</div>
					</div>
				</form>

			</div>
		</div>
	</section>
</body>
</html>