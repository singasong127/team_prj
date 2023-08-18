package com.team.app.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CheckLoginSessionInterception extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		if(request.getSession().getAttribute("sessionId") != null) {
			
		}else {
			response.sendRedirect("/LoginPage");
			return false;
		}
		
		return super.preHandle(request, response, handler);

	}
}
