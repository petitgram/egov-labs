package egovframework.lab.dataaccess.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.lab.dataaccess.service.EmpIncludesDeptVO;
import egovframework.lab.dataaccess.service.EmpVO;
import egovframework.lab.dataaccess.service.EmpWithDeptVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("empDAO")
public class EmpDAO extends EgovAbstractDAO {
	
	// TODO [Step 2-4] EmpDAO 작성

    public void insertEmp(EmpVO vo) {
        insert("insertEmp", vo);
    }

    public int updateEmp(EmpVO vo) {
        return update("updateEmp", vo);
    }

    public int deleteEmp(EmpVO vo) {
        return delete("deleteEmp", vo);
    }

    public EmpVO selectEmp(EmpVO vo) {
        return (EmpVO) selectByPk("selectEmp", vo);
        //return (EmpVO) selectByPk("selectEmpUsingCacheModelLRU", vo);
    }

    @SuppressWarnings("unchecked")
    public List<EmpVO> selectEmpList(EmpVO searchVO) {
        return list("selectEmpList", searchVO);
    }

    public EmpWithDeptVO selectEmpWithDept(EmpVO vo) {
        return (EmpWithDeptVO) selectByPk("selectEmpWithDept", vo);
    }

    public EmpIncludesDeptVO selectEmpIncludesDept(EmpVO vo) {
        return (EmpIncludesDeptVO) selectByPk("selectEmpIncludesDept", vo);
    }

}
