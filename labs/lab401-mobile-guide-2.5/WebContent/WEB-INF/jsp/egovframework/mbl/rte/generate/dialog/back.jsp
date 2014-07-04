<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%--
  Class Name : back.jsp
  Description :  UX dialog component
  Modification Information

      수정일         수정자           수정내용
    -------------    --------    ---------------------
     2011.07.14    황민희          최초 생성
 
    author   : 모바일 실행환경 개발팀 황민희
    since    : 2011.07.06
--%>
<!DOCTYPE html> 
<html lang="kr"> 
  <head> 
    <title>UX Component - Dialog</title> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" /> 
            
        <!-- eGovFrame Common import -->
        <!-- jQuery UI CSS -->
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/rte/guide/jquery.ui.all.css"/>" />
        
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/cmm/jquery.mobile-1.1.1.css" />" />
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/cmm/EgovMobile-1.1.1.css" />" />
        
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery-1.7.1.min.js"/>"></script>
				 
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery.mobile-1.1.1.js" />"></script>
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/EgovMobile-1.1.1.js" />"></script>
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery.history.js" />"></script>
    
   		 <!-- JQuery UI JS -->
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/rte/guide/jquery.ui.core.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/egovframework/mbl/rte/guide/jquery.ui.widget.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/egovframework/mbl/rte/guide/jquery.ui.tabs.js"/>"></script>
        
        <!-- guide import -->
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/rte/guide/guide.css" />">
        <script type="text/javascript"  src="<c:url value="/js/egovframework/mbl/rte/guide/guide.js"/>"></script>
	
     </head>
     
     <body>
     <!-- dialog start -->
         <div data-role="page" data-theme="d" style="-webkit-backface-visibility: hidden;"> <!-- Ios5 safari Iframe 내에서 Slideup 효과시 Iframe 높이 이상 문제 -->
            
            <div data-role="header" data-position="inline" data-theme="e">
            	<h1>eGovFrame</h1>	
			</div> 
            
             <div data-role="content"><!-- content start -->
			    	<h1>Dialog Sample Page !</h1>
					<br>
	             	<!-- <a href="/generate/dialog/dialog.do"" data-role="button" data-theme="b" data-ajax="false">GO TO DIALOG</a>	
 					-->
             </div><!-- content end -->	 
         </div> 
     </body>
 </html>