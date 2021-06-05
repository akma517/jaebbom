package com.sku.jaebbom.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sku.jaebbom.common.Search;
import com.sku.jaebbom.notice.dao.NoticeDAO;
import com.sku.jaebbom.notice.model.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;
	
	public List<NoticeVO> getNoticeList(Search search) throws Exception {
		return noticeDAO.getNoticeList(search);
	}

	@Override
	public NoticeVO getNotice(int notice_num) throws Exception {
		return noticeDAO.getNotice(notice_num);
	}

	@Override
	public int insertNotice(NoticeVO noticeVO) throws Exception {
		return noticeDAO.insertNotice(noticeVO);
	}

	@Override
	public int updateNotice(NoticeVO noticeVO) throws Exception {
		return noticeDAO.updateNotice(noticeVO);
	}

	@Override
	public int deleteNotice(int notice_num) throws Exception {
		return noticeDAO.deleteNotice(notice_num);
	}

	@Override
	public int getNoticeListCnt(Search search) throws Exception {
		return noticeDAO.getNoticeListCnt(search);
	}

}
