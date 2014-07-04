package egovframework.lab.ioc.lifecycle;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;

public class XmlBeanLifeCycleSample implements InitializingBean, DisposableBean {

    protected final Log log = LogFactory.getLog(this.getClass());

    public String sampleMethod() {
        return "Hi~ xml sample";
    }

    public void afterPropertiesSet() throws Exception {
        log
            .debug("InitializingBean 을 구현한 경우 Bean 초기화(Initialization) 시 afterPropertiesSet 메서드가 수행됨.");
    }

    public void directedInit() throws Exception {
        log.debug("Bean 설정에 init-method 를 기술한 경우 해당 초기화 메서드가 수행됨.");
    }

    public void destroy() throws Exception {
        log
            .debug("DisposableBean 을 구현한 경우 Bean 종료(Destruction) 시 destroy 메서드가 수행됨.");
    }

    public void directedDestroy() throws Exception {
        log.debug("Bean 설정에 destroy-method 를 기술한 경우 해당 종료 메서드가 수행됨.");
    }

}
