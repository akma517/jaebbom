package com.sku.jaebbom.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sku.jaebbom.talent.model.TalentVO;
import com.sku.jaebbom.user.dao.UserDAO;
import com.sku.jaebbom.user.model.UserVO;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserDAO userDao;
	UserService userService;
	@Override
	public void joinMember(UserVO userVO) throws Exception {
		userDao.joinMember(userVO);
	
	}
	
	@Override
	public UserVO login(UserVO userVO) throws Exception{
		UserVO uservo = userDao.login(userVO);
		if(uservo == null) {
			//System.out.println("정보가 일치하지 않습니다.");
		}
		return uservo;
	}

	@Override
	public UserVO viewUser(UserVO userVO) {
		return userDao.viewUser(userVO);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	@Override
	public void deleteUser(UserVO userVO) throws Exception {
		userDao.deletUser(userVO);
		
	}

	@Override
	public UserVO getUserInfo(String user_id) throws Exception{
		return userDao.getUserInfo(user_id);
	}

	@Override
	public UserVO getUserUniv(String user_id) throws Exception{
		return userDao.getUserUniv(user_id);
	}

	@Override
	public UserVO getUserCareer(int user_num) throws Exception {
		return userDao.getUserCareer(user_num);
	}

	@Override
	public List<TalentVO> getregisteredTalent(int user_num) throws Exception {
		if (userDao == null) {
			System.out.println("없음");
		}
		return userDao.getregisteredTalent(user_num);
	}

	@Override
	public void updateUserInfo(UserVO userVO) throws Exception {
		userDao.updateUserInfo(userVO);
	}

	@Override
	public UserVO findid(String user_mail) throws Exception {
		return userDao.findid(user_mail);
	}
	@Override
	public UserVO findpw(UserVO userVO) throws Exception {
		return userDao.findpw(userVO);
	}

	@Override
	public void modifyPw(UserVO userVO) throws Exception {
		userDao.modifyPw(userVO);
	}
	
	@Override
	public int idCheck(String user_id) throws Exception {
		return userDao.idCheck(user_id);
	}

	@Override
	public int nickCheck(String nickname) throws Exception {
		return userDao.nickCheck(nickname);
	}
	@Override
	public int regUnivInfo(UserVO userVO) throws Exception {
		return userDao.regUnivInfo(userVO);
	}
}
