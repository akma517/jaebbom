package com.sku.jaebbom.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final String login = "login";
    private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
    
	/**
	 *  Controller가 호출되기 전에 수행
	 */
    @Override
	public boolean preHandle(
			HttpServletRequest  request, 
			HttpServletResponse response, 
			Object handler)
	throws Exception {
		
		logger.info("Interceptor: preHandle");
		HttpSession httpSession = request.getSession();
		logger.info("세션에 정보 확인:{}" , httpSession.getAttributeNames().hasMoreElements() );
		try {
			if ( httpSession.getAttributeNames().hasMoreElements() ) {
				logger.info("세션 정보 초기화");
				httpSession.invalidate();
			} else {
				logger.info("세션 정보가 없음");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		httpSession = null;
		return true;
	}

	/**
	 *  Controller가 완료된 이후에 수행
	 */
	@Override
	public void postHandle(
			HttpServletRequest  request, 
			HttpServletResponse response, 
			Object handler, 
			ModelAndView modelAndView)
	throws Exception {
		
    	System.out.println("인터셉트 진입 ");
        
		logger.info("Interceptor: postHandle");
		HttpSession httpSession = request.getSession();
		try {
			// 전달된 정보를 보고 세션을 부여한다.
			ModelMap modelMap = modelAndView.getModelMap();
			Object userVO =  modelMap.get("user");
			if (userVO == null) {
				logger.info("회원 정보 없음");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter response1 = response.getWriter();
				response1.append("<script>");
				response1.append("alert('입력하신 회원 정보는 등록되어있지 않은 회원 정보입니다.\\n아이디와 비밀번호를 다시 한 번 확인해 주세요.');");
				response1.append("location.href='/jaebbom/user/loginPage.do'");
				response1.append("</script>");
				response1.flush();
				httpSession = null;
			} else {
				logger.info("회원 정보 존재");
				// 세션에 값을 부여합니다.
				httpSession.setAttribute(login, userVO);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter response1 = response.getWriter();
				response1.append("<script>");
				response1.append("location.href='/jaebbom/'");
				response1.append("</script>");
				response1.flush();
				httpSession = null;

				logger.info("세션 할당 종료");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
