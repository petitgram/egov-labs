package egovframework.lab.dataaccess.common;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import egovframework.rte.fdl.cmmn.exception.handler.ExceptionHandler;

public class JdbcLoggingExcepHndlr implements ExceptionHandler {

    protected Log log = LogFactory.getLog(this.getClass());
    
    public void occur(Exception ex, String packageName) {
        log.error(ex.getMessage());
    }

}
