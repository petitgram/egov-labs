package egovframework.lab.dataaccess.service;

import java.util.List;

public class DeptIncludesEmpListVO extends DeptVO {

    /** serialVersionUID */
    private static final long serialVersionUID = -6098129034400325088L;

    private List<EmpVO> empVOList;

    public List<EmpVO> getEmpVOList() {
        return empVOList;
    }

    public void setEmpVOList(List<EmpVO> empVOList) {
        this.empVOList = empVOList;
    }

}
