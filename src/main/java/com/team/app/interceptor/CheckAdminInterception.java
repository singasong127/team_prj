package com.team.app.interceptor;

import org.springframework.ui.Model;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckAdminInterception implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object sessionType = request.getSession().getAttribute("sessionType");
        Object sessionId = request.getSession().getAttribute("sessionId");
        if(sessionId != null && sessionType.equals("1")) {
        }else if(sessionId != null && sessionType.equals("0")){
            //if we want to alert them...
            request.setAttribute("alertMessage", "This is an alert message.");
            response.sendRedirect("/");
            return false;
        }

        return HandlerInterceptor.super.preHandle(request, response, handler);
    }
}
