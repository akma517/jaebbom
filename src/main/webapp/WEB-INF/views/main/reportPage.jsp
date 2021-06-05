<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>reportPage</title>
	<meta content="width=device-width, initial-scale=1" name="viewport" />
	<link href="${pageContext.request.contextPath}/resources/css/jaebbom.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<style>
		.reportboard {
    		display: -webkit-box;
    		display: -webkit-flex;
    		display: -ms-flexbox;
    		display: flex;
    		-webkit-box-align: end;
    		-webkit-align-items: flex-end;
    		-ms-flex-align: end;
    		align-items: stretch;
    		border-style: none;
    		border-width: 0px;
    		border-color: #3898ec;
    		border-radius: 10px;
    		flex-direction: column;
    		align-content: center;
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
					<a href="${pageContext.request.contextPath}/user/myPage.do"
						class="button-6 w-button"> <strong class="bold-text-2">마이페이지</strong>
					</a> 
					<a href="${pageContext.request.contextPath}/user/logout.do"
						class="button-5 w-button"> <strong class="bold-text">로그아웃</strong>
					</a>
				</div>
			</c:otherwise>
		</c:choose>
	</header>
<section id="contact-form" class="contact-form">
    <div class="reportboard w-container">
        <h2 class="heading-3">신고</h2>
        <br />
        <p class="reportsubtitle">
            양식에 맞춰 신고해 주세요.<br/>
            관리자가 확인 후 신고 대상에게 제재를 가할 수 있습니다.<br/>반드시 사실만을 적어주세요
        </p>
        <div class="joinfromblock w-form">
            <form id="wf-form-Contact-Form" name="wf-form-Contact-Form" data-name="Contact Form" class="providerform">
                <div class="reportreasonblock">
                    <label for="reportreasonblock" id="reportReason" class="reportreasonlabel">
                        <br/>
                    </label>
                    <div class="reaportreasonradioblcok">
                        <label class="w-checkbox reportreasoncheck">
                            <input type="checkbox" id="reportReasonCheckbox" name="reportReasonCheckbox" data-name="reportReasonCheckbox" class="w-checkbox-input reportreasoncheckbox1"/>
                            <span for="reportReasonCheckbox" class="reportreason w-form-label">광고성 혹은 부적절할 컨텐츠</span>
                        </label>
                        <label class="w-checkbox reportreasoncheck">
                            <input type="checkbox" id="reportReasonCheckbox-5" name="reportReasonCheckbox-5" data-name="Report Reason Checkbox 5" class="w-checkbox-input reportreasoncheckbox2"/>
                            <span for="reportReasonCheckbox-5" class="reportreason w-form-label">부적절한 언어 사용</span>
                        </label>
                        <label class="w-checkbox reportreasoncheck">
                            <input type="checkbox" id="reportReasonCheckbox-4" name="reportReasonCheckbox-4" data-name="Report Reason Checkbox 4" class="w-checkbox-input reportreasoncheckbox3"/>
                            <span for="reportReasonCheckbox-4" class="reportreason w-form-label">노쇼(예약 후 무방문)</span>
                        </label>
                        <label class="w-checkbox reportreasoncheck">
                            <input type="checkbox" id="reportReasonCheckbox-3" name="reportReasonCheckbox-3" data-name="Report Reason Checkbox 3" class="w-checkbox-input reportreasoncheckbox4"/>
                            <span for="reportReasonCheckbox-3" class="reportreason w-form-label">지속적인 무응답</span>
                        </label>
                        <label class="w-checkbox reportreasoncheck">
                            <input type="checkbox" id="reportReasonCheckbox-2" name="reportReasonCheckbox-2" data-name="Report Reason Checkbox 2" class="w-checkbox-input reportreasoncheckbox5"/>
                            <span for="reportReasonCheckbox-2" class="reportreason w-form-label">허위 사실 명시</span>
                        </label>
                        <label class="w-checkbox reportreasoncheck">
                            <input type="checkbox" id="reportReasonCheckbox-2" name="reportReasonCheckbox-2" data-name="Report Reason Checkbox 2" class="w-checkbox-input reportreasoncheckbox6"/>
                            <span for="reportReasonCheckbox-6" class="reportreason w-form-label">기타</span>
                        </label>
                    </div>
                </div>
                <div>
                    <textarea data-name="detail" maxlength="5000" id="detail" name="detail" placeholder="상세 사유를 입력해 주세요." class="reportreasondetail w-input"></textarea>
                </div>
                <div class="reportsummit">
                    <input type="submit" value="제출" data-wait="Please wait..." class="reportsubmitbutten w-button"/>
                </div>
            </form>
        </div>
    </div>
</section>
</body>
</html>
