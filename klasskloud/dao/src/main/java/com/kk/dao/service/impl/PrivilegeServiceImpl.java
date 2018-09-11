package com.kk.dao.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kk.core.vo.PermissionsVO;
import com.kk.dao.factory.PrivilegeDao;
import com.kk.dao.model.Module;
import com.kk.dao.model.Operation;
import com.kk.dao.model.Privilege;
import com.kk.dao.model.Role;
import com.kk.dao.model.RolesPrivileges;
import com.kk.dao.service.ModuleService;
import com.kk.dao.service.OperationService;
import com.kk.dao.service.PrivilegeService;
import com.kk.dao.service.RoleService;
import com.kk.dao.service.RolesPrivilegesService;

@Service
@Transactional(rollbackOn = Exception.class)
public class PrivilegeServiceImpl extends GenericServiceImpl<Privilege, Long> implements PrivilegeService {

	@Autowired
	private PrivilegeDao privilegeDao;

	@Autowired
	private RoleService roleService;

	@Autowired
	private ModuleService moduleService;

	@Autowired
	private OperationService operationService;

	@Autowired
	private RolesPrivilegesService rolesPrivilegesService;

	public Privilege exists(Long moduleId, Long operationId) throws Exception {
		return privilegeDao.exists(moduleId, operationId);
	}

	public Boolean save(PermissionsVO vo) {
		Boolean result = Boolean.FALSE;
		try {
			
			Privilege privilege = exists(vo.getModuleId(), vo.getOperationId());
			if(null != privilege && rolesPrivilegesService.exists(vo.getUserRoleId(), privilege.getId()) && !privilege.getIsDeleted()){
				return result;
			}
			
			if(null == vo.getId() || privilege.getIsDeleted()){
				Module module = moduleService.get(vo.getModuleId());
				Operation operation = operationService.get(vo.getOperationId());
				Role role = roleService.get(vo.getUserRoleId());
				List<Role> roleList = new ArrayList<Role>();
				roleList.add(role);
				if(privilege == null) privilege = new Privilege();
				privilege.setName(operation.getName() + "_" + module.getCode());
				privilege.setRoles(roleList);
				privilege.setOperation(operation);
				privilege.setModule(module);
				if(null == privilege.getId()) privilege.setCreatedAt(new Date());
				privilege.setUpdatedAt(new Date());
				privilege.setRoles(roleList);
				saveOrUpdate(privilege);
				vo.setId(privilege.getId());
				vo.setModuleName(module.getName());
				vo.setOperationName(operation.getName());
				vo.setName(privilege.getName());
				RolesPrivileges rolesPrivileges = new RolesPrivileges(role.getId(), privilege.getId());
				rolesPrivilegesService.saveOrUpdate(rolesPrivileges);
			}else{
				List<RolesPrivileges> list = rolesPrivilegesService.findAllByProperty("privilegeId",String.valueOf(vo.getId()));
				List<Long> roles = new ArrayList<>();
				for (RolesPrivileges rolesPrivileges : list) {
					roles.add(rolesPrivileges.getRoleId());
				}
				List<String> assignedRoles = Arrays.asList(vo.getAssignedRoles());
				for (String r : assignedRoles) {
					if(!roles.contains(Long.valueOf(r))){
						RolesPrivileges rolesPrivileges = new RolesPrivileges(Long.valueOf(r), vo.getId());
						rolesPrivilegesService.saveOrUpdate(rolesPrivileges);
					}
					roles.remove(Long.valueOf(r));
				}
				
				for (RolesPrivileges rolesPrivileges : list) {
					if(roles.contains(rolesPrivileges.getRoleId())){
						rolesPrivilegesService.remove(rolesPrivileges);
					}
				}
				
			}
			result = Boolean.TRUE;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}