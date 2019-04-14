package cn.ganiner.util;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//拦截器
public class LoginInterceptor implements HandlerInterceptor {
    // 拦截所有请求
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        // 判断session中是否存在用户信息
        HttpSession session = request.getSession();
        // 获取session中的用户信息
        String username = (String) session.getAttribute("usersession");
        if (username != null) {
            return true; // 放行
        }
        // 获取请求路径
        String path = request.getRequestURI();
        if (path.contains("user/login.do")) {
            return true;
        }
        // 重定向到登录页面
//        request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}

