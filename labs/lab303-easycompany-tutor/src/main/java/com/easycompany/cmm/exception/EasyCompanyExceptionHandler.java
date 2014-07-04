package com.easycompany.cmm.exception;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import egovframework.rte.fdl.cmmn.exception.EgovBizException;
import egovframework.rte.fdl.cmmn.exception.handler.ExceptionHandler;

public class EasyCompanyExceptionHandler implements ExceptionHandler {

    protected Log log = LogFactory.getLog(this.getClass());

    public void occur(Exception exception, String packageName) {
        log.debug(" EasyCompanyExceptionHandler run..............."+ ((EgovBizException) exception).getWrappedException());

        try {
            if (exception instanceof EgovBizException) {
                Exception exx = (Exception) ((EgovBizException) exception).getWrappedException();
                if (exx != null) {

                    log.debug(" sending a alert mail  is completed ");
                    log.debug(" sending a alert mail  is completed ");
                    log.debug(" sending a alert mail  is completed ");
                    log.debug(" sending a alert mail  is completed ");
                    log.debug(" sending a alert mail  is completed ");
                    log.debug(" sending a alert mail  is completed ");
                    log.debug(" sending a alert mail  is completed ");
                    log.debug(" sending a alert mail  is completed ");
                    log.debug(" sending a alert mail  is completed ");
                    log.debug(" sending a alert mail  is completed ");
                    exx.printStackTrace();
                }
            }
           
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
