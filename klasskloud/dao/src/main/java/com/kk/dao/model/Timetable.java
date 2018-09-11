package com.kk.dao.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "timetable")
public class Timetable {
	private Long id;
	private Long classid;
	private String day;
	private Date createdAt;
	private Date updatedAt;
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
	private Organization organization;

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name = "classid")
	public Long getClassid() {
		return classid;
	}
	public void setClassid(Long classid) {
		this.classid = classid;
	}
	
	@Column(name = "day")
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

	@Column(name = "slot1")
	public String getSlot1() {
		return slot1;
	}
	public void setSlot1(String slot1) {
		this.slot1 = slot1;
	}
	
	@Column(name = "slot2")
	public String getSlot2() {
		return slot2;
	}
	public void setSlot2(String slot2) {
		this.slot2 = slot2;
	}
	
	@Column(name = "slot3")
	public String getSlot3() {
		return slot3;
	}
	public void setSlot3(String slot3) {
		this.slot3 = slot3;
	}
	
	@Column(name = "slot4")
	public String getSlot4() {
		return slot4;
	}
	public void setSlot4(String slot4) {
		this.slot4 = slot4;
	}
	
	@Column(name = "slot5")
	public String getSlot5() {
		return slot5;
	}
	public void setSlot5(String slot5) {
		this.slot5 = slot5;
	}
	
	@Column(name = "slot6")
	public String getSlot6() {
		return slot6;
	}
	public void setSlot6(String slot6) {
		this.slot6 = slot6;
	}
	
	@Column(name = "slot7")
	public String getSlot7() {
		return slot7;
	}
	public void setSlot7(String slot7) {
		this.slot7 = slot7;
	}
	
	@Column(name = "slot8")
	public String getSlot8() {
		return slot8;
	}
	public void setSlot8(String slot8) {
		this.slot8 = slot8;
	}
	
	@Column(name = "slot9")
	public String getSlot9() {
		return slot9;
	}
	public void setSlot9(String slot9) {
		this.slot9 = slot9;
	}
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "org_id", referencedColumnName = "id")
	public Organization getOrganization() {
		return organization;
	}
	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

}
