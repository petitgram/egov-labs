package com.easycompany.cmm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.easycompany.cmm.vo.Account;
import com.ibatis.sqlmap.client.SqlMapClient;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("loginDao")
public class LoginDao  extends EgovAbstractDAO {
	
	public Account authenticate(String id, String password) throws DataAccessException{
		Account account = new Account();
		account.setEmployeeid(id);
		account.setPassword(password);
		return (Account)selectByPk("Employee.authenticate", account);
	}
}