package com.srb.hibernate;

public class ProductDetailsHibernate 
{
	private Long pkProductId;
	
	private Long quantityLimit;
	private String productName;
	private String unit;
	private String Description;
	
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public Long getPkProductId() {
		return pkProductId;
	}
	public void setPkProductId(Long pkProductId) {
		this.pkProductId = pkProductId;
	}
	public Long getQuantityLimit() {
		return quantityLimit;
	}
	public void setQuantityLimit(Long quantityLimit) {
		this.quantityLimit = quantityLimit;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	

	
	
}
