package com.kk.core.vo;

import java.util.Date;

public class PermissionsVO {
	
	private Long id;
	private Long userRoleId;
	private Long moduleId;
	private Long operationId;
	private String name;
	private String moduleName;
	private String operationName;
	private Boolean isDeleted = Boolean.FALSE;
	private Date createdAt = new Date();
    private Date updatedAt = new Date();
    private String[] assignedRoles;

	public Long getUserRoleId() {
		return userRoleId;
	}
	public void setUserRoleId(Long userRoleId) {
		this.userRoleId = userRoleId;
	}
	public Long getModuleId() {
		return moduleId;
	}
	public void setModuleId(Long moduleId) {
		this.moduleId = moduleId;
	}
	public Long getOperationId() {
		return operationId;
	}
	public void setOperationId(Long operationId) {
		this.operationId = operationId;
	}
	@Override
	public String toString() {
		return "PermissionsVO [userRoleId=" + userRoleId + ", moduleId=" + moduleId + ", operationId=" + operationId
				+ "]";
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getModuleName() {
		return moduleName;
	}
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
	public String getOperationName() {
		return operationName;
	}
	public void setOperationName(String operationName) {
		this.operationName = operationName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String[] getAssignedRoles() {
		return assignedRoles;
	}
	public void setAssignedRoles(String[] assignedRoles) {
		this.assignedRoles = assignedRoles;
	}

	
}