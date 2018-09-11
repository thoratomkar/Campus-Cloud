package com.kk.core.vo;

import java.util.Date;


public class AttendanceVO {

	private Long id;
	private String rollno;
	private String sub;
	private String w1;
	private String w2;
	private String w3;
	private String w4;
	private String w5;
	private String w6;
	private String w7;
	private String w8;
	private String w9;
	private Integer studentId;
	private Long ayId;
	private Long courseId;
	private Long batchId;
	private Long sectionId;
	private Long subjectId;
	private Long orgId;
	private String studentrollno;
	private Boolean isDeleted = Boolean.FALSE;
	private Date createdAt = new Date();
	private Date updatedAt = new Date();
    private String loggedInUserName;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getRollno() {
		return rollno;
	}
	public void setRollno(String rollno) {
		this.rollno = rollno;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	public String getW1() {
		return w1;
	}
	public void setW1(String w1) {
		this.w1 = w1;
	}
	public String getW2() {
		return w2;
	}
	public void setW2(String w2) {
		this.w2 = w2;
	}
	public String getW3() {
		return w3;
	}
	public void setW3(String w3) {
		this.w3 = w3;
	}
	public String getW4() {
		return w4;
	}
	public void setW4(String w4) {
		this.w4 = w4;
	}
	public String getW5() {
		return w5;
	}
	public void setW5(String w5) {
		this.w5 = w5;
	}
	public String getW6() {
		return w6;
	}
	public void setW6(String w6) {
		this.w6 = w6;
	}
	public String getW7() {
		return w7;
	}
	public void setW7(String w7) {
		this.w7 = w7;
	}
	public String getW8() {
		return w8;
	}
	public void setW8(String w8) {
		this.w8 = w8;
	}
	public String getW9() {
		return w9;
	}
	public void setW9(String w9) {
		this.w9 = w9;
	}
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public Long getAyId() {
		return ayId;
	}
	public void setAyId(Long ayId) {
		this.ayId = ayId;
	}
	public Long getCourseId() {
		return courseId;
	}
	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}
	public Long getBatchId() {
		return batchId;
	}
	public void setBatchId(Long batchId) {
		this.batchId = batchId;
	}
	public Long getSectionId() {
		return sectionId;
	}
	public void setSectionId(Long sectionId) {
		this.sectionId = sectionId;
	}
	public Long getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(Long subjectId) {
		this.subjectId = subjectId;
	}
	public Long getOrgId() {
		return orgId;
	}
	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}
	public String getStudentrollno() {
		return studentrollno;
	}
	public void setStudentrollno(String studentrollno) {
		this.studentrollno = studentrollno;
	}
	public Boolean getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
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
	public String getLoggedInUserName() {
		return loggedInUserName;
	}
	public void setLoggedInUserName(String loggedInUserName) {
		this.loggedInUserName = loggedInUserName;
	}

}
