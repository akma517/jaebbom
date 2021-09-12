package com.sku.jaebbom.user.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.sku.jaebbom.talent.model.TalentVO;
import com.sku.jaebbom.user.model.UserVO;


public interface UserDAO {
	/**
	 * 로그인 기능
	 * */
	public UserVO login(UserVO vo) throws Exception;
	public UserVO viewUser(UserVO vo);
	
	public void logout(HttpSession session);
	/**
	 * 회원가입 기능
	 * */
	public int joinMember(UserVO userVO);
	/**
	 * 회원탈퇴 기능
	 * */
	public int deletUser(UserVO userVO);
	/**
	 * 회원정보열람 기능
	 * */
	public UserVO getUserInfo(String user_id)throws Exception;
	/**
	 * 회원 대학정보열람 기능
	 * */
	public UserVO getUserUniv(String user_id)throws Exception;
	/**
	 * 회원 경력정보열람 기능
	 * */
	public UserVO getUserCareer(int user_num)throws Exception;
	/**
	 * 회원 작성한 글 열람 기능
	 * */
	public List<TalentVO> getregisteredTalent(int user_num)throws Exception;
	/**
	 * 회원정보 수정 기능
	 * */
	public int updateUserInfo(UserVO userVO)throws Exception;
	/**
	 * 아이디찾기
	 * */
	public UserVO findid(String user_mail)throws Exception;
	/**
	 * 비번찾기
	 * */
	public UserVO findpw(UserVO userVO)throws Exception;
	/**
    * 비번 변경
    * */
	public void modifyPw(UserVO userVO)throws Exception;
	
	// 아이디 중복 검사
	public int idCheck(String user_id);
	// 닉네임 중복 검사
	public int nickCheck(String nickname);
	
	// 대학 정보 등록
	public int regUnivInfo(UserVO userVO)throws Exception;
	
	// 자격 및 경력 등록
	public int insertCareer(UserVO userVO);
	
}
