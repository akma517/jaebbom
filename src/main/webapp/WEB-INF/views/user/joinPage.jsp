<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>joinPage</title>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link
	href="${pageContext.request.contextPath}/resources/css/jaebbom.css"
	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
</head>
<body class="body">
	<header id="FrontBar" class="frontbar">
		<a href="${pageContext.request.contextPath}/"
			class="button-21 w-button"> <strong> <em
				class="italic-text-2">재뿜</em>
		</strong>
		</a>
		<div class="container-5 w-container"></div>
	</header>
	<div class="form-block w-form">
		<section id="contact-form" class="joinsection">
			<div class="container-2 w-container">
				<h2 class="heading-12">회원 가입</h2>
				<div class="joinfromblock w-form">
					<form id="join_form" method="post" name="wf-form-Contact-Form"
						data-name="Contact Form" autocomplete="off">
						<div class="idformblock w-clearfix">
							<label for="ID" id="contact-first-name" class="idlabel">ID
							</label> <input type="text" class="idform w-input" minlength="5"
								maxlength="256" name="ID" data-name="ID" id="ID" required="" />
							<span class="id_input_re_1">사용 가능한 아이디입니다.</span> <span
								class="id_input_re_2">아이디가 이미 존재합니다.</span>
						</div>
						<div class="pwformblock">
							<label for="PW" id="contact-PW" class="pwlabel"> 비밀번호<br />(영문
								특수기호, 숫자를 혼합한 8자리 이상의 비밀번호를 입력해 주세요)
							</label> <input type="password" class="pwform w-input" maxlength="256"
								name="PW" data-name="PW" id="PW" required="" />
						</div>
						<div class="pwformblock">
							<label for="rePW" id="contact-rePW" class="pwlabel"> 비밀번호
								확인<br />(입력한 비밀번호와 동일한 값을 입력해 주세요)
							</label> <input type="password" class="pwform w-input" maxlength="256"
								name="rePW" data-name="rePW" id="rePW" required="" /> <span
								class="pwck_input_re_1">동일합니다.</span> <span
								class="pwck_input_re_2">다릅니다.</span>
						</div>
						<div class="nicknameformblock w-clearfix">
							<label for="nickname" id="contact-nickname" class="nicknamelabel">닉네임</label>
							<input type="text" class="nicknameform w-input" maxlength="256"
								name="nickname" data-name="nickname" id="nickname" required="" />
							<span class="name_input_re_1">사용 가능한 닉네임입니다.</span> <span
								class="name_input_re_2">이미 존재하는 닉네임입니다.</span>
						</div>
						<div class="nameformblock">
							<label for="name" id="contact-name" class="namelabel">이름</label>
							<input type="text" class="nameform w-input" maxlength="256"
								name="name" data-name="name" id="name" required="" />
						</div>
						<div class="emailformblock w-clearfix">
							<label for="email" id="contact-email" class="emaillabel">Email
							</label> <input type="email" class="emailform w-input" minlength="10"
								maxlength="256" name="email" data-name="email" id="email"
								required="" /> <input type="button" id="mail_check_btn"
								value="인증" data-wait="Please wait..."
								class="emailidenty w-button" />
							<sapn class="mail_input_box_warn"></sapn>
						</div>
						<div class="emailformblock w-clearfix">
							<label for="email" id="contact-email" class="emaillabel">수신번호확인</label>
							<input type="text" disabled="disabled"
								class="nicknameform w-input" maxlength="256" name="mailchknum"
								data-name="mailchknum" id="mailchknum" required="" /> <span
								class="mail_input_1">인증번호가 일치합니다.</span> <span
								class="mail_input_2">인증번호를 다시 확인해주세요.</span>
						</div>
						<div class="addressformblock">
							<label for="address" id="contact-address" class="addresslabel">주소</label>
							<input type="tel" class="addressform w-input" maxlength="256"
								name="address" data-name="address" id="address" required="" />
						</div>
						<div class="centerblock">
							<input type="button" id="join_button" value="회원 가입"
								data-wait="Please wait..." class="joinbutten w-button" />
						</div>
					</form>
					<div class="w-form-done">
						<div>회원가입이 이루어 졌습니다.</div>
					</div>
					<div class="w-form-fail">
						<div>
							입력 양식에 어긋났습니다.<br>양식에 맞추어 다시 입력해 주세요.
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
<script>
var code = "";                //이메일전송 인증번호 저장위한 코드
/* 유효성 검사 통과유무 변수 */
var idckCheck = false;            // 아이디 중복 검사
var pwckcorCheck = false;        // 비번 확인 일치 확인
var nicknameCheck = false;  		//닉네임 확인
var mailnumCheck = false;        // 이메일 인증번호 확인

$('.id_input_re_1').css("display", "none");	
$('.id_input_re_2').css("display", "none");	
$('.pwck_input_re_1').css("display", "none");	
$('.pwck_input_re_2').css("display", "none");	
$('.name_input_re_1').css("display", "none");	
$('.name_input_re_2').css("display", "none");	
$('.mail_input_1').css("display", "none");	
$('.mail_input_2').css("display", "none");	
$(".mail_input_box_warn").css('color','white');

