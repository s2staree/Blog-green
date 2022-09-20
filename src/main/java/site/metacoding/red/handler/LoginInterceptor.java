package site.metacoding.red.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import site.metacoding.red.domain.users.Users;

public class LoginInterceptor implements HandlerInterceptor{
   
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      HttpSession session = request.getSession();
      Users principal = (Users)session.getAttribute("principal");
      if(principal == null) {
         return false;
      }
      System.out.println("실행됐다고!!!!!!!!!!!!!!!!");
      return true;
   }
}