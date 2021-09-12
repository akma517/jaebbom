<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>careerRegPage</title>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="Webflow" name="generator" />
<link
	href="${pageContext.request.contextPath}/resources/css/jaebbom.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
		let i = 0;
			
		$(function(){
			$('.careerImages').change(function(){
				if (i == 0) {
					i++;
					$('.careerImage').append('<p class="paragraph-3">업로드 완료</p>');
				}
			});
		});
		
</script>
<style>
	.careerImage {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    margin-top: 20px;
    margin-bottom: 20px;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -webkit-flex-direction: column;
    -ms-flex-direction: column;
    flex-direction: column;
    -webkit-box-pack: center;
    -webkit-justify-content: center;
    -ms-flex-pack: center;
    justify-content: center;
    -webkit-box-align: stretch;
    -webkit-align-items: stretch;
    -ms-flex-align: stretch;
    align-items: stretch;
}

.careerLabel {
    -webkit-align-self: center;
    -ms-flex-item-align: center;
    -ms-grid-row-align: center;
    align-self: center;
    color: #fff;
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

.careerImage input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
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
<section id="contact-form">
    <div class="container-2 w-container">
        <h2 class="heading-13">자격 및 경력 등록</h2>
        <p class="paragraph-3">
            자격증이나 각종 대회 수상 및 대외 활동과 같은 경력을 증명할 수 있는 사진과 함께 입력해 주세요.<br/>
            검증에는 최대 1영업일이 걸립니다.<br/>
            허위 사실을 명시할 경우 후에 제재가 가해질 수 있습니다.<br/>반드시 사실만을 입력해 주세요.
        </p>
        <div class="joinfromblock w-form">
            <form id="wf-form-Contact-Form" name="wf-form-Contact-Form"  class="careerform" method="post"
            action="${pageContext.request.contextPath}/user/regCareer.do">>
                <div class="careerblock">
                    <div class="careerblockofblock">
                        <label for="career" id="contact-first-name" class="careerlabel">자격 및 경력</label>
                        <input type="text" class="careernameform w-input" maxlength="256" name="career_name" id="careerName" required=""/>
                    </div>
                </div>
                <div class="careerImage">
                    <label for="careerImages" id="contact-careerCard" class="detache w-button">사진 업로드</label>
                    <input type="file" class="careerImages" id="careerImages" style={{display:none}} name='career_photo'/>
                </div>
                <div class="carrersubmitblock">
                    <input type="submit" value="제출" class="carrersubmit w-button"/>
                </div>
            </form>
        </div>
    </div>
</section>
</body>
</html>