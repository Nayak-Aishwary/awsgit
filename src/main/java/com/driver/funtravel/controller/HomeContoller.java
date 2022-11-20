package com.driver.funtravel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeContoller {

	@GetMapping("/")
	public String home() {
		return "Home";
	}

	@GetMapping("/register")
	public String register() {

		return "DriverRegistration";
	}

	@GetMapping("/fareCalculate")
	public String calculateFare() {

		return "FareCalculation";
	}

	@GetMapping("/mainmenu")
	public String toMenu() {
		return "Home";
	}
}
