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
@Table(name="attendance")
public class Attendance {
	private Long id;
	private String rollno;
	private String sub;
	private Student student;
	private AcadYear acadYear;
	private Course course;
	private Batch batch;
	private Section section;
	private Subject subject;
	private Organization organization;
	private String w1;
	private String w2;
	private String w3;
	private String w4;
	private String w5;
	private String w6;
	private String w7;
	private String w8;
	private String w9;
	private Boolean isDeleted = Boolean.FALSE;
	private Date createdAt;
	private Date updatedAt;

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "rollno")
	public String getRollno() {
		return rollno;
	}
	public void setRollno(String rollno) {
		this.rollno = rollno;
	}
	
	@Column(name = "sub")
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "student_id", referencedColumnName = "id")
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "ay_id", referencedColumnName = "id")
	public AcadYear getAcadYear() {
		return acadYear;
	}
	public void setAcadYear(AcadYear acadYear) {
		this.acadYear = acadYear;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "course_id", referencedColumnName = "id")
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "batch_id", referencedColumnName = "id")
	public Batch getBatch() {
		return batch;
	}
	public void setBatch(Batch batch) {
		this.batch = batch;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "section_id", referencedColumnName = "id")
	public Section getSection() {
		return section;
	}
	public void setSection(Section section) {
		this.section = section;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "subject_id", referencedColumnName = "id")
	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "org_id", referencedColumnName = "id")
	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	@Column(name = "w1")
	public String getW1() {
		return w1;
	}
	public void setW1(String w1) {
		this.w1 = w1;
	}
	
	@Column(name = "w2")
	public String getW2() {
		return w2;
	}
	public void setW2(String w2) {
		this.w2 = w2;
	}
	
	@Column(name = "w3")
	public String getW3() {
		return w3;
	}
	public void setW3(String w3) {
		this.w3 = w3;
	}
	@Column(name = "w4")
	public String getW4() {
		return w4;
	}
	public void setW4(String w4) {
		this.w4 = w4;
	}

	@Column(name = "w5")
	public String getW5() {
		return w5;
	}
	public void setW5(String w5) {
		this.w5 = w5;
	}

	@Column(name = "w6")
	public String getW6() {
		return w6;
	}
	public void setW6(String w6) {
		this.w6 = w6;
	}

	@Column(name = "w7")
	public String getW7() {
		return w7;
	}
	public void setW7(String w7) {
		this.w7 = w7;
	}
	
	@Column(name = "w8")
	public String getW8() {
		return w8;
	}
	public void setW8(String w8) {
		this.w8 = w8;
	}
	
	@Column(name = "w9")
	public String getW9() {
		return w9;
	}
	public void setW9(String w9) {
		this.w9 = w9;
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

}
