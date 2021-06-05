<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<html>
<head>
<meta charset="utf-8" />
<title>reviewRegPage</title>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link
	href="${pageContext.request.contextPath}/resources/css/jaebbom.css"
	rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<script>
		let finished = '<c:out value="${finish}"/>';
		if (finished === "finish"){
			window.close();
		}

		$(document).ready(function(){
			$("input:hidden[name='talent_num']").val(<c:out value="${talent.talent_num}"/>);
			$("input:hidden[name='writer_num']").val(<c:out value="${user.user_num}"/>);
		});
		
		$(document).on('click', '#regReview', function(e){
			e.preventDefault();
			$("#form").submit();
		});

    </script>
<style>
.body {
	margin-top: 0px;
}

.w-form-label {
	margin-left: 5px;
	font-size: 30px;
}
</style>
</head>
<body class="body">
	<div class="container-2 w-container">
		<h2 class="heading-13">리뷰 등록</h2>
		<br />
		<div class="w-form" style="min-width: 500px;">
			<form:form id="form" name="form" class="form-4"
				modelAttribute="reviewVO" method="post"
				action="${pageContext.request.contextPath}/talent/reviewRegPage.do">
				<form:hidden path="talent_num" />
				<form:hidden path="writer_num" />
				<input type="hidden" name="mode" />
				<div class="div-block-28">
					<form:input path="content" type="text" class="w-input"
						maxlength="140" name="content" placeholder="리뷰 내용을 입력해 주세요."
						value="${review.content}" id="content" />
				</div>
				<div class="div-block-12">
					<label class="graderadio w-radio"> <input type="radio"
						id="score_1" name="score" value="1"
						class="w-form-formradioinput w-radio-input" /> <span
						class="w-form-label">1점</span>
					</label> <label class="graderadio w-radio"> <input type="radio"
						id="score_2" name="score" value="2"
						class="w-form-formradioinput w-radio-input" /> <span
						class="w-form-label">2점</span>
					</label> <label class="graderadio w-radio"> <input type="radio"
						id="score_3" name="score" value="3"
						class="w-form-formradioinput w-radio-input" /> <span
						class="w-form-label">3점</span>
					</label> <label class="graderadio w-radio"> <input type="radio"
						id="score_4" name="score" value="4"
						class="w-form-formradioinput w-radio-input" /> <span
						class="w-form-label">4점</span>
					</label> <label class="graderadio w-radio"> <input type="radio"
						id="score_5" name="score" value="5"
						class="w-form-formradioinput w-radio-input" checked /> <span
						class="w-form-label">5점</span>
					</label>
				</div>
				<div class="div-block-29">
					<button type="button" class="button-9 w-button" id="regReview">
						<strong>등록</strong>
					</button>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>