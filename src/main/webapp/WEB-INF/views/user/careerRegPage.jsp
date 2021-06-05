<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style>
#wrap {
	width: 100%;
	height: 100%;
}

#wrap .box {
	width: 800px;
	height: 800px;
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
			 $("#career_name").val('');
			 $("#career_date").val('');
			 $("#career_level").val('');
			 $("#career_photo").val('');
		}
		
	</script>
</head>
<body class="body">
	<div id="wrap">
		<div class="box">
			<div>
				<h1 align="center">재능 제공자 이력서 등록</h1>
			</div>
			<div style="width: 100%;" align="left">
				<a href="./">메인으로</a>
			</div>
			<hr style="width: 100%">
			<form action="./regCareer" id="contentForm" name="contentForm"
				method="post" enctype="multipart/form-data">
				<table border="0" width="100%" height="100%">
					<tr>
						<td style="float: left;" width="155">자격증 사항</td>
					</tr>
					<tr>
						<td style="float: left;" width="155">자격증명</td>
						<td style="float: left;" width="155">등급</td>
						<td style="float: left;" width="155">취득일자</td>
						<td style="float: left;" width="155">자격증 사진</td>
					</tr>
					<tr>
						<td style="float: left;"><input type="text"
							name="career_name" id="career_name" /></td>
						<td style="float: left;"><input type="text"
							name="career_level" id="career_level" /></td>
						<td style="float: left;"><input type="text"
							name="career_date" id="career_date" /></td>
						<td style="float: left;"><input type="file"
							name="career_photo" id="career_photo" placeholder="첨부" /></td>
					</tr>
					<tr>
						<td style="float: left;"><input type="text"
							name="career_name" id="career_name" /></td>
						<td style="float: left;"><input type="text"
							name="career_level" id="career_level" /></td>
						<td style="float: left;"><input type="text"
							name="career_date" id="career_date" /></td>
						<td style="float: left;"><input type="file"
							name="career_photo" id="career_photo" placeholder="첨부" /></td>
					</tr>
					<tr>
						<td style="float: left;"><input type="text"
							name="career_name" id="career_name" /></td>
						<td style="float: left;"><input type="text"
							name="career_level" id="career_level" /></td>
						<td style="float: left;"><input type="text"
							name="career_date" id="career_date" /></td>
						<td style="float: left;"><input type="file"
							name="career_photo" id="career_photo" placeholder="첨부" /></td>
					</tr>
					<tr>
						<td style="float: left;" width="155"><br>
						<br>
						<br>외국어 공인시험 사항</td>
					</tr>
					<tr>
						<td style="float: left;" width="155">어학 시험명</td>
						<td style="float: left;" width="155">점수</td>
						<td style="float: left;" width="155">시험일자</td>
						<td style="float: left;" width="155">발급기관</td>
					</tr>
					<tr>
						<td style="float: left;"><input type="text"
							name="career_language " id="career_language" /></td>
						<td style="float: left;"><input type="text"
							name="career_language_point" id="career_language_point" /></td>
						<td style="float: left;"><input type="text"
							name="career_language_date" id="career_language_date" /></td>
						<td style="float: left;"><input type="text"
							name="career_language_company" id="career_language_company" /></td>
					</tr>
					<tr>
						<td style="float: left;"><input type="text"
							name="career_language " id="career_language" /></td>
						<td style="float: left;"><input type="text"
							name="career_language_point" id="career_language_point" /></td>
						<td style="float: left;"><input type="text"
							name="career_language_date" id="career_language_date" /></td>
						<td style="float: left;"><input type="text"
							name="career_language_company" id="career_language_company" /></td>
					</tr>
					<tr>
						<td style="float: left;"><input type="text"
							name="career_language " id="career_language" /></td>
						<td style="float: left;"><input type="text"
							name="career_language_point" id="career_language_point" /></td>
						<td style="float: left;"><input type="text"
							name="career_language_date" id="career_language_date" /></td>
						<td style="float: left;"><input type="text"
							name="career_language_company" id="career_language_company" /></td>
					</tr>
					<tr>
						<td style="float: left;" width="155"><br>
						<br>
						<br>경력 사항</td>
					</tr>
					<tr>
						<td style="float: left;" width="155">기관명</td>
						<td style="float: left;" width="155">기간 (yy.mm~yy.dd)</td>
						<td style="float: left;" width="155">담당업무</td>
					</tr>
					<tr>
						<td style="float: left;"><input type="text"
							name="career_company " id="career_company" /></td>
						<td style="float: left;"><input type="text"
							name="career_company_date" id="career_company_date" /></td>
						<td style="float: left;"><input type="text"
							name="career_company_work" id="career_company_work" /></td>
					</tr>
					<tr>
						<td style="float: left;"><input type="text"
							name="career_company " id="career_company" /></td>
						<td style="float: left;"><input type="text"
							name="career_company_date" id="career_company_date" /></td>
						<td style="float: left;"><input type="text"
							name="career_company_work" id="career_company_work" /></td>
					</tr>
					<tr>
						<td style="float: left;"><input type="text"
							name="career_company " id="career_company" /></td>
						<td style="float: left;"><input type="text"
							name="career_company_date" id="career_company_date" /></td>
						<td style="float: left;"><input type="text"
							name="career_company_work" id="career_company_work" /></td>
					</tr>
					<tr>
						<td colspan="2" align="right"><br>
						<br>
						<br>
						<br> <input type="submit" value="등록하기"> <input
							type="button" value="다시쓰기" id="resetBtn" onclick="resetEvt();">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>