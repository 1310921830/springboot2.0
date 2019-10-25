package com.example.demo;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author Administrator
 * @date 2019年10月14日
 * @version 1.0
 */
@Configuration
public class MyMvcConfig implements WebMvcConfigurer {

	// 所有的WebMvcConfigurerAdapter组件都会一起起作用
	@Bean // 将组件注册在容器中
	public WebMvcConfigurer webMvcConfigurerAdapter() {
		return new WebMvcConfigurer() {

			// 注册拦截器
			@Override
			public void addInterceptors(InterceptorRegistry registry) {
				/*
				 * 其中addInterceptor方法用于把刚才创建的拦截器加入到registry中,addPathPatterns用户加入所要拦截的url，
				 * /表示拦截所有请求。excludePathPatterns添加不需要拦截的请求。
				 */
				registry.addInterceptor(new LoginInterceptor()).addPathPatterns("/**").excludePathPatterns("/login",
						"/img/**", "/js/**", "/style/**","/upload/**","/swagger-resources/**",
						"/webjars/**", "/v2/**", "/swagger-ui.html/**");

			}

			@Override
			public void addResourceHandlers(ResourceHandlerRegistry registry) {
				// TODO Auto-generated method stub
				registry.addResourceHandler("/upload/**").addResourceLocations("file:F:/imgs/");
				// 解决swagger无法访问
				registry.addResourceHandler("/swagger-ui.html").addResourceLocations("classpath:/META-INF/resources/");
				// 解决swagger的js文件无法访问
				registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/");
				registry.addResourceHandler("/swagger/**").addResourceLocations("classpath:/static/swagger/");
				WebMvcConfigurer.super.addResourceHandlers(registry);
			}
		};
	}

}
