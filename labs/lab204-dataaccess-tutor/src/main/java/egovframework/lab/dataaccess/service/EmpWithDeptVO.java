package egovframework.lab.dataaccess.service;

import java.math.BigDecimal;

public class EmpWithDeptVO extends EmpVO {

    /** serialVersionUID */
    private static final long serialVersionUID = 2916598732662272200L;

    private BigDecimal deptNo;

    private String deptName;

    private String loc;

    public BigDecimal getDeptNo() {
        return deptNo;
    }

    public void setDeptNo(BigDecimal deptNo) {
        this.deptNo = deptNo;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getLoc() {
        return loc;
    }

    public void setLoc(String loc) {
        this.loc = loc;
    }

}
