package com.driver.funtravel.controller;

import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.driver.funtravel.model.CheapestFareResponse;
import com.driver.funtravel.model.DriverDetails;
import com.driver.funtravel.model.FileInfoDetail;
import com.driver.funtravel.repository.DriverRepository;
import com.driver.funtravel.repository.SearchResultRepository;

@Controller
public class FareCalculatorController {

	@Autowired
	DriverRepository driverRepo;

	@Autowired
	SearchResultRepository searchResultRepo;

	Pattern pattern = Pattern.compile("-?\\d+(\\.\\d+)?");

	@PostMapping(path = "/uploadCsv", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
	public ModelAndView uploadCsv(@RequestParam("file") MultipartFile file, Pageable pageable) {
		double maximum = Double.MAX_VALUE;
		ModelAndView model = new ModelAndView("FareCalculation");

		try {
			// Checking if file is Empty
			if (!file.isEmpty()) {
				// Fetching the content of the CSV uploaded
				String content = new String(file.getBytes());
				String mimeType = file.getContentType();
				// Checking if the CSV extension file
				if (!mimeType.equalsIgnoreCase("text/csv")) {
					model.addObject("errorMsg", "Please upload CSV file format");
					return model;
				}
				String[] str = content.split(",");
				// Checking if the CSV contains all numeric values
				for (int i = 0; i < str.length; i++) {
					if (!isNumeric(str[i])) {
						model.addObject("errorMsg", "Please upload valid format CSV file with all Integer values");
						return model;
					}
				}
				// Checking if csv contains only three inputs
				if (str.length > 3) {
					model.addObject("errorMsg", "Please upload valid CSV file with three Integer values");
					return model;
				}

				FileInfoDetail fileInfo = new FileInfoDetail();
				fileInfo.setTotalDistance(Integer.parseInt(str[0]));
				fileInfo.setDistTravelUnit(Integer.parseInt(str[1]));
				fileInfo.setCostPerDistTraveled(Integer.parseInt(str[2]));

				// As currently Company supports only Taxi Vehicle Type
				// Later can scale it to Bus, Train, etc. depending on the input from end user
				List<DriverDetails> drivers = driverRepo.findAllDrivers("Taxi");
				if (!drivers.isEmpty()) {
					// Calculating the cheapest fare from all the taxi drivers
					for (DriverDetails driver : drivers) {
						double i = calculateFare(driver, fileInfo);
						if (i < maximum) {
							maximum = i;
						}
					}
					model.addObject("cheapestFare", maximum);
					CheapestFareResponse cfResponse = new CheapestFareResponse(maximum, fileInfo.getTotalDistance(),
							fileInfo.getDistTravelUnit(), fileInfo.getCostPerDistTraveled());

					// Saving the calculations
					searchResultRepo.save(cfResponse);
				} else {
					model.addObject("errorMsg", "No driver profiles found! Please Register");
				}

			} else {
				model.addObject("errorMsg", "Please upload valid format CSV file with Integer values");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// Display the previous calculations
		displayHistoryList(model, pageable);
		return model;
	}

	@GetMapping(value = "/viewHistory")
	public ModelAndView paginate(@RequestParam("page") int page, @RequestParam("size") int size) {
		ModelAndView model = new ModelAndView("FareCalculation");
		Pageable pageable = PageRequest.of(page, size);
		// Getting and displaying current page details
		displayHistoryList(model, pageable);

		return model;
	}

	private void displayHistoryList(ModelAndView model, Pageable pageable) {
		Page<CheapestFareResponse> pages = searchResultRepo.findAll(pageable);
		model.addObject("number", pages.getNumber());
		model.addObject("totalPages", pages.getTotalPages());
		model.addObject("totalElements", pages.getTotalElements());
		model.addObject("size", pages.getSize());
		model.addObject("searchHistory", pages.getContent());
	}

	// Method to check whether the input is Numeric
	public boolean isNumeric(String strNum) {
		if (strNum == null) {
			return false;
		}
		return pattern.matcher(strNum).matches();
	}

	// Calculating the fare for the driver profile
	private double calculateFare(DriverDetails driver, FileInfoDetail fileInfo) {

		if (driver.getBfDistance() >= fileInfo.getTotalDistance()) {
			return driver.getBaseFarePrice();
		} else {
			double diffDistance = fileInfo.getTotalDistance() - driver.getBfDistance();

			return driver.getBaseFarePrice()
					+ ((diffDistance * fileInfo.getCostPerDistTraveled()) / fileInfo.getDistTravelUnit());
		}
	}
}
