<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<title>chatPage</title>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link
	href="${pageContext.request.contextPath}/resources/css/jaebbom.css"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">
		
		// 상대방 신고
		function fn_report_talent(talent_num){
			let url = "${pageContext.request.contextPath}/reportPage.do";
			url = url + "?talent_num=" + talent_num;
			let newWin = window.open(url);
			newWin.focus();
		}
		
		// 엔터키로 채팅 보내기
		$(document).ready(function() {
            $("#message").keydown(function(key) {
                //키의 코드가 13번일 경우 (엔터키일 경우)
                if (key.keyCode == 13) {
                	webSocket.sendChat('<c:out value="${user.nickname}" />');
                }
            });
    		
        });
		

		// 채팅을 위한 웹 소켓
		var webSocket = {
			init: function(param) {
				this._url = param.url;
				this._initSocket();
			},
			sendChat: function(user_nickname) {
				this._sendMessage(user_nickname,$('#message').val());
				$('#message').val('');
			},
			receiveMessage: function(strObj) {
				let chat = strObj.split("\n",2);	// 유저 구분 테스트를 위한 값 (의미 없음) (나중에 기능 성공하면 지움)
				
				console.log(chat);
				
				if (chat[0]=='${user.nickname}'){
					$('.div-block-4_message').append('<div class="userblock">');
					$('.div-block-4_message').append('<div class="userchatname">' + chat[0] + '</div>');
					$('.div-block-4_message').append('<div class="userchat">' + chat[1] + '</div>');
					$('.div-block-4_message').append('</div>');
				} else{
					$('.div-block-4_message').append('<div class="providerblock">');
					$('.div-block-4_message').append('<div class="providerchatname">'+ chat[0] +'</div>');
					$('.div-block-4_message').append('<div class="providerchat">' + chat[1] + '</div>');
					$('.div-block-4_message').append('</div>');
				}
				
            	// 자동 스크롤 다운
            	$('.div-block-4_message').scrollTop($('.div-block-4_message')[0].scrollHeight);
            	
			},
			closeMessage: function(str) {
				$('.div-block-4_message').append('<div>' + '연결 끊김 : ' + str + '</div>');
			},
			disconnect: function() {
				this._socket.close();
			},
			_initSocket: function() {
				this._socket = new SockJS(this._url);
				this._socket.onmessage = function(evt) {
					webSocket.receiveMessage(evt.data);
				};
				this._socket.onclose = function(evt) {
					webSocket.closeMessage(evt.data);
				}
			},
			_sendMessage: function(user_nickname,str) {
				this._socket.send(user_nickname + "\n" +str);
			}
		};
		
	</script>
<script type="text/javascript">
		$(document).ready(function() {
			webSocket.init({ url: '<c:url value="/chat" />' });			
		});
	</script>
	<style>
		.searchservicblock {margin-top:10px; align-items: flex-end;}
		.searchservicebutten w-button {margin-top: 5px; margin-bottom: 5px;}
		.div-block-4 {
			min-height: 400px;
			min-width: 500px;
			max-height: 500px;
			max-width: 500px;
		}
		.div-block-4_message {
			min-height: 380px;
			min-width: 480px;
			max-height: 480px;
			max-width: 480px;
		 	overflow-y:scroll;
		 	display: -webkit-box;
    		display: -webkit-flex;
   			display: -ms-flexbox;
    		display: flex;
    		-webkit-box-orient: vertical;
    		-webkit-box-direction: normal;
    		-webkit-flex-direction: column;
    		-ms-flex-direction: column;
    		flex-direction: column;
    		-webkit-box-pack: start;
    		-webkit-justify-content: flex-start;
    		-ms-flex-pack: start;
    		justify-content: flex-start;
    		-webkit-box-align: stretch;
    		-webkit-align-items: stretch;
    		-ms-flex-align: stretch;
    		align-items: stretch;
    		-webkit-box-flex: 1;
    		-webkit-flex: 1;
    		-ms-flex: 1;
    		flex: 1;
		}
		::-webkit-scrollbar {
  			display: none;
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
	<div class="chat w-container">
		<h1 class="heading-9">${talent.title}</h1>
		<div class="w-form">
			<div id="wf-form-Contact-Form" name="wf-form-Contact-Form"
				data-name="Contact Form">
				<div class="contact-form-grid-2">
					<div id="w-node-_0dae6e95-b8b3-bce9-d7bd-afa0b26382c7-aaedb22f" name="chat_block" class="div-block-4">
						<h1 class="heading-6">${talent.writer}</h1>
						<div class="div-block-4_message">
						</div>
					</div>
					<div class="searchservicblock" >
						<input type="text" id="message" class="searchserviceinput w-input"
							maxlength="256" name="message" autocomplete="off" />
						<button name="bt" class="searchservicebutten w-button" id="chat_send_button"
							onclick="webSocket.sendChat('<c:out value="${user.nickname}" />')">전송</button>
					</div>
				</div>
			</div>
		</div>
		<div class="div-block-17">
			<a href="#" class="use w-button"> <strong>서비스 이용 완료</strong>
			</a> <a href=# class="report w-button" onClick="fn_report_talent(${talent.talent_num})"> 
			<strong class="bold-text-5">신고</strong>
			</a>
		</div>
	</div>
</body>
</html>
