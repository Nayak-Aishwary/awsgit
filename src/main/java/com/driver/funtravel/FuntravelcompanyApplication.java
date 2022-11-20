package com.driver.funtravel;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

@SpringBootApplication
@EnableWebSecurity
public class FuntravelcompanyApplication {

	public static void main(String[] args) {
		SpringApplication.run(FuntravelcompanyApplication.class, args);
	}

}
