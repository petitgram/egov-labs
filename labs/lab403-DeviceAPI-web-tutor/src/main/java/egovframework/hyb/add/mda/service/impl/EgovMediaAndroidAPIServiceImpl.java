/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.hyb.add.mda.service.impl;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.hyb.add.mda.service.EgovMediaAndroidAPIService;
import egovframework.hyb.add.mda.service.MediaAndroidAPIFileVO;
import egovframework.hyb.add.mda.service.MediaAndroidAPIVO;

/**  
 * @Class Name : EgovMediaAndroidAPIServiceImpl.java
 * @Description : EgovMediaAndroidAPIServiceImpl Class
 * @Modification Information  
 * @
 * @  수정일            수정자        수정내용
 * @ ---------        ---------    -------------------------------
 * @ 2012. 7. 30.        이율경        최초생성
 * 
 * @author 디바이스 API 실행환경 팀
 * @since 2012. 7. 30.
 * @version 1.0
 * @see
 * 
 */
@Service("EgovMediaAndroidAPIService")
public class EgovMediaAndroidAPIServiceImpl implements
        EgovMediaAndroidAPIService {

    /** CameraAndroidAPIDAO */
    @Resource(name="MediaAndroidAPIDAO")
    private MediaAndroidAPIDAO mediaAPIDAO;
    
    protected Log log = LogFactory.getLog(this.getClass());
    
    /**
     * 녹음 Media를 등록한다.
     * @param vo - 등록할 정보가 담긴 MediaAndroidAPIVO
     * @return void형
     * @exception Exception
     */
    public int insertMediaInfo(MediaAndroidAPIVO vo, int fileSn) throws Exception {
        
        MediaAndroidAPIFileVO fileVO = new MediaAndroidAPIFileVO();
        fileVO.setUuid(vo.getUuid());
        fileVO.setFileSn(fileSn);
        fileVO.setMdCode("MLT03");
        fileVO.setMdSj(vo.getMdSj());
        fileVO.setUseyn("Y");
        fileVO.setRevivCo("0");
        
        return mediaAPIDAO.insertMediaInfo(fileVO);
    }
    
    /**
     * 녹음 파일을 등록한다.
     * @param vo - 등록할 정보가 담긴 MediaAndroidAPIFileVO
     * @return void형
     * @exception Exception
     */
    public int insertMediaRecordFile(MediaAndroidAPIFileVO vo) throws Exception {
        return mediaAPIDAO.insertMediaRecordFile(vo);
    }
    
    /**
     * 미디어 정보를 조회한다.
     * @param VO - 조회할 정보가 담긴 MediaAndroidAPIVO
     * @return 조회 목록
     * @exception Exception
     */
        
    public MediaAndroidAPIFileVO selectMediaInfoDetail(MediaAndroidAPIVO vo) throws Exception {
        mediaAPIDAO.updateMediaInfoRevivCo(vo);
        return mediaAPIDAO.selectMediaInfoDetail(vo);
    }
    
    /**
     * 미디어 목록을 조회한다.
     * @param VO - 조회할 정보가 담긴 MediaAndroidAPIDefaultVO
     * @return 조회 목록
     * @exception Exception
     */
    public List selectMediaInfoList(MediaAndroidAPIVO vo) throws Exception {
        
        return mediaAPIDAO.selectMediaInfoList(vo);
    }
    
    
    /**
     * 미디어 파일을 조회한다.
     * @param VO - 조회할 정보가 담긴 MediaAndroidAPIFileVO
     * @return 파일 정보
     * @exception Exception
     */
    public boolean selectMediaFileInf(HttpServletResponse response, MediaAndroidAPIFileVO vo) throws Exception {
        File file = null;
        FileInputStream fis = null;
    
        BufferedInputStream in = null;
        ByteArrayOutputStream bStream = null;
        
        MediaAndroidAPIFileVO fileVO = mediaAPIDAO.selectMediaFileInfo(vo);
        
        String type = "";

        boolean errorFlag = true;
        try {
            file = new File(fileVO.getFileStreCours(), fileVO.getStreFileNm());
            fis = new FileInputStream(file);
    
            in = new BufferedInputStream(fis);
            bStream = new ByteArrayOutputStream();
    
            int imgByte;
            while ((imgByte = in.read()) != -1) {
                bStream.write(imgByte);
            }
    
            if (fileVO.getMdCode() != null && !"".equals(fileVO.getMdCode()) && 
                    fileVO.getFileExtsn() != null && !"".equals(fileVO.getFileExtsn())) {
                
                type = "audio/" + fileVO.getFileExtsn();
        
            } else {
                log.debug("Media fileType is null.");
            }
        
            response.setHeader("Content-Type", type);
            response.setContentLength(bStream.size());
        
            bStream.writeTo(response.getOutputStream());
        
            response.getOutputStream().flush();
            response.getOutputStream().close();
    
        } catch(Exception e) {
            log.debug("IGNORE: " + e.getMessage());
            errorFlag = false;
        } finally {
            if (bStream != null) {
                try {
                    bStream.close();
                } catch (Exception e) {
                    log.debug("IGNORE: " + e.getMessage());
                    errorFlag = false;
                }
            }
            if (in != null) {
                try {
                    in.close();
                } catch (Exception e) {
                    log.debug("IGNORE: " + e.getMessage());
                    errorFlag = false;
                }
            }
            if (fis != null) {
                try {
                    fis.close();
                } catch (Exception e) {
                    log.debug("IGNORE: " + e.getMessage());
                    errorFlag = false;
                }
            }
        }
        
        return errorFlag;
    }
}
