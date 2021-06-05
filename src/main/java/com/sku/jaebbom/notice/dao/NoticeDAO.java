package com.sku.jaebbom.notice.dao;

import java.util.List;

import com.sku.jaebbom.common.Search;
import com.sku.jaebbom.notice.model.NoticeVO;

public interface NoticeDAO {
	public List<NoticeVO> getNoticeList(Search search) throws Exception;
	public NoticeVO getNotice(int notice_num) throws Exception;
	public int insertNotice(NoticeVO noticeVO) throws Exception;
	public int updateNotice(NoticeVO noticeVO) throws Exception;
	public int deleteNotice(int notice_num) throws Exception;
	public int getNoticeListCnt(Search search) throws Exception;
}