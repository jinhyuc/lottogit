package org.hyucs.domain;

public class StoreVO {
	private int storeid;
	private String title;
	private String link;
	private String category;
	private String description;
	private String telephone;
	private String address;
	private String roadAddress;
	private int lat;
	private int lon;
	private int wcount1;
	private int wcount2;
	
	public int getStoreid() {
		return storeid;
	}
	public void setStoreid(int storeid) {
		this.storeid = storeid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public int getLat() {
		return lat;
	}
	public void setLat(int lat) {
		this.lat = lat;
	}
	public int getLon() {
		return lon;
	}
	public void setLon(int lon) {
		this.lon = lon;
	}
	public int getWcount1() {
		return wcount1;
	}
	public void setWcount1(int wcount1) {
		this.wcount1 = wcount1;
	}
	public int getWcount2() {
		return wcount2;
	}
	public void setWcount2(int wcount2) {
		this.wcount2 = wcount2;
	}
	
	@Override
	public String toString() {
		return "StoreVO [storeid=" + storeid + ", title=" + title + ", link=" + link + ", category=" + category
				+ ", description=" + description + ", telephone=" + telephone + ", address=" + address
				+ ", roadAddress=" + roadAddress + ", lat=" + lat + ", lon=" + lon + ", wcount1=" + wcount1
				+ ", wcount2=" + wcount2 + "]";
	}
}
