package com.sku.jaebbom;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sku.jaebbom.talent.dao.TalentDAO;
import com.sku.jaebbom.talent.model.TalentVO;
import com.sku.jaebbom.talent.model.TalentViewVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TalentDAOTest {
	private static final Logger logger = LoggerFactory.getLogger(TalentDAOTest.class);
	
	
	@Autowired
	private TalentDAO talentDAO;
	
	@Test @Ignore
	public void talentDAOConfirm() throws Exception {
		System.out.println(talentDAO.toString());
	}
	
	/*
	 * @Test @Ignore public void testGetTalentList() throws Exception {
	 * List<TalentViewVO> talentList = talentDAO.getTalentList();
	 * logger.info("\n Talent List \n "); if(talentList.size() > 0) { for
	 * (TalentViewVO list : talentList) { logger.info(list.getTitle()); } }else {
	 * logger.info("데이터가 없어요."); } }
	 */
	@Test 

	public void testGetTalentContent() throws Exception {

		TalentViewVO talentViewVO = talentDAO.getTalent(18);

		logger.info("\n 재능 정보 \n ");

		if(talentViewVO != null) {

			logger.info("재능제목 : " + talentViewVO.getTitle() );

			logger.info("재능내용 : " + talentViewVO.getContent() );

			logger.info("재능분류1 : " + talentViewVO.getCategory1() );

			logger.info("재능분류2 : " + talentViewVO.getCategory2() );

			logger.info("주소1: " + talentViewVO.getArea1() );

			logger.info("주소2 : " + talentViewVO.getArea2() );

			logger.info("매칭가능여부 : " + talentViewVO.getMatching_status() );
			
			logger.info("제공자 닉네임 : " + talentViewVO.getWriter() );
			
			logger.info("이용가능 시간 : " + talentViewVO.getDaytime() );
			
			logger.info("경력 : " + talentViewVO.getCareer() );
			
			logger.info("요금 : " + talentViewVO.getPay() );

		} else {

			logger.info("데이터가 없습니다.");

		}

	}

}
