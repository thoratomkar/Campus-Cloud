package com.kk.core.vo;

import java.util.Date;

public class TimetableVO {
	private Long id;
	private Long classid;
	private String day;
	private Date createdAt = new Date();
	private Date updatedAt = new Date();
	private Boolean isDeleted = Boolean.FALSE;
	private String slot1;
	private String slot2;
	private String slot3;
	private String slot4;
	private String slot5;
	private String slot6;
	private String slot7;
	private String slot8;
	private String slot9;
    private String loggedInUserName;	
    private Long orgId;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getClassid() {
		return classid;
	}
	public void setClassid(Long classid) {
		this.classid = classid;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public Boolean getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}
	public String getSlot1() {
		return slot1;
	}
	public void setSlot1(String slot1) {
		this.slot1 = slot1;
	}
	public String getSlot2() {
		return slot2;
	}
	public void setSlot2(String slot2) {
		this.slot2 = slot2;
	}
	public String getSlot3() {
		return slot3;
	}
	public void setSlot3(String slot3) {
		this.slot3 = slot3;
	}
	public String getSlot4() {
		return slot4;
	}
	public void setSlot4(String slot4) {
		this.slot4 = slot4;
	}
	public String getSlot5() {
		return slot5;
	}
	public void setSlot5(String slot5) {
		this.slot5 = slot5;
	}
	public String getSlot6() {
		return slot6;
	}
	public void setSlot6(String slot6) {
		this.slot6 = slot6;
	}
	public String getSlot7() {
		return slot7;
	}
	public void setSlot7(String slot7) {
		this.slot7 = slot7;
	}
	public String getSlot8() {
		return slot8;
	}
	public void setSlot8(String slot8) {
		this.slot8 = slot8;
	}
	public String getSlot9() {
		return slot9;
	}
	public void setSlot9(String slot9) {
		this.slot9 = slot9;
	}
	public String getLoggedInUserName() {
		return loggedInUserName;
	}
	public void setLoggedInUserName(String loggedInUserName) {
		this.loggedInUserName = loggedInUserName;
	}
	public Long getOrgId() {
		return orgId;
	}
	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}

}
