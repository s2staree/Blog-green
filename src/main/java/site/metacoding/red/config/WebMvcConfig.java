package site.metacoding.red.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import site.metacoding.red.handler.HelloInterceptor;
import site.metacoding.red.handler.LoginInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor())
		.addPathPatterns("/s/**");
		registry.addInterceptor(new HelloInterceptor())
		.addPathPatterns("/hello/**");
//		.addPathPatterns("/admin/**")
//		.excludePathPatterns("/s/boards/**")
//		;	// /s/** => /s/boards, s/users	XXXX /s/boards/1
	}
}
