package egovframework.lab.dataaccess.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.lab.dataaccess.service.DeptIncludesEmpListVO;
import egovframework.lab.dataaccess.service.DeptVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("deptDAO")
public class DeptDAO extends EgovAbstractDAO {
 
    public void insertDept(DeptVO vo) {
        insert("insertDept", vo);
    }
 
    public int updateDept(DeptVO vo) {
        return update("updateDept", vo);
    }
 
    public int deleteDept(DeptVO vo) {
        return delete("deleteDept", vo);
    }
 
    public DeptVO selectDept(DeptVO vo) {
        return (DeptVO)selectByPk("selectDept", vo);
    }
 
    @SuppressWarnings("unchecked")
    public List<DeptVO> selectDeptList(DeptVO searchVO) {
        return list("selectDeptList", searchVO);
    }

    public DeptIncludesEmpListVO selectDeptIncludesEmpList(DeptVO vo) {
        return (DeptIncludesEmpListVO)selectByPk("selectDeptIncludesEmpList", vo);
    }
}
