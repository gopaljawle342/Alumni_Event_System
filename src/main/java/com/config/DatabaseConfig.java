package com.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
@ComponentScan(basePackages = { "com.repository", "com.services", "com.controller" })
public class DatabaseConfig {

	@Bean(name = "ds")
	public DataSource getDataSource() {
		DriverManagerDataSource dSource = new DriverManagerDataSource();
		dSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		dSource.setUrl("jdbc:mysql://localhost:3306/java");
		dSource.setUsername("root");
		dSource.setPassword("1234");
		System.out.println("DataSource");
		return dSource;
	}

	@Bean(name = "jt")
	public JdbcTemplate getTemplate() {
		JdbcTemplate jTemplate = new JdbcTemplate(getDataSource());
		System.out.println("GetTemplate");
		return jTemplate;
	}

}
