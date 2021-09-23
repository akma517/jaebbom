package com.sku.jaebbom.talent.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sku.jaebbom.common.Paging;
import com.sku.jaebbom.common.Paging_re;
import com.sku.jaebbom.common.Search;
import com.sku.jaebbom.review.model.ReviewVO;
import com.sku.jaebbom.talent.model.TalentVO;
import com.sku.jaebbom.talent.model.TalentViewVO;

@Repository
public class TalentDAOImpl implements TalentDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 재능 매퍼 네임스페이스
	private static final String namespace = "com.sku.jaebbom.talent.talentMapper";
	
	// 리뷰 매퍼 네임스페이스
	private static final String namespace_re = "com.sku.jaebbom.review.reviewMapper";

	/**
	 * 재능 메소드
	 */
	
	@Override
	public List<TalentViewVO> getTalentList(Search search) throws Exception {
		return sqlSession.selectList(namespace + ".getTalentList", search);
	}

	@Override
	public TalentViewVO getTalent(int talent_num) throws Exception {
		return sqlSession.selectOne(namespace + ".getTalent", talent_num);
	}

	@Override
	public int insertTalent(TalentVO talentVO) throws Exception {
		return sqlSession.insert(namespace + ".insertTalent",  talentVO);
	}

	@Override
	public int updateTalent(TalentVO talentVO) throws Exception {
		return sqlSession.insert(namespace + ".updateTalent",  talentVO);
	}

	@Override
	public int deleteTalent(int talent_num) throws Exception {
		return sqlSession.delete(namespace + ".deleteTalent",  talent_num);
	}

	@Override
	public int getTalentListCnt(Search search) throws Exception {
		return sqlSession.selectOne(namespace + ".getTalentListCnt", search);
	}
	
	@Override
	public List<String> getAddressListBig() throws Exception {
		return sqlSession.selectList(namespace + ".getAddressListBig");
	}
	
	@Override
	public List<String> getAddressListSmall() throws Exception {
		return sqlSession.selectList(namespace + ".getAddressListSmall");
	}
	
	@Override
	public List<String> getCategoryListBig() throws Exception {
		return sqlSession.selectList(namespace + ".getCategoryListBig");
	}
	
	@Override
	public List<String> getCategoryListSmall() throws Exception {
		return sqlSession.selectList(namespace + ".getCategoryListSmall");
	}
	
	/**
	 * 테스트용 toString 메소드
	 */
	@Override
	public String toString() {
		return "TalentDAOImpl [sqlSession=" + sqlSession + ", getClass()=" + getClass() + "]";
	}
	
	/**
	 * 리뷰 메소드
	 */
	
	@Override
	public List<ReviewVO> getReviewList(Paging_re paging) throws Exception {
		return sqlSession.selectList(namespace_re + ".getReviewList", paging);
	}
	
	@Override
	public int deleteReview(int review_num) throws Exception {
		return sqlSession.delete(namespace_re + ".deleteReview", review_num);
	}
	
	@Override
	public int insertReview(ReviewVO reviewVO) throws Exception {
		return sqlSession.insert(namespace_re + ".insertReview", reviewVO);
	}
	
	@Override
	public int updateReview(ReviewVO reviewVO) throws Exception {
		return sqlSession.insert(namespace_re + ".updatetReview", reviewVO);
	}
	
	@Override
	public int getReviewListCnt(int talent_num) throws Exception {
		return sqlSession.selectOne(namespace_re + ".getReviewListCnt", talent_num );
	}
	
	
}
