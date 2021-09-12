package com.sku.jaebbom.chat;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.google.gson.Gson;
import com.sku.jaebbom.user.model.UserVO;

@Component
public class ChatHandler extends TextWebSocketHandler {
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	
	// 클라이언트에서 서버로 연결 처리
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 채팅방에 접속 한 사용자 세션을 리스트에 저장
		
		sessionList.add(session);

		//super.afterConnectionEstablished(session);
		
		//for (int i = 0; i < sessionList.size(); i++) {
			//WebSocketSession s = sessionList.get(i);
			//Map<String, Object> map = s.getAttributes();
			//System.out.println(map.values());
		//}
	}
	
	// 클라이언트에서 서버로의 연결 끊음을 처리
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 채팅방에서 퇴장한 사용자 세션을 리스트에서 제거
		System.out.println("연결이 끊어짐");
		// 모든 세션에 채팅 전달
/*		for (int i = 0; i < sessionList.size(); i++) {
			WebSocketSession s = sessionList.get(i);
			Map<String, Object> map = s.getAttributes();
			String nickname = (String)map.get("nickname");
			s.sendMessage(new TextMessage("퇴장하였습니다."));
		}*/
		for (WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage("상대방이 퇴장하였습니다."));
		}
		
		sessionList.remove(session);
	}
	
	// 클라이언트에서 버로 메세지 전송 처리
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		// 모든 세션에 채팅 전달
		for (WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(message.getPayload()));
		}
	}	
	
	
}
