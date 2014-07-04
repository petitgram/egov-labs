package egovframework.lab.ioc.postprocess;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;

public class SampleBeanFactoryPostProcessor implements BeanFactoryPostProcessor {

    private final Log log = LogFactory.getLog(this.getClass());

    public void postProcessBeanFactory(
            ConfigurableListableBeanFactory beanFactory) throws BeansException {
        log.debug("SampleBeanFactoryPostProcessor executed.");

        // 전체 bean 이름 출력
        for (String beanDefinitionName : beanFactory.getBeanDefinitionNames()) {
            log.debug(beanDefinitionName);
        }
    }

}
