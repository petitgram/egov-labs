<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Class Name : check.jsp
  Description :  UX check box component
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
    <title>UX Component - UI</title> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        
        <!-- eGovFrame Common import -->
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/cmm/jquery.mobile-1.1.1.css" />" />
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/cmm/EgovMobile-1.1.1.css" />" />
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery-1.7.1.min.js"/>"></script>
		
		 
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery.mobile-1.1.1.js" />"></script>
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/EgovMobile-1.1.1.js" />"></script>
    
        <!-- guide import -->
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/rte/guide/guide.css" />">
        <script type="text/javascript"  src="<c:url value="/js/egovframework/mbl/rte/guide/guide.js"/>"></script>
               
	</head>

    <body>
    
        <!-- page start -->
		<div data-role="page" data-theme="d">
		
            <!-- header start -->
            <div data-role="header" data-position="inline" data-theme="b">
                <h4>Header</h4>
            </div>  
            <!-- header end -->
			
			<!-- content start -->		
			<div data-role="content" data-theme="d">
			    <div class="egov-align-center egov-font-size25 egov-color-blue">가이드 코드 샘플 화면 입니다.</div> 
			</div>
			<!-- content end -->

			<!-- footer start -->
			<div data-role="footer" data-theme="b" data-position="fixed">
				 <h4>Footer</h4>
			</div>
			<!-- footer end --> 
			
		</div>
    </body>

</html>