package egovframework.lab.ajax.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sourceforge.ajaxtags.xml.AjaxXmlBuilder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.lab.ajax.service.DepartmentService;
import egovframework.lab.ajax.service.EmployeeService;
import egovframework.lab.ajax.service.impl.EmployeeServiceImpl;
import egovframework.lab.com.view.AjaxXmlView;
import egovframework.lab.com.vo.Department;

@Controller
public class AjaxController {

    //@Resource를 @Autowired 로 바꾸어 실행하여라.
    @Resource(name = "employeeService")
    private EmployeeService employeeService;

    @Resource(name = "departmentService")
    private DepartmentService departmentService;

    // 사원정보 리스트 페이지에서 검색입력창(사원이름)에 사용되는 자동완성기능
    @RequestMapping("/suggestName.do")
    protected ModelAndView suggestName(@RequestParam("searchName") String searchName) {

        ModelAndView model = new ModelAndView(new AjaxXmlView());
        // TODO [Step 2-2-4] employeeService.getNameListForSuggest 메소드를 호출하여 결과를 가져온다.
        List<String> nameList = null;

        AjaxXmlBuilder ajaxXmlBuilder = new AjaxXmlBuilder();

        for (String name : nameList) {
            ajaxXmlBuilder.addItem(name, name, false);
        }
        model.addObject("ajaxXml", ajaxXmlBuilder.toString());
        return model;
    }

    // linked selectbox 처리 기능
    @RequestMapping("/autoSelectDept.do")
    protected ModelAndView getDeptInfoforSelectTag(@RequestParam("superdeptid") String superdeptid,
            @RequestParam("depth") String depth) throws Exception {

        Map<String, String> param = new HashMap<String, String>();
        param.put("superdeptid", superdeptid);
        param.put("depth", depth);
        List<Department> deptList = departmentService.getDepartmentList(param);
        ModelAndView model = new ModelAndView(new AjaxXmlView());
        model.addObject("ajaxXml", (new AjaxXmlBuilder()).addItems(deptList, "deptname", "deptid", true).toString());

        return model;
    }
}
