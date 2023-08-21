package com.team.app.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class CheckLoginSessionInterception implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		if(request.getSession().getAttribute("sessionId") != null) {
			
		}else {
			response.sendRedirect("/LoginPage");
			return false;
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);

	}
}
