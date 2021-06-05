package com.sku.jaebbom.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptor extends HandlerInterceptorAdapter {
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		/**
		 * 컨트롤러 수행전에 세션 정보가 있는지 확인하는 처리
		 */
		logger.info("Interceptor: preHandle");
		boolean  blnRtn = false;
			
		String clientIp = request.getRemoteAddr();
		logger.info("ip:{}",clientIp);
			
		HttpSession httpSession = request.getSession();
			
		try {
			if( httpSession.getAttributeNames().hasMoreElements()){
		     
				// 세션이 있는 경우
		        logger.info("세션 있음:"  + httpSession.getAttributeNames());
		        blnRtn = true;
		} else {
		        // 세션이 없는 경우
		        logger.info("세션 없음");
		        response.sendRedirect("/jaebbom/user/loginPage.do");
		        blnRtn = false;
		    }
		} catch (Exception e) {
		}       
	    return blnRtn;
	}
	
}
