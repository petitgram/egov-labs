package egovframework.lab.dataaccess.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.test.jdbc.SimpleJdbcTestUtils;
import org.springframework.transaction.annotation.Transactional;

import egovframework.rte.fdl.cmmn.exception.EgovBizException;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:META-INF/spring/context-*" })
@TransactionConfiguration(transactionManager = "txManager", defaultRollback = false)
@Transactional
public class DeptServiceTest {

    @Resource(name = "dataSource")
    DataSource dataSource;

    @Resource(name = "deptService")
    DeptService deptService;

    @Before
    public void onSetUp() throws Exception {
        // 테스트 편의상 매 테스트메서드 수행전 외부의 sql file 로부터 DB 초기화
        // (기존 테이블 삭제/생성)
        SimpleJdbcTestUtils.executeSqlScript(
            new SimpleJdbcTemplate(dataSource), new ClassPathResource(
                "META-INF/testdata/sample_schema_hsql.sql"), true);
    }

    public DeptVO makeVO() {
        return makeVO(90);
    }

    public DeptVO makeVO(int deptNo) {
        DeptVO vo = new DeptVO();
        vo.setDeptNo(new BigDecimal(deptNo));
        vo.setDeptName("test 부서");
        vo.setLoc("test 위치");
        return vo;
    }

    public void checkResult(DeptVO vo, DeptVO resultVO) {
        assertNotNull(resultVO);
        assertEquals(vo.getDeptNo(), resultVO.getDeptNo());
        assertEquals(vo.getDeptName(), resultVO.getDeptName());
        assertEquals(vo.getLoc(), resultVO.getLoc());
    }

    @Test
    public void testInsertDept() throws Exception {
        DeptVO vo = makeVO();

        // insert
        deptService.insertDept(vo);

        // select
        DeptVO resultVO = deptService.selectDept(vo);

        // check
        checkResult(vo, resultVO);
    }

    @Test
    public void testUpdateDept() throws Exception {
        DeptVO vo = makeVO();

        // insert
        deptService.insertDept(vo);

        // data change
        vo.setDeptName("upd Dept");
        vo.setLoc("upd loc");

        // update
        deptService.updateDept(vo);

        // select
        DeptVO resultVO = deptService.selectDept(vo);

        // check
        checkResult(vo, resultVO);
    }

    @Test
    public void testDeleteDept() throws Exception {
        DeptVO vo = makeVO();

        // insert
        deptService.insertDept(vo);

        // delete
        deptService.deleteDept(vo);

        // select
        try {
            @SuppressWarnings("unused")
            DeptVO resultVO = deptService.selectDept(vo);
            fail("EgovBizException 이 발생해야 합니다.");
        } catch (Exception e) {
            assertNotNull(e);
            // 여기서는 비지니스 단에서 명시적으로 exception 처리 하였음.
            // AbstractServiceImpl 을 extends 하고
            // processException("info.nodata.msg"); 과
            // 같이 메서드 콜 형태로 처리
            assertTrue(e instanceof EgovBizException);
            assertEquals("info.nodata.msg", ((EgovBizException) e)
                .getMessageKey());
            assertEquals("해당 데이터가 없습니다.", e.getMessage());
        }
    }

    @Test
    public void testSelectDeptList() throws Exception {
        DeptVO vo = makeVO();

        // insert
        deptService.insertDept(vo);

        // 검색조건으로 key 설정
        DeptVO searchVO = new DeptVO();
        searchVO.setDeptNo(vo.getDeptNo());

        // selectList
        List<DeptVO> resultList = deptService.selectDeptList(searchVO);

        // key 조건에 대한 결과는 한건일 것임
        assertNotNull(resultList);
        assertTrue(resultList.size() > 0);
        assertEquals(1, resultList.size());
        checkResult(vo, resultList.get(0));

        // 검색조건으로 name 설정 - '%' || #deptName# || '%'
        DeptVO searchVO2 = new DeptVO();
        searchVO2.setDeptName(""); // '%' || '' || '%' --> '%%'

        // selectList
        List<DeptVO> resultList2 = deptService.selectDeptList(searchVO2);

        // like 조건에 대한 결과는 한건 이상일 것임
        assertNotNull(resultList2);
        assertTrue(resultList2.size() > 0);
    }
    
    @Test
    public void testSelectDeptIncludesEmpList() throws Exception {
        DeptVO vo = new DeptVO();
        vo.setDeptNo(new BigDecimal(20));

        // select EmpIncludesDept
        DeptIncludesEmpListVO resultVO = deptService.selectDeptIncludesEmpList(vo);

        // check - 초기화 데이터에 따라 deptNo 20 인 data
        assertEquals(new BigDecimal(20), resultVO.getDeptNo());
        assertEquals("RESEARCH", resultVO.getDeptName());
        assertEquals("DALLAS", resultVO.getLoc());
        
        // check - dept's empList data
        // 초기화 데이터에 따라
        // EMP_NO EMP_NAME JOB     MGR  HIRE_DATE  SAL  COMM   DEPT_NO 
        // ------ -------- ------- ---- ---------- ---- ------ ------- 
        // 7369   SMITH    CLERK   7902 1980-12-17 800  (null) 20      
        // 7566   JONES    MANAGER 7839 1981-04-02 2975 (null) 20      
        // 7788   SCOTT    ANALYST 7566 1987-04-19 3000 (null) 20      
        // 7876   ADAMS    CLERK   7788 1987-05-23 1100 (null) 20      
        // 7902   FORD     ANALYST 7566 1981-12-03 3000 (null) 20
        
        assertEquals(5, resultVO.getEmpVOList().size());
        assertEquals(new BigDecimal(7369), resultVO.getEmpVOList().get(0).getEmpNo());
        assertEquals(new BigDecimal(7566), resultVO.getEmpVOList().get(1).getEmpNo());
        assertEquals(new BigDecimal(7788), resultVO.getEmpVOList().get(2).getEmpNo());
        assertEquals(new BigDecimal(7876), resultVO.getEmpVOList().get(3).getEmpNo());
        assertEquals(new BigDecimal(7902), resultVO.getEmpVOList().get(4).getEmpNo());
    }

}
