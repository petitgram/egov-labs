package egovframework.lab.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import egovframework.lab.com.authenticator.Authenticator;
import egovframework.lab.web.model.LoginCommand;
import egovframework.lab.web.model.LoginType;



@Controller
//TODO [Step 1-3-2] LoginController.java 에 login 명의 객체에 대해  @SessionAttributes 설정 하기
//이 부분은 login 객체를 Session 객체에 저장하는 방법이다.
public class LoginController {

    private Log log = LogFactory.getLog(getClass());

    @Autowired
    @Qualifier("loginCommandValidator")
    private Validator loginCommandValidator;

    @Resource(name = "LoginAuthenticator")
    private Authenticator authenticator;
    

    
	private String formView = "login/loginForm";
	private String successView = "login/loginSuccess";

	private String getFormView() {
		return formView;
	}

	private String getSuccessView() {
		return successView;
	}

	public void setFormView(String formView) {
		this.formView = formView;
	}

	public void setSuccessView(String successView) {
		this.successView = successView;
	}


	/*
	 * TODO [Step 1-2-2] LoginController.java 메소드 추가하기
	 * 웹을 통해 들어오는 url 은 loginProcess1.do 이며 Get/Post 형식으로 넘어온다. 
	 * 두가지를 다받는 메소드를 만들어보자.
	 * 또 ModelAttribute를 이용하여 loginTypes와 login 객체를 초기화 해주는 메소드를 만든다.
	 * 
	 * TODO [Step 1-3-3] loginProcess 메소드에 SessionStatus 를 받아와 complete 하기 
	 * 
	 * TODO [Step 1-4-1] LoginController.java 에서 loginProcess 메소드 수정하기.  Validator 이용하여  값 검증하기
	 */

}
