package com.sku.jaebbom.talent.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sku.jaebbom.common.Paging;
import com.sku.jaebbom.common.Paging_re;
import com.sku.jaebbom.common.Search;
import com.sku.jaebbom.review.model.ReviewVO;
import com.sku.jaebbom.talent.dao.TalentDAO;
import com.sku.jaebbom.talent.model.TalentVO;
import com.sku.jaebbom.talent.model.TalentViewVO;

@Service
public class TalentServiceImpl implements TalentService{
	
	@Autowired
	private TalentDAO talentDAO;
	
	// 재능 메소드
	@Override
	public List<TalentViewVO> getTalentList(Search search) throws Exception {
		return talentDAO.getTalentList(search);	
	}
	
	@Override
	public void insertTalent(TalentVO talentVO) throws Exception {
		talentDAO.insertTalent(talentVO);
	}
	
	@Override
	public TalentViewVO getTalent(int talent_num) throws Exception {
		return talentDAO.getTalent(talent_num);
	}
	
	@Override
	public void updateTalent(TalentVO talentVO) throws Exception {
		talentDAO.updateTalent(talentVO);
	}
	
	@Override
	public void deleteTalent(int talent_num) throws Exception {
		talentDAO.deleteTalent(talent_num);	
	}
	
	@Override
	public int getTalentListCnt(Search search) throws Exception {
		return talentDAO.getTalentListCnt(search);
	}
	
	
	// 리뷰 메소드
	@Override
	public int deleteReview(int review_num) throws Exception {
		return talentDAO.deleteReview(review_num);
	}
	
	@Override
	public List<ReviewVO> getReviewList(Paging_re paging) throws Exception {
		return talentDAO.getReviewList(paging);
	}
	
	@Override
	public int getReviewListCnt(int talent_num) throws Exception {
		return talentDAO.getReviewListCnt(talent_num);
	}
	
	@Override
	public int insertReview(ReviewVO reviewVO) throws Exception {
		return talentDAO.insertReview(reviewVO);
	}
	
	@Override
	public int updateReview(ReviewVO reviewVO) throws Exception {
		return talentDAO.updateReview(reviewVO);
	}
	
	@Override
	public List<String> getAddressListBig() throws Exception {
		return talentDAO.getAddressListBig();
				
	}
	
	@Override
	public List<String> getAddressListSmall() throws Exception {
		return talentDAO.getAddressListSmall();
	}
	
	@Override
	public List<String> getCategoryListBig() throws Exception {
		return talentDAO.getCategoryListBig();
	}
	
	@Override
	public List<String> getCategoryListSmall() throws Exception {
		return talentDAO.getCategoryListSmall();
	}
	
}
