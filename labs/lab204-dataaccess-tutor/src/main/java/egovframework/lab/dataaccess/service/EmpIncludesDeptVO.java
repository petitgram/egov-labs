package egovframework.lab.dataaccess.service;

public class EmpIncludesDeptVO extends EmpVO {

    /** serialVersionUID */
    private static final long serialVersionUID = 2178085836444199596L;
    
    private DeptVO deptVO;

    public DeptVO getDeptVO() {
        return deptVO;
    }

    public void setDeptVO(DeptVO deptVO) {
        this.deptVO = deptVO;
    }

}
