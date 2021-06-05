<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>providerRegPage</title>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="Webflow" name="generator" />
<link
	href="${pageContext.request.contextPath}/resources/css/jaebbom.css"
	rel="stylesheet" type="text/css" />
<style>
#wrap {
	width: 100%;
	height: 100%;
}

#wrap .box {
	width: 400px;
	height: 500px;
	margin: 0 auto;
	background: #f0ffff;
	border: 3px solid #0099FF;
	border-radius: 2em;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	//화면 리셋 버튼 이벤트
	function resetEvt()  {
	 	$("#univ").val('');
	 	$("#major").val('');
	 	$("#school_year").val('');
	 	$("#photo_1").val('');
	 	$("#photo_2").val('');
	}
</script>
</head>
<body class="body">
	<div id="wrap">
		<div class="box">
			<div>
				<h1 align="center">재능 제공자 자격 신청</h1>
			</div>
			<div style="width: 100%;" align="left">
				<a href="./">메인으로</a>
			</div>
			<hr style="width: 100%">
			<form action="./freeBoardInsertPro.ino" id="contentForm"
				name="contentForm" method="post" enctype="multipart/form-data">
				<table>
					<!--  원래 있던 옵션 border="0" width="100%" height="100%" -->
					<tr>
						<td style="float: left;" width="100">대학교 이름</td>
						<td style="float: left;"><input type="text" name="univ"
							id="univ" value="${userVO.univ }" /></td>
					</tr>
					<tr>
						<td style="float: left;" width="100">전공</td>
						<td style="float: left;"><input type="text" name="major"
							id="major" value="${userVO.major }" /></td>
					</tr>
					<tr>
						<td style="float: left;" width="50">학년</td>
						<td style="float: left;"><input type="radio"
							name="school_year" value="1학년">1학년 <input type="radio"
							name="school_year" value="2학년">2학년 <input type="radio"
							name="school_year" value="3학년">3학년 <input type="radio"
							name="school_year" value="4학년">4학년 <input type="radio"
							name="school_year" value="졸업">졸업</td>
					</tr>
					<tr>
						<td style="float: left;" width="100">주민등록증 사진</td>
						<td style="float: left;"><input type="file" name="photo_1"
							id="photo_1" placeholder="첨부" /></td>
					</tr>
					<tr>
						<td style="float: left;" width="100">학생증 사진</td>
						<td style="float: left;"><input type="file" name="photo_2"
							id="photo_2" placeholder="첨부" /></td>
					</tr>
					<tr>
						<td colspan="2" align="right"><br>
						<br>
						<br>
						<br> <input type="submit" value="신청하기"> <input
							type="button" value="다시쓰기" id="resetBtn" onclick="resetEvt();">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
<body class="body">
</html>