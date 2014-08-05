package com.bx.bean;

import java.util.Date;

public class BxItem {
	private String fixItem;
	private String fixId;
	private String itemDesc;
	private String buildingNum;
	private String roomNum;
	private String itemCate;
	private String itemDetail;
	private Date epecFixDate;
	
	
	public Date getEpecFixDate() {
		return epecFixDate;
	}
	public void setEpecFixDate(Date epecFixDate) {
		this.epecFixDate = epecFixDate;
	}
	public String getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(String roomNum) {
		this.roomNum = roomNum;
	}
	public String getItemCate() {
		return itemCate;
	}
	public void setItemCate(String itemCate) {
		this.itemCate = itemCate;
	}
	
	public String getItemDetail() {
		return itemDetail;
	}
	public void setItemDetail(String itemDetail) {
		this.itemDetail = itemDetail;
	}
	public String getFixItem() {
		return fixItem;
	}
	public void setFixItem(String fixItem) {
		this.fixItem = fixItem;
	}
	public String getFixId() {
		return fixId;
	}
	public void setFixId(String fixId) {
		this.fixId = fixId;
	}
	public String getItemDesc() {
		return itemDesc;
	}
	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}
	public String getBuildingNum() {
		return buildingNum;
	}
	public void setBuildingNum(String buildingNum) {
		this.buildingNum = buildingNum;
	}
	
	
}
