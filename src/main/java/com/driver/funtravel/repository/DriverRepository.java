package com.driver.funtravel.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.driver.funtravel.model.DriverDetails;

public interface DriverRepository extends JpaRepository<DriverDetails, Integer> {

	@Query(value = "SELECT d FROM DriverDetails d WHERE d.dVehicleType = ?1")
	List<DriverDetails> findAllDrivers(String vehicle);
	
	@Query(value = "SELECT d FROM DriverDetails d WHERE d.dName like %:keyword%")
	Page<DriverDetails> findDriversByName(@Param("keyword")String dName, Pageable pageable);

}
