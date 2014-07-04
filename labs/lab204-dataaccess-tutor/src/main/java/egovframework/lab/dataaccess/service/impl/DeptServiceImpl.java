package egovframework.lab.dataaccess.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.lab.dataaccess.service.DeptIncludesEmpListVO;
import egovframework.lab.dataaccess.service.DeptService;
import egovframework.lab.dataaccess.service.DeptVO;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("deptService")
public class DeptServiceImpl extends AbstractServiceImpl implements DeptService {

    @Resource(name = "deptDAO")
    private DeptDAO deptDAO;

    public void insertDept(DeptVO deptVO) throws Exception {
        deptDAO.insertDept(deptVO);
    }

    public void updateDept(DeptVO deptVO) throws Exception {
        deptDAO.updateDept(deptVO);
    }

    public void deleteDept(DeptVO deptVO) throws Exception {
        deptDAO.deleteDept(deptVO);
    }

    public DeptVO selectDept(DeptVO deptVO) throws Exception {

        DeptVO resultVO = deptDAO.selectDept(deptVO);

        if (resultVO == null) {
            throw processException("info.nodata.msg");
        }

        return resultVO;
    }

    public List<DeptVO> selectDeptList(DeptVO searchVO) throws Exception {
        return deptDAO.selectDeptList(searchVO);
    }

    public DeptIncludesEmpListVO selectDeptIncludesEmpList(DeptVO deptVO)
            throws Exception {
        DeptIncludesEmpListVO resultVO = deptDAO.selectDeptIncludesEmpList(deptVO);

        if (resultVO == null) {
            throw processException("info.nodata.msg");
        }

        return resultVO;
    }

}
