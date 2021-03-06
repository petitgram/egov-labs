package egovframework.lab.ajax.web;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.lab.com.view.AjaxSimpleView;

@Controller
public class AjaxSimpleController {

    Log log = LogFactory.getLog(this.getClass());

    private String[] keywords = { "가", "가나", "가나다", "가나다라마", "나", "나다", "나다라마" };

    @SuppressWarnings("unchecked")
    private List search(String keyword) {
        if (keyword == null || keyword.equals(""))
            return java.util.Collections.EMPTY_LIST;
        keyword = keyword.toUpperCase();
        List result = new java.util.ArrayList(8);
        for (int i = 0; i < keywords.length; i++) {
            if (((String) keywords[i]).startsWith(keyword)) {
                result.add(keywords[i]);
            }
        }
        return result;
    }

    //TODO [Step 2-1-1] simpleAjax 메소드 완성하기 

}
