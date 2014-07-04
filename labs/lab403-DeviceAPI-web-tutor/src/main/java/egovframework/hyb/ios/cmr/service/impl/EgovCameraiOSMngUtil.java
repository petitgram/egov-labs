package egovframework.hyb.ios.cmr.service.impl;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egovframework.hyb.ios.cmr.service.CameraiOSAPIFileVO;
import egovframework.hyb.ios.cmr.service.EgovCameraiOSAPIService;
import egovframework.rte.fdl.cmmn.exception.EgovBizException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;

/**  
 * @Class Name : EgovFileTransfer.java
 * @Description : EgovFileTransfer
 * @
 * @  수정일                 수정자                 수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2012. 7. 10.  서준식                  최초생성
 * @ 2012. 7. 23.  이율경                  커스터마이징
 * @ 2012. 8. 03.  이해성                  커스터마이징
 * 
 * @author 디바이스 API 실행환경 개발팀
 * @since 2012. 7. 10.
 * @version 1.0
 * @see
 * 
 *  Copyright (C) by MOPAS All right reserved.
 */
@Service("EgovCameraiOSMngUtil")
public class EgovCameraiOSMngUtil {
	
	/** EgovCameraIOSAPIService */
    @Resource(name = "EgovCameraiOSAPIService")
    private EgovCameraiOSAPIService egovCameraiOSAPIService;

	private static final Logger LOGGER = Logger.getLogger(EgovCameraiOSMngUtil.class.getClass());
	
	/** propertiesService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
	@Resource(name="egovFileIdGnrService")
	private EgovIdGnrService egovFileIdGnrService;
	
	
	public CameraiOSAPIFileVO writeUploadedFile(MultipartFile file) throws Exception{
		
		String originFileName = file.getOriginalFilename();
		int index = originFileName.lastIndexOf(".");
		String fileExt = originFileName.substring(index + 1);
		String newName = "IMAGE_" + getTimeStamp() + ".jpg";
		
		// 파일 경로 바꾸어야함.
		String filePath = propertiesService.getString("fileStorePath");
		
		CameraiOSAPIFileVO fileVO = new CameraiOSAPIFileVO();
		
		fileVO.setFileSn(egovFileIdGnrService.getNextIntegerId());
		fileVO.setFileStreCours(filePath);
		fileVO.setStreFileNm(newName);
		fileVO.setOrignlFileNm(originFileName);
		fileVO.setFileExtsn(fileExt);
		fileVO.setFileSize(Long.toString(file.getSize()));
		IOException excep = null;
		if(!file.isEmpty()){
			InputStream input = null;
			FileOutputStream out = null;
			try {
				byte[] bytes = file.getBytes();
				input = new ByteArrayInputStream(bytes);
				
				File videoFile = new File(filePath + newName);
				out = new FileOutputStream(videoFile);
				int nextChar;
				while((nextChar = input.read()) != -1){
					out.write(nextChar);
					out.flush();
					
				}
			} catch (Exception e) {
				LOGGER.debug("Fail to upload file : " + e.getMessage());
				throw new EgovBizException("Fail to upload file : " + e.getMessage());
			}finally{
				try {
					if(out != null){
						out.close();
					}
					
				} catch (IOException e) {
					LOGGER.debug("Fail to close fileoutputstrem : " + e.getMessage());
					excep = e;
				}
			}
		}
		egovCameraiOSAPIService.insertCameraPhotoAlbumFile(fileVO);
		if(excep != null) {
        	throw new EgovBizException("Fail to close fileoutputstrem : " + excep.getMessage());
        }
		return fileVO;
	}
	
	private static String getTimeStamp(){
		String rtnStr = null;

		// 문자열로 변환하기 위한 패턴 설정(년도-월-일 시:분:초:초(자정이후 초))
		String pattern = "yyyyMMddhhmmssSSS";

		try {
		    SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, Locale.KOREA);
		    Timestamp ts = new Timestamp(System.currentTimeMillis());

		    rtnStr = sdfCurrent.format(ts.getTime());
		} catch (Exception e) {
		    //e.printStackTrace();
			
		    //throw new RuntimeException(e);	// 보안점검 후속조치
		    LOGGER.debug("IGNORED: " + e.getMessage());
		}

		return rtnStr;
	}
}
