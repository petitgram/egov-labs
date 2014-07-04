package com.easycompany.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.easycompany.service.Employee;
import com.ibatis.sqlmap.client.SqlMapClient;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("employeeDao")
public class EmployeeDao extends EgovAbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Employee> getAllEmployees(Map param) throws DataAccessException {
		return list("Employee.getAllEmployees", param);
	}

	public Employee getEmployeeInfoById(String id) throws DataAccessException {
		return (Employee)selectByPk("Employee.getEmployeeInfoById", id);
	}

	public void deleteEmployee(String id) {
		deleteEmployee(id);
	}

	public int insertEmployee(Employee emp) {

	    int result = -1;
	    
        try {
            // TODO [Step 4-5-02] insertEmployee 메소드는 EgovAbstractDAO에서 제공되는  insert()를 이용하여
            // Employee.insertEmployee ID 를 가진 sql문을 실행한다.

        } catch (Exception e) {
            logger.debug("EmployeeManageDaoImpl DAO Exception:"+e);
            e.printStackTrace();
        }

		return result;
	}

	public int updateEmployee(Employee emp) {
		return update("Employee.updateEmployee", emp);
	}

	@SuppressWarnings("unchecked")
	public List<String> getNameListForSuggest(String namePrefix) {
		return list("Employee.getNameListForSuggest", namePrefix);
	}

	public int getEmployeeCount(Map param) {
		return (Integer)getSqlMapClientTemplate().queryForObject("Employee.getEmployeeCount", param);
	}

}