$(document).ready(function next() {
	$("#join_button").click(function(){//회원가입 버튼
        /* 최종 유효성 검사 */
        if(idckCheck&&nicknameckCheck&&pwckcorCheck&&mailnumCheck ){
        	 $("#join_form").attr("action", "${pageContext.request.contextPath}/user/join");
             $("#join_form").submit();
        }
        return false; 
    });
})

//아이디 중복검사
$('#ID').on("propertychange change keyup paste input", function(){

	var user_id = $('#ID').val();			// .id_input에 입력되는 값
	var data = {user_id : user_id}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/user/userIdChk",
		data : data,
		success : function(result){
			 console.log("성공 여부" + result);
			if(result != 'fail'){
				$('.id_input_re_1').css("display","inline-block");
				$('.id_input_re_1').css("color","green");
				$('.id_input_re_2').css("display", "none");	
				// 아이디 중복이 없는 경우
				idckCheck = true;
			} else {
				$('.id_input_re_2').css("display","inline-block");
				$('.id_input_re_2').css("color","red");
				$('.id_input_re_1').css("display", "none");			
				// 아이디 중복된 경우
				idckCheck = false;
			}
			
		}// success 종료
	}); // ajax 종료

});// function 종료
//닉네임 중복검사
$('#nickname').on("propertychange change keyup paste input", function(){

	var nickname = $('#nickname').val();			// .nickname_input에 입력되는 값
	var nickdata = {nickname : nickname}				// '컨트롤에 넘길 데이터 이름' : '데이터(.nickname_input에 입력되는 값)'
	
	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/user/NickNameChk",
		data : nickdata,
		success : function(result){
			 console.log("성공 여부" + result);
			if(result != 'fail'){
				$('.name_input_re_1').css("display","inline-block");
				$('.name_input_re_1').css("color","green");
				$('.name_input_re_2').css("display", "none");	
				//중복이 없는 경우
				nicknameckCheck = true;
			} else {
				$('.name_input_re_2').css("display","inline-block");
				$('.name_input_re_2').css("color","red");
				$('.name_input_re_1').css("display", "none");			
				//중복된 경우
				nicknameckCheck = false;
			}
			
		}// success 종료
	}); // ajax 종료

});// function 종료
/* 인증번호 이메일 전송*/
$("#mail_check_btn") .click(function(){
	
	var email = $("#email").val(); //입력한 이메일
	var cehckBox = $("#mailchknum");       // 인증번호 입력란
    var boxWrap = $(".mail_input");    // 인증번호 유효성 txt
    var warnMsg = $(".mail_input_box_warn");	// 이메일 입력 경고글
    
    /* 이메일 형식 유효성 검사 */
    if(mailFormCheck(email)){
        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
        warnMsg.css("display", "inline-block");
    } else {
        warnMsg.html("올바르지 못한 이메일 형식입니다.");
        warnMsg.css("display", "inline-block");
        return false;
    } 
    
	$.ajax({
	    type:"GET",
	    url:"${pageContext.request.contextPath}/user/mailCheck?email=" + email,
	    success:function(data){
	    	//console.log("data : " + data);
	    	cehckBox.attr("disabled",false);
	    	code = data;
	    }
	            
	});
});
/* 인증번호 비교 */
$("#mailchknum").blur(function(){
    
    var inputCode = $("#mailchknum").val();        // 입력코드    
    var checkResult = $("#mail_input");    // 비교 결과     
    
    if(inputCode == code){                            // 일치할 경우
    	$('.mail_input_1').css("display","inline-block");
		$('.mail_input_1').css("color","green");
		$('.mail_input_2').css("display", "none");	
		mailnumCheck = true;     // 일치할 경우
    } else {                                            // 일치하지 않을 경우
    	$('.mail_input_2').css("display","inline-block");
		$('.mail_input_2').css("color","red");
		$('.mail_input_1').css("display", "none");	
		mailnumCheck = false;    // 일치하지 않을 경우
    }    
    
});

/* 비밀번호 확인 일치 유효성 검사 */

$('#rePW').on("propertychange change keyup paste input", function(){
        
	var pw = $('#PW').val();
    var pwck = $('#rePW').val();
    $('.final_pwck_ck').css('display', 'none');
    
    if(pw == pwck){
        $('.pwck_input_re_1').css('display','block');
        $('.pwck_input_re_1').css('color','white');
        $('.pwck_input_re_2').css('display','none');
        pwckcorCheck = true;
    }else{
        $('.pwck_input_re_1').css('display','none');
        $('.pwck_input_re_2').css('color','white');
        $('.pwck_input_re_2').css('display','block');
        pwckcorCheck = false;
    }    
});
/* 입력 이메일 형식 유효성 검사 */
function mailFormCheck(email){
   var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
   return form.test(email);
}
</script>
</html>