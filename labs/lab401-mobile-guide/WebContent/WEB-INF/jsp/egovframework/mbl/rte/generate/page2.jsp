<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<html> 
    <head>
    <title>UX Component - UI</title> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        
        <!-- eGovFrame Common import -->
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/cmm/jquery.mobile-1.0b3.min.css" />" />
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/cmm/EgovMobile.css" />" />
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery-1.6.2.min.js"/>"></script>
		<!-- History.js -->
		<script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery.history.js"/>"></script>  
        <c:if test="${alreadyScript != null}">
        <script type="text/javascript">
            <c:out value="${alreadyScript}" escapeXml="false" />
        </script>
        </c:if>
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery.mobile-1.0b3.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/EgovMobile.js" />"></script>
                        
	</head>

    <body>
    
        <!-- page start -->
		<div data-role="page" data-theme="g">
		
            <!-- header start -->
            <div data-role="header">
                <a href="#generatePage" data-icon="back" class="ui-btn-left">back</a>
                <h4>Header</h4>
            </div>  
            <!-- header end -->
			
			<!-- content start -->		
			<div data-role="content">
				<p>/generate/page2.do</p>
			</div>
			<!-- content end -->
			
			<!-- footer start -->
			<div data-role="footer" data-position="fixed">
				 <h4>Footer</h4>
			</div>
			<!-- footer end --> 
			
		</div>
		
		
        <div id="generateCode" style="display:none">
        <c:if test="${alreadyScript != null}">
        &lt!-- javascript script --&gt;
        &lt;script type="text/javascript"&gt;
        <c:out value="${alreadyScript}"/>
        &lt;/script&gt;
        </c:if>
        <c:if test="${componentHtml != null}">
        &lt!-- component source --&gt;
        <c:out value="${componentHtml}"/>
        </c:if>
        </div>

        <script type="text/javascript" >
            parent.document.all.generateCode.value = document.getElementById("generateCode").innerText.replace(/^\s*|\s*$/gm, '');
        </script>
                		
    </body>

</html>