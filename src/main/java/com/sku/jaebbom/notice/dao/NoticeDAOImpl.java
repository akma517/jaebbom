package com.sku.jaebbom.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sku.jaebbom.common.Search;
import com.sku.jaebbom.notice.model.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.sku.jaebbom.notice.noticeMapper";
	
	@Override
	public List<NoticeVO> getNoticeList(Search search) throws Exception {
		return sqlSession.selectList(namespace + ".getNoticeList", search);
	}

	@Override
	public NoticeVO getNotice(int notice_num) throws Exception {
		return sqlSession.selectOne(namespace + ".getNotice", notice_num);
	}

	@Override
	public int insertNotice(NoticeVO noticeVO) throws Exception {
		return sqlSession.insert(namespace + ".insertNotice",  noticeVO);
	}

	@Override
	public int updateNotice(NoticeVO noticeVO) throws Exception {
		return sqlSession.insert(namespace + ".updateNotice",  noticeVO);
	}

	@Override
	public int deleteNotice(int notice_num) throws Exception {
		return sqlSession.delete(namespace + ".deleteNotice",  notice_num);
	}

	@Override
	public int getNoticeListCnt(Search search) throws Exception {
		return sqlSession.selectOne(namespace + ".getNoticeListCnt", search);
	}

}
