package com.driver.funtravel.model;

public class FileInfoDetail {

	private int totalDistance;

	private int distTravelUnit;

	private int costPerDistTraveled;

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

	@Override
	public String toString() {
		return "FileInfoDetail [totalDistance=" + totalDistance + ", distTravelUnit=" + distTravelUnit
				+ ", costPerDistTraveled=" + costPerDistTraveled + "]";
	}
}
