package com.sku.jaebbom.notice.controller;

import java.net.URLDecoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sku.jaebbom.common.Search;
import com.sku.jaebbom.notice.model.NoticeVO;
import com.sku.jaebbom.notice.service.NoticeService;
import com.sku.jaebbom.user.model.UserVO;

@Controller
@RequestMapping("/notice")
public class NoticeContorller {

	/**
	 *  talent 페이지과 유사한 방식으로 구현함
	 */
	
	
	@Autowired
	private NoticeService noticeService;
	
	/**
	 * 	검색 기능과 페이징 기능을 가미한 공지사항 리스트 페이지 가기
	 */
	@RequestMapping(value = "/noticeListPage.do", method = RequestMethod.GET)
	public String noticeListPage(Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false, defaultValue = "0") int category1_num,
			@RequestParam(required = false, defaultValue = "0") int category2_num,
			@RequestParam(required = false, defaultValue = "0") int area1_num,
			@RequestParam(required = false, defaultValue = "0") int area2_num,
			@RequestParam(required = false, defaultValue = "") String keyword,
			@ModelAttribute("search") Search search)
					throws Exception {

		 //search 객체를 생성하여 모델에 더해주며 리퀘스트 받은 인자 값을 설정한다.
		model.addAttribute("search", search);
		System.out.println("디코딩 전:" + keyword);
		keyword = URLDecoder.decode(keyword, "UTF-8");
		search.setArea1_num(area1_num);
		search.setArea2_num(area2_num);
		search.setCategory1_num(category1_num);
		search.setCategory2_num(category2_num);
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		System.out.println(keyword);
		
		System.out.println(search.toString());
		
		// 등록된 공지사항 수 확인
		int listCnt = noticeService.getNoticeListCnt(search);
		
		// 페이징
		search.pageInfo(page, range, listCnt);

		// search 객체를 페이징이란 이름으로 모델에 추가 (search 객체가 페이징을 확장했기에 가능)
		model.addAttribute("paging", search);
		
		model.addAttribute("noticeList", noticeService.getNoticeList(search));
		
		return "notice/noticeListPage";
	}
	
	/**
	 *  공지사항 등록 페이지 가기
	 */
	@RequestMapping(value = "/noticeRegPage.do", method = RequestMethod.GET)
	public String noticeRegPage(@ModelAttribute("noticeVO") NoticeVO noticeVO, Model model,
			HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("login");
		model.addAttribute("changedText", "등록");
		model.addAttribute("user", user);
		return "notice/noticeRegPage";
	}

	/**
	 *  공지사항 등록하기
	 */
	@RequestMapping(value = "/noticeRegPage.do", method = RequestMethod.POST)
	public String insertNotice(@ModelAttribute("noticeVO") NoticeVO noticeVO, @RequestParam("mode") String mode,
			@RequestParam("notice_num") String notice_num, RedirectAttributes rdab) throws Exception {
		String addr = new String();
		if (mode.equals("edit")) {
			noticeService.updateNotice(noticeVO);
			addr = "redirect:/notice/noticePage.do";
			addr += "?notice_num=";
			addr += notice_num;
			return addr;
		} else {
			addr = "redirect:/notice/noticeListPage.do";
			noticeService.insertNotice(noticeVO);
			return addr;
		}
	}

	/**
	 *  공지사항 상세 보기 
	 */
	@RequestMapping(value = "/noticePage.do", method = RequestMethod.GET)
	public String noticePage(Model model, @RequestParam("notice_num") int notice_num) {
		try {
			model.addAttribute("notice", noticeService.getNotice(notice_num));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "notice/noticePage";
	}

	/**
	 *  공지사항 수정하기
	 */
	@RequestMapping(value = "/noticeUpdatePage.do", method = RequestMethod.GET)
	public String updateNotice(@RequestParam("notice_num") int notice_num, @RequestParam("mode") String mode,
			Model model) throws Exception {
		model.addAttribute("notice", noticeService.getNotice(notice_num));
		model.addAttribute("mode", mode);
		model.addAttribute("noticeVO", new NoticeVO());
		model.addAttribute("changedText", "수정");
		return "notice/noticeRegPage";
	}

	/**
	 *  공지사항 삭제하기
	 */
	@RequestMapping(value = "/noticeDelete.do", method = RequestMethod.GET)
	public String deleteNotice(@RequestParam("notice_num") int notice_num, RedirectAttributes rdab) throws Exception {
		noticeService.deleteNotice(notice_num);
		return "redirect:/notice/noticeListPage.do";
	}
	
}
