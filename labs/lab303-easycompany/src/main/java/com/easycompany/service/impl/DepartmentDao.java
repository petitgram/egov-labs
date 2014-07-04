package com.easycompany.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.easycompany.service.Department;
import com.ibatis.sqlmap.client.SqlMapClient;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("departmentDao")
public class DepartmentDao  extends EgovAbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Department> getDepartmentList(Map param)throws DataAccessException{		
		return (List<Department>)getSqlMapClientTemplate().queryForList("Department.getDepartmentList",param);
	}
	
	public Department getDepartmentInfoById(String id)throws DataAccessException{		
		return (Department)getSqlMapClientTemplate().queryForObject("Department.getDepartmentInfoById",id);
	}
	
	public int updateDepartment(Department department)throws DataAccessException{		
		return getSqlMapClientTemplate().update("Department.updateDepartment",department);
	}
	
}
