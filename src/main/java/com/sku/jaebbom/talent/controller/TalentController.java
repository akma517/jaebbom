package com.sku.jaebbom.talent.controller;

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

import com.sku.jaebbom.common.Paging;
import com.sku.jaebbom.common.Paging_re;
import com.sku.jaebbom.common.Search;
import com.sku.jaebbom.review.model.ReviewVO;
import com.sku.jaebbom.talent.model.TalentVO;
import com.sku.jaebbom.talent.model.TalentViewVO;
import com.sku.jaebbom.talent.service.TalentService;
import com.sku.jaebbom.user.model.UserVO;


@Controller
@RequestMapping("/talent")
public class TalentController {

	@Autowired
	private TalentService talentService;
	
	/**
	 * 	검색 기능과 페이징 기능을 가미한 재능 리스트 찾기
	 */
	@RequestMapping(value = "/talentListPage.do", method = RequestMethod.GET)
	public String talentListPage(Model model,
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
		
		// 등록된 재능 수 확인
		int listCnt = talentService.getTalentListCnt(search);
		
		// 페이징
		search.pageInfo(page, range, listCnt);

		// search 객체를 페이징이란 이름으로 모델에 추가 (search 객체가 페이징을 확장했기에 가능)
		model.addAttribute("paging", search);
		
		model.addAttribute("talentList", talentService.getTalentList(search));
		
		return "talent/talentListPage";
	}
	
	/**
	 * 	재능 등록 페이지로 이동
	 */
	@RequestMapping(value = "/talentRegPage.do", method = RequestMethod.GET)
	public String talentRegPage(@ModelAttribute("talentVO") TalentVO talentVO, Model model,  HttpSession session) {
		
		UserVO user = (UserVO) session.getAttribute("login");
		
		model.addAttribute("user",user);
		model.addAttribute("changedText", "등록");
		return "talent/talentRegPage";
	}

	/**
	 * 	재능 등록하기
	 */
	@RequestMapping(value = "/talentRegPage.do", method = RequestMethod.POST)
	public String insertTalent(@ModelAttribute("TalentVO") TalentVO talentVO, @RequestParam("mode") String mode,
			@RequestParam("talent_num") String talent_num, RedirectAttributes rdab) throws Exception {
		String addr = new String();
		if (mode.equals("edit")) {
			talentService.updateTalent(talentVO);
			addr = "redirect:/talent/talentPage.do";
			addr += "?talent_num=";
			addr += talent_num;
			return addr;
		} else {
			addr = "redirect:/talent/talentListPage.do";
			talentService.insertTalent(talentVO);
			return addr;
		}
	}
	
	/**
	 * 	재능 상세 보기 페이지로 이동
	 */
	@RequestMapping(value = "/talentPage.do", method = RequestMethod.GET)
	public String talentPage(Model model, @RequestParam("talent_num") int talent_num,
			@ModelAttribute("paging") Paging_re paging,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		try {
			
			int listCnt = talentService.getReviewListCnt(talent_num);
			
			paging.setTalent_num(talent_num);
			
			// 페이징
			paging.pageInfo(page, range, listCnt);
			
			model.addAttribute("paging", paging);
			
			model.addAttribute("talent", talentService.getTalent(talent_num));
			
			
			model.addAttribute("reviewList", talentService.getReviewList(paging));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "talent/talentPage";
	}
	
	/**
	 * 	재능 변경 페이지로 이동
	 */
	@RequestMapping(value = "/talentUpdatePage.do", method = RequestMethod.GET)
	public String updateTalent(@RequestParam("talent_num") int talent_num, @RequestParam("mode") String mode,
			Model model) throws Exception {
		model.addAttribute("talent", talentService.getTalent(talent_num));
		model.addAttribute("mode", mode);
		model.addAttribute("talentVO", new TalentVO());
		model.addAttribute("changedText", "수정");
		return "talent/talentRegPage";
	}

	/**
	 * 	재능 삭제하기
	 */
	@RequestMapping(value = "/talentDelete.do", method = RequestMethod.GET)
	public String deleteTalent(@RequestParam("talent_num") int talent_num, RedirectAttributes rdab) throws Exception {
		talentService.deleteTalent(talent_num);
		return "redirect:/talent/talentListPage.do";
	}
	
	/**
	 * 	리뷰 등록 페이지로 이동
	 */
	@RequestMapping(value = "/reviewRegPage.do", method = RequestMethod.GET)
	public String reviewRegPage(@ModelAttribute("reviewVO") ReviewVO reviewVO, @RequestParam("talent_num") int talent_num,
			Model model, HttpSession session) throws Exception {
		
		model.addAttribute("talent", talentService.getTalent(talent_num));
		
		UserVO user = (UserVO) session.getAttribute("login");
		model.addAttribute("user", user);
		
		return "review/reviewRegPage";
	}
	
	/**
	 * 	리뷰 등록하기
	 */
	@RequestMapping(value = "/reviewRegPage.do", method = RequestMethod.POST)
	public String insertReview(@ModelAttribute("reviewVO") ReviewVO reviewVO, 
			@RequestParam("talent_num") int talent_num, Model model) throws Exception {
		System.out.println(reviewVO.toString());
		
		talentService.insertReview(reviewVO);
		
		model.addAttribute("finish","finish" );
		return "review/reviewRegPage";

	}
	
	/**
	 * 	리뷰 삭제하기
	 */
	@RequestMapping(value = "/reviewDelete.do", method = RequestMethod.GET)
	public String deleteReview(
			@RequestParam("review_num") int review_num, 
			Model model, @RequestParam("talent_num") int talent_num,
			@ModelAttribute("paging") Paging_re paging,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		
		talentService.deleteReview(review_num);

		int listCnt = talentService.getReviewListCnt(talent_num);
		
		// 리뷰 삭제 후 기존 재능 페이지로 돌아가기
		paging.setTalent_num(talent_num);
		paging.pageInfo(page, range, listCnt);
		model.addAttribute("paging", paging);
		model.addAttribute("talent", talentService.getTalent(talent_num));
		model.addAttribute("reviewList", talentService.getReviewList(paging));

		return "talent/talentPage";
	}
	

}
