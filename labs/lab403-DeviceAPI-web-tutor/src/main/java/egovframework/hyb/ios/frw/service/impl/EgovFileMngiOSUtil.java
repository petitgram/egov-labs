/**
 * 
 */
package egovframework.hyb.ios.frw.service.impl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egovframework.hyb.ios.frw.service.EgovFileReaderWriteriOSAPIService;
import egovframework.hyb.ios.frw.service.FileReaderWriteriOSAPIVO;
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
 * 
 * @author 디바이스 API 실행환경 개발팀
 * @since 2012. 7. 10.
 * @version 1.0
 * @see
 * 
 *  Copyright (C) by MOPAS All right reserved.
 */
@Service("egovFileMngiOSUtil")
public class EgovFileMngiOSUtil {

	
	/** Logger */
	private static final Log LOG = LogFactory.getLog(EgovFileMngiOSUtil.class);
	
	/** BUFFER_SIZE */
	private final static int BUFFER_SIZE = 2048;
	
	/** propertiesService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /** EgovIdGnrService */
	@Resource(name="egovFileIdGnrService")
	private EgovIdGnrService egovFileIdGnrService;
	
	/** EgovFileReaderWriteriOSAPIService */
	@Resource(name="egovFileReaderWriteriOSAPIService")
	private EgovFileReaderWriteriOSAPIService egovFileReaderWriteriOSAPIService;
	
	
	
	/**
	 * 사용자가 전송한 파일을 업로드 한다.
	 * @param file - 업로드된 파일 정보가 담긴 MultipartFile 
	 * @param fileVO - 파일 정보가 담긴 FileReaderWriteriOSAPIVO 
	 * @exception Exception
	 */
	public FileReaderWriteriOSAPIVO writeUploadedFile(MultipartFile file, FileReaderWriteriOSAPIVO fileVO) throws Exception{
		
		String originFileName = file.getOriginalFilename();
		int index = originFileName.lastIndexOf(".");
		String fileExt = originFileName.substring(index + 1);
		String newName = "File_" + getTimeStamp();
		
		//fileVO에 값 셋팅
		fileVO.setFileStreCours(propertiesService.getString("fileStorePath"));
		fileVO.setOrignlFileNm(originFileName);
		fileVO.setStreFileNm(newName);
		fileVO.setFileExtsn(fileExt);
		fileVO.setFileSize(Long.toString(file.getSize()));
		fileVO.setFileSn(egovFileIdGnrService.getNextIntegerId());
		
		

		
		if(!file.isEmpty()){
			InputStream input = null;
			FileOutputStream out = null;
			try {
				byte[] bytes = file.getBytes();
				input = new ByteArrayInputStream(bytes);
				
				File videoFile = new File(propertiesService.getString("fileStorePath") + newName);
				out = new FileOutputStream(videoFile);
				int nextChar;
				while((nextChar = input.read()) != -1){
					out.write(nextChar);
					out.flush();
					
				}
			} catch (Exception e) {
				LOG.error("Fail to upload file : " + e.getMessage());
				throw new EgovBizException("Fail to upload file : " + e.getMessage());
			}finally{
				try {
					if(out != null){
						out.close();
					}
					
				} catch (IOException e) {
					LOG.error("Fail to close fileoutputstrem : " + e.getMessage());
				}
			}
		}
		
		egovFileReaderWriteriOSAPIService.insertFileDetailInfo(fileVO);
		return fileVO;
	}
	
	/**
	 * 선택된 파일에 대한 다운로드 기능을 처리한다.
	 * @param request - HttpServletRequest 
	 * @param response - HttpServletResponse 
	 * @param fileVO - 파일 정보가 담긴 FileReaderWriteriOSAPIVO 
	 * @exception Exception
	 */
	public void fileDownload(HttpServletRequest request, HttpServletResponse response, FileReaderWriteriOSAPIVO fileVO) throws Exception{
		
		
		File file = new File(propertiesService.getString("fileStorePath") + fileVO.getStreFileNm());
		
		if(!file.exists()){
			throw new FileNotFoundException(fileVO.getStreFileNm());			
		}
		if(!file.isFile()){
			throw new FileNotFoundException(fileVO.getStreFileNm());
		}
		
		
		byte[] buffer = new byte[BUFFER_SIZE];
		
		
		response.setContentType("video/quicktime");
		response.setHeader("Content-Disposition:", "attachment; filename=" + new String(fileVO.getOrignlFileNm().getBytes(), "UTF-8"));
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
		
		BufferedInputStream fin = null;
		BufferedOutputStream outs = null;

		try {
			fin = new BufferedInputStream(new FileInputStream(file));
		    outs = new BufferedOutputStream(response.getOutputStream());
		    int read = 0;

			while ((read = fin.read(buffer)) != -1) {
			    outs.write(buffer, 0, read);
			}
		} finally {
			if (outs != null) {
				try {
					outs.close();
				} catch (Exception ignore) {
					LOG.error("IGNORED: " + ignore.getMessage());
				}
			}
			if (fin != null) {
				try {
					fin.close();
				} catch (Exception ignore) {
					LOG.error("IGNORED: " + ignore.getMessage());
				}
			}
		}
		
		
	}
	
	
	/**
	 * 선택된 파일에 대한 삭제 기능을 처리한다.
	 * @param fileVO - 파일 정보가 담긴 FileReaderWriteriOSAPIVO 
	 * @exception Exception
	 */
	public void deleteFile(FileReaderWriteriOSAPIVO fileVO) throws Exception{
		
		File videoFile = new File(propertiesService.getString("fileStorePath") + fileVO.getStreFileNm());
		
		if(!videoFile.exists()){
			LOG.info("There is no file to remove.");			
		}
		if(!videoFile.isFile()){
			LOG.info("This is not file.");
		}
		
		boolean result = false;
		
		if(videoFile != null){
			result = videoFile.delete();
		}
		
		
		if(result == false){
			LOG.info("Fail to remove file.");
		}
			
		
		egovFileReaderWriteriOSAPIService.deleteFileDetailInfo(fileVO);
	
		
		
		
		
	}
	
	
	
	
	
	
	/**
	 * yyyyMMddhhmmssSSS 패턴의 현재 날자를 반환한다.
	 * @return String
	 * @exception Exception
	 */
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
			LOG.error("IGNORED: " + e.getMessage());
		}

		return rtnStr;
	}
}
