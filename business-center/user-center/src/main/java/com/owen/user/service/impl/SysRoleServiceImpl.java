package com.owen.user.service.impl;

import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import com.owen.user.dao.SysRolePermissionDao;
import com.owen.user.dao.SysUserRoleDao;
import org.apache.commons.collections4.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Sets;
import com.owen.common.exception.service.ServiceException;
import com.owen.common.model.SysPermission;
import com.owen.common.model.SysRole;
import com.owen.common.web.PageResult;
import com.owen.common.web.Result;
import com.owen.user.dao.SysRoleDao;
import com.owen.user.dao.SysRoleMenuDao;
import com.owen.user.service.SysRoleService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SysRoleServiceImpl implements SysRoleService {

	@Autowired
	private SysRoleDao sysRoleDao;
	@Autowired
	private SysUserRoleDao userRoleDao;
	@Autowired
	private SysRolePermissionDao rolePermissionDao;
	
	@Autowired
	private SysRoleMenuDao roleMenuDao;
	 

	@Transactional
	@Override
	public void save(SysRole sysRole)  throws ServiceException {
		try {
			SysRole role = sysRoleDao.findByCode(sysRole.getCode());
			if (role != null) {
				throw new IllegalArgumentException("角色code已存在");
			}

			sysRole.setCreateTime(new Date());
			sysRole.setUpdateTime(sysRole.getCreateTime());

			sysRoleDao.save(sysRole);
			log.info("保存角色：{}", sysRole);
		} catch (Exception e) {
			throw new ServiceException(e);
		}
	}

	@Transactional
	@Override
	public void update(SysRole sysRole) throws ServiceException {
		try {
			sysRole.setUpdateTime(new Date());

			sysRoleDao.updateByOps(sysRole);
			log.info("修改角色：{}", sysRole);
		} catch (Exception e) {
			throw new ServiceException(e);
		}
	}

	@Transactional
	@Override
	public void deleteRole(Long id)  throws ServiceException {
		try {
			SysRole sysRole = sysRoleDao.findById(id);

			sysRoleDao.delete(id);
			rolePermissionDao.deleteRolePermission(id, null);
			roleMenuDao.delete(id, null) ;
			userRoleDao.deleteUserRole(null, id);
			
			

			log.info("删除角色：{}", sysRole);
		} catch (Exception e) {
			throw new ServiceException(e);
		}

	}

	@Transactional
	@Override
	public void setPermissionToRole(Long roleId, Set<Long> permissionIds)  throws ServiceException {
		try {
			SysRole sysRole = sysRoleDao.findById(roleId);
			if (sysRole == null) {
				throw new IllegalArgumentException("角色不存在");
			}

			// 查出角色对应的old权限
			Set<Long> oldPermissionIds = rolePermissionDao.findPermissionsByRoleIds(Sets.newHashSet(roleId)).stream()
					.map(p -> p.getId()).collect(Collectors.toSet());

			// 需要添加的权限
			Collection<Long> addPermissionIds = org.apache.commons.collections4.CollectionUtils.subtract(permissionIds,
					oldPermissionIds);
			if (!CollectionUtils.isEmpty(addPermissionIds)) {
				addPermissionIds.forEach(permissionId -> {
					rolePermissionDao.saveRolePermission(roleId, permissionId);
				});
			}
			// 需要移除的权限
			Collection<Long> deletePermissionIds = org.apache.commons.collections4.CollectionUtils
					.subtract(oldPermissionIds, permissionIds);
			if (!CollectionUtils.isEmpty(deletePermissionIds)) {
				deletePermissionIds.forEach(permissionId -> {
					rolePermissionDao.deleteRolePermission(roleId, permissionId);
				});
			}
		} catch (Exception e) {
			throw new ServiceException(e);
		}

	}

	@Override
	public SysRole findById(Long id)  throws ServiceException{
		try {
			return sysRoleDao.findById(id);
		} catch (Exception e) {
			throw new ServiceException(e);
		}
	}

	@Override
	public PageResult<SysRole> findRoles(Map<String, Object> params)  throws ServiceException {
		try {
			//设置分页信息，分别是当前页数和每页显示的总记录数【记住：必须在mapper接口中的方法执行之前设置该分页信息】
			if (MapUtils.getInteger(params, "page")!=null && MapUtils.getInteger(params, "limit")!=null)
				PageHelper.startPage(MapUtils.getInteger(params, "page"),MapUtils.getInteger(params, "limit"),true);
			List<SysRole> list =  sysRoleDao.findList(params);
			PageInfo<SysRole> pageInfo = new PageInfo(list);

			return PageResult.<SysRole>builder().data(pageInfo.getList()).code(0).count(pageInfo.getTotal()).build()  ;
		} catch (Exception e) {
			throw new ServiceException(e);
		}
	}

	@Override
	public Set<SysPermission> findPermissionsByRoleId(Long roleId)  throws ServiceException {
		try {
			return rolePermissionDao.findPermissionsByRoleIds(Sets.newHashSet(roleId));
		} catch (Exception e) {
			throw new ServiceException(e);
		}
	}

	@Override
	public Result saveOrUpdate(SysRole sysRole)  throws ServiceException {
		try {
			int i = 0;
			if (sysRole.getId()==null){
				SysRole role = sysRoleDao.findByCode(sysRole.getCode());
				if (role != null) {
					return Result.failed("角色code已存在");
				}
				sysRole.setCreateTime(new Date());
				sysRole.setUpdateTime(sysRole.getCreateTime());
				i = sysRoleDao.save(sysRole);
			}else {
				sysRole.setUpdateTime(new Date());
				i = sysRoleDao.updateByOps(sysRole);
			}
			return i>0?Result.succeed("操作成功"):Result.failed("操作失败");
		} catch (Exception e) {
			throw new ServiceException(e);
		}
	}


}
