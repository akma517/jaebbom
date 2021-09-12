package com.sku.jaebbom.user.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sku.jaebbom.talent.model.TalentVO;
import com.sku.jaebbom.user.model.UserVO;


@Repository
public class UserDAOImpl implements UserDAO{
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.sku.jaebbom.user.userMapper";

	@Override
	public UserVO login(UserVO userVO) throws Exception{
		System.out.println("체크중....");
		return sqlSession.selectOne(namespace+".login", userVO);
	}
	@Override
	public UserVO viewUser(UserVO userVO) {
		return sqlSession.selectOne(namespace+".getUserInfo", userVO);
	}
	@Override
	public void logout(HttpSession session) {
	}
	@Override
	public int joinMember(UserVO userVO){
		return sqlSession.insert(namespace+".insertUser",  userVO);
	}
	@Override
	public int deletUser(UserVO userVO){
		return sqlSession.insert(namespace+".deleteUser",  userVO);
	}
	@Override
	public UserVO getUserInfo(String user_id) throws Exception{
		//System.out.println("getUserInfo 체크중....");
		return sqlSession.selectOne(namespace+".getUserInfo",  user_id);
	}
	@Override
	public UserVO getUserUniv(String user_id) throws Exception{
		//System.out.println("getUserUniv 체크중....");
		return sqlSession.selectOne(namespace+".getUserUniv",  user_id);
	}
	@Override
	public UserVO getUserCareer(int user_num) throws Exception {
		return sqlSession.selectOne(namespace+".getUserCareer",  user_num);
	}
	@Override
	public List<TalentVO> getregisteredTalent(int user_num) throws Exception {
		List<TalentVO> asdf = sqlSession.selectList(namespace+".registeredTalent",  user_num);
		return asdf;
	}
	@Override
	public int updateUserInfo(UserVO userVO) throws Exception {
		return sqlSession.insert(namespace+".updateUser", userVO);
	}
	@Override
	public UserVO findid(String user_mail) throws Exception {
		return sqlSession.selectOne(namespace+".findUserId", user_mail);
	}
	@Override
	public UserVO findpw(UserVO userVO) throws Exception {
		return sqlSession.selectOne(namespace+".findUserPw", userVO);
	}
	@Override
	public void modifyPw(UserVO userVO) throws Exception {
		sqlSession.insert(namespace+".modifyPW", userVO);
	}
	@Override
	public int idCheck(String user_id) {
		return sqlSession.selectOne(namespace+".idCheck", user_id);
	}
	@Override
	public int nickCheck(String nickname) {
		return sqlSession.selectOne(namespace+".nicknameCheck", nickname);
	}
	
	@Override
	public int regUnivInfo(UserVO userVO) throws Exception {
		return sqlSession.insert(namespace+".regUnivInfo", userVO);
	}
	@Override
	public int insertCareer(UserVO userVO) {
		return sqlSession.insert(namespace+".insertCareer", userVO );
	}
	
	
	
}
