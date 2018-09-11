package com.kk.dao.model;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
 
@Entity
@Table(name = "roles_privileges")
public class RolesPrivileges {
	
	private Long id;
	private Long roleId;
	private Long privilegeId;

	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public RolesPrivileges(){
		
	}
	
	public RolesPrivileges(Long roleId, Long privilegeId) {
		super();
		this.roleId = roleId;
		this.privilegeId = privilegeId;
	}

	@Column(name = "role_id",  nullable = false)
	public Long getRoleId() {
		return roleId;
	}
	
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	
	@Column(name = "privilege_id",  nullable = false)
	public Long getPrivilegeId() {
		return privilegeId;
	}
	public void setPrivilegeId(Long privilegeId) {
		this.privilegeId = privilegeId;
	}
	
	
}