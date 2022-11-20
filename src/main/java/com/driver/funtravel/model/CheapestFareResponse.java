package com.driver.funtravel.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class CheapestFareResponse {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int searchId;

	double cheapestFare;

	private int totalDistance;

	@CreationTimestamp
	private Date createdTime;
	
	@UpdateTimestamp
	private Date updatedTime;
	
	public int getSearchId() {
		return searchId;
	}

	public void setSearchId(int searchId) {
		this.searchId = searchId;
	}

	private int distTravelUnit;

	private int costPerDistTraveled;

	public CheapestFareResponse() {
		super();
	}

	public CheapestFareResponse(double cheapestFare, int totalDistance, int distTravelUnit, int costPerDistTraveled) {
		super();
		this.cheapestFare = cheapestFare;
		this.totalDistance = totalDistance;
		this.distTravelUnit = distTravelUnit;
		this.costPerDistTraveled = costPerDistTraveled;
	}

	public int getTotalDistance() {
		return totalDistance;
	}

	public void setTotalDistance(int totalDistance) {
		this.totalDistance = totalDistance;
	}

	public int getDistTravelUnit() {
		return distTravelUnit;
	}

	public void setDistTravelUnit(int distTravelUnit) {
		this.distTravelUnit = distTravelUnit;
	}

	public int getCostPerDistTraveled() {
		return costPerDistTraveled;
	}

	public void setCostPerDistTraveled(int costPerDistTraveled) {
		this.costPerDistTraveled = costPerDistTraveled;
	}

	public double getCheapestFare() {
		return cheapestFare;
	}

	public void setCheapestFare(double cheapestFare) {
		this.cheapestFare = cheapestFare;
	}

	@Override
	public String toString() {
		return "CheapestFareResponse [cheapestFare=" + cheapestFare + ", totalDistance=" + totalDistance
				+ ", distTravelUnit=" + distTravelUnit + ", costPerDistTraveled=" + costPerDistTraveled + "]";
	}

}
