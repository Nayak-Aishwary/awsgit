package com.driver.funtravel.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class DriverDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int driverId;

	@NotBlank(message = "Name is mandatory")
	private String dName;

	@NotBlank(message = "Surname is mandatory")
	private String dSurname;

	@Email
	@NotBlank(message = "Enter valid format Email address")
	private String dEmail;

	@NotBlank(message = "Vehicle type is mandatory")

	private String dVehicleType;

	private double baseFarePrice;

	private double bfDistance;

	@CreationTimestamp
	private Date createdTime;
	
	@UpdateTimestamp
	private Date updatedTime;

	public int getDriverId() {
		return driverId;
	}

	public void setDriverId(int driverId) {
		this.driverId = driverId;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public String getdSurname() {
		return dSurname;
	}

	public void setdSurname(String dSurname) {
		this.dSurname = dSurname;
	}

	public String getdEmail() {
		return dEmail;
	}

	public void setdEmail(String dEmail) {
		this.dEmail = dEmail;
	}

	public String getdVehicleType() {
		return dVehicleType;
	}

	public void setdVehicleType(String dVehicleType) {
		this.dVehicleType = dVehicleType;
	}

	public double getBaseFarePrice() {
		return baseFarePrice;
	}

	public void setBaseFarePrice(double baseFarePrice) {
		this.baseFarePrice = baseFarePrice;
	}

	public double getBfDistance() {
		return bfDistance;
	}

	public void setBfDistance(double bfDistance) {
		this.bfDistance = bfDistance;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public Date getUpdatedTime() {
		return updatedTime;
	}

	public void setUpdatedTime(Date updatedTime) {
		this.updatedTime = updatedTime;
	}

	@Override
	public String toString() {
		return "Driver [driverId=" + driverId + ", dName=" + dName + ", dSurname=" + dSurname + ", dEmail=" + dEmail
				+ ", dVehicleType=" + dVehicleType + ", baseFarePrice=" + baseFarePrice + ", bfDistance=" + bfDistance
				+ "]";
	}
}
