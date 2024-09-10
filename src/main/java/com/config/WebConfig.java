package com.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import jakarta.servlet.MultipartConfigElement;


@Configuration
@ComponentScan(basePackages = { "com" })
@EnableWebMvc
public class WebConfig implements WebMvcConfigurer {

	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	
	 @Bean
	    public StandardServletMultipartResolver multipartResolver() {
	        return new StandardServletMultipartResolver();
	    }

	    @Bean
	    public MultipartConfigElement multipartConfigElement() {
	        return new MultipartConfigElement("/tmp", 20971520, 41943040, 0); // Set file size thresholds
	    }	 
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/WEB-INF/resources/");
	}
}
