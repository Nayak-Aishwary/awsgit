package com.driver.funtravel.controller;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.driver.funtravel.model.DriverDetails;
import com.driver.funtravel.repository.DriverRepository;

@Controller
public class DriverController {

	@Autowired
	DriverRepository driverRepo;

	@GetMapping("/driverdetails")
	public ModelAndView driverDetails(Pageable pageable) {

		ModelAndView mv = new ModelAndView("DriverDetails");
		Page<DriverDetails> pages = driverRepo.findAll(pageable);
		addPageObjects(mv, pages);
		return mv;
	}

	@GetMapping("/findDriver")
	public ModelAndView findDriverByName(@RequestParam("driverName") String driverName, Pageable pageable) {

		Page<DriverDetails> pages;
		ModelAndView mv = new ModelAndView("DriverDetails");

		if (driverName.isEmpty()) {
			pages = driverRepo.findAll(pageable);
		} else {
			pages = driverRepo.findDriversByName(driverName, pageable);
		}
		addPageObjects(mv, pages);
		return mv;
	}

	@PostMapping("/addDriver")
	public ModelAndView addDriver(@Valid @ModelAttribute("driver") DriverDetails driver, BindingResult result) {
		ModelAndView mv = new ModelAndView();
		if (result.hasErrors()) {
			mv.setViewName("DriverRegistration");
			return mv;
		} else {
			mv.setViewName("RegisterSuccess");
			driverRepo.save(driver);
			mv.addObject("driver", driver);
			return mv;
		}
	}

	@PostMapping("updateDriver/updateDriverDetails")
	public ModelAndView addUpdatedDriver(@Valid @ModelAttribute("driver") DriverDetails driver, BindingResult result) {
		ModelAndView mv = new ModelAndView();
		if (result.hasErrors()) {
			mv.setViewName("UpdateDriver");
			return mv;
		} else {
			mv.setViewName("RegisterSuccess");
			driverRepo.save(driver);
			mv.addObject("driverUpdated", "Driver Profile Updated!");
			return mv;
		}
	}

	@GetMapping("/updateDriver/{driverId}")
	public ModelAndView updateDriver(@PathVariable int driverId) {
		ModelAndView mv = new ModelAndView();
		Optional<DriverDetails> driverdetails = driverRepo.findById(driverId);
		if (driverdetails.isPresent()) {
			DriverDetails driver = driverdetails.get();
			driverRepo.save(driver);
			mv.addObject("driver", driver);
			mv.setViewName("UpdateDriver");
			return mv;
		} else {
			mv.setViewName("DriverDetails");
		}
		return mv;
	}

	@GetMapping("/deleteDriver/{driverId}")
	public ModelAndView deleteDriver(@PathVariable int driverId) {
		Optional<DriverDetails> driverdetails = driverRepo.findById(driverId);
		ModelAndView mv = new ModelAndView();
		if (driverdetails.isPresent()) {
			DriverDetails driver = driverdetails.get();
			mv.addObject("driver", driver);
			mv.setViewName("RegisterSuccess");
			driverRepo.deleteById(driverId);
			mv.addObject("deleteMessage", "Driver profile Deleted");
			return mv;
		}
		mv.setViewName("DriverDetails");
		return mv;
	}

	@GetMapping(value = "/viewdriver")
	public ModelAndView paginate(@RequestParam("page") int page, @RequestParam("size") int size) {
		ModelAndView model = new ModelAndView("DriverDetails");
		Pageable pageable = PageRequest.of(page, size);
		Page<DriverDetails> pages = driverRepo.findAll(pageable);
		addPageObjects(model, pages);

		return model;
	}

	private void addPageObjects(ModelAndView model, Page<DriverDetails> pages) {
		model.addObject("number", pages.getNumber());
		model.addObject("totalPages", pages.getTotalPages());
		model.addObject("totalElements", pages.getTotalElements());
		model.addObject("size", pages.getSize());
		model.addObject("driverDetails", pages.getContent());
	}
}
