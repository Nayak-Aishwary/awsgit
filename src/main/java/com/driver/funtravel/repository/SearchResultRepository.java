package com.driver.funtravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.driver.funtravel.model.CheapestFareResponse;

public interface SearchResultRepository extends JpaRepository<CheapestFareResponse, Integer> {

}
