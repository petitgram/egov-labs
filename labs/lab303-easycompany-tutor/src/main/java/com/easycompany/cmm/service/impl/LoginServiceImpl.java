package com.easycompany.cmm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easycompany.cmm.service.LoginService;
import com.easycompany.cmm.vo.Account;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("loginService")
public class LoginServiceImpl extends AbstractServiceImpl implements LoginService {

    @Autowired
    private LoginDao loginDao;

    public Account authenticate(String id, String password) {
        // TODO [Step 4-1-02] 구현되어져 있는 LoginDao의 authenticate 메소드를 이용하여 검증하여 
        // 결과(Account)객체를 리턴한다.
//    	return null;
    	return loginDao.authenticate(id, password);

    }

}
 