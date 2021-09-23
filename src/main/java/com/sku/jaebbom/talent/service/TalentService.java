package com.sku.jaebbom.talent.service;

import java.util.List;

import com.sku.jaebbom.common.Paging;
import com.sku.jaebbom.common.Paging_re;
import com.sku.jaebbom.common.Search;
import com.sku.jaebbom.review.model.ReviewVO;
import com.sku.jaebbom.talent.model.TalentVO;
import com.sku.jaebbom.talent.model.TalentViewVO;

public interface TalentService {
	
	// 재능 메소드
	public List<TalentViewVO> getTalentList(Search search) throws Exception;
	public void insertTalent(TalentVO talentVO) throws Exception;
	public TalentViewVO getTalent(int talent_num) throws Exception;
	public void updateTalent(TalentVO talentVO) throws Exception;
	public void deleteTalent(int talent_num) throws Exception;
	public int getTalentListCnt(Search search) throws Exception;
	public List<String> getCategoryListBig()  throws Exception;
	public List<String> getCategoryListSmall()  throws Exception;
	public List<String> getAddressListBig()  throws Exception;
	public List<String> getAddressListSmall()  throws Exception;
	
	// 리뷰 메소드
	public List<ReviewVO> getReviewList(Paging_re paging) throws Exception;
	public int insertReview(ReviewVO reviewVO) throws Exception;
	public int updateReview(ReviewVO reviewVO) throws Exception;
	public int deleteReview(int review_num) throws Exception;
	public int getReviewListCnt(int talent_num) throws Exception;
}
