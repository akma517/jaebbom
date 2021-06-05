package com.sku.jaebbom.chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sku.jaebbom.talent.service.TalentService;
import com.sku.jaebbom.user.model.UserVO;


@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	private TalentService talentService;
	
	
	// 채팅방 입장
	@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
	public String chatPage(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session, @RequestParam("talent_num") int talent_num) throws Exception {
		UserVO user = (UserVO) session.getAttribute("login");
		
		model.addAttribute("talent", talentService.getTalent(talent_num));
		model.addAttribute("user", user);
		
		return "chat/chatPage";
	}
	
}
