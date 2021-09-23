package com.sku.jaebbom.talent.dao;

import java.util.List;

import com.sku.jaebbom.common.Paging;
import com.sku.jaebbom.common.Paging_re;
import com.sku.jaebbom.common.Search;
import com.sku.jaebbom.review.model.ReviewVO;
import com.sku.jaebbom.talent.model.TalentVO;
import com.sku.jaebbom.talent.model.TalentViewVO;

public interface TalentDAO {
	
	// 재능 메소드
	public List<TalentViewVO> getTalentList(Search search) throws Exception;
	public TalentViewVO getTalent(int talent_num) throws Exception;
	public int insertTalent(TalentVO talentVO) throws Exception;
	public int updateTalent(TalentVO talentVO) throws Exception;
	public int deleteTalent(int talent_num) throws Exception;
	public int getTalentListCnt(Search search) throws Exception;
	public List<String> getCategoryListBig()  throws Exception;
	public List<String> getCategoryListSmall()  throws Exception;
	public List<String> getAddressListBig()  throws Exception;
	public List<String> getAddressListSmall()  throws Exception;
	
	// 리뷰 메소드입니다.
	public List<ReviewVO> getReviewList(Paging_re paging) throws Exception;
	public int insertReview(ReviewVO reviewVO) throws Exception;
	public int updateReview(ReviewVO reviewVO) throws Exception;
	public int deleteReview(int review_num) throws Exception;
	public int getReviewListCnt(int talent_num) throws Exception;

}
