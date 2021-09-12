package com.sku.jaebbom.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import com.sku.jaebbom.talent.model.TalentVO;
import com.sku.jaebbom.user.model.UserVO;

@Repository
public interface UserService {
	/**
	 * 회원가입
	 * */
	public void joinMember(UserVO userVO) throws Exception;
	
	/**
	 * 로그인 체크
	 * */
   	public UserVO login(UserVO userVO) throws Exception;
   	public UserVO viewUser(UserVO userVO);
   	public void logout(HttpSession session);
   /**
    * 회원정보 삭제
    * */
   	public void deleteUser(UserVO userVO)throws Exception;
   /**
    * 회원정보 열람
    * */
   	public UserVO getUserInfo(String user_id)throws Exception;
   	public UserVO getUserUniv(String user_id)throws Exception;
   	public UserVO getUserCareer(int user_num)throws Exception;
   	public List<TalentVO> getregisteredTalent(int user_num) throws Exception;
   /**
    * 회원정보 수정
    * */
   	public void updateUserInfo(UserVO userVO) throws Exception;
   /**
    * 아이디 가져오기
    * */
   	public UserVO findid(String user_mail) throws Exception;
   /**
    * 비번 가져오기
    * */
   	public UserVO findpw(UserVO userVO) throws Exception;
   /**
    * 비번 변경
    * */
   	public void modifyPw(UserVO userVO) throws Exception;
   
   	// 아이디 중복 검사
   	public int idCheck(String user_id) throws Exception;

	// 아이디 중복 검사
   	public int nickCheck(String nickname) throws Exception;
   	
   	// 대학 정보 등록
   	public int regUnivInfo(UserVO userVO)throws Exception;

   	// 자격 및 경력 등록
	public int insertCareer(UserVO userVO);
}
