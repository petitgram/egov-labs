<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
  Class Name : panel.jsp
  Description :  UX Panel Generate code
  Modification Information

      수정일         수정자           수정내용
    -------------    --------    ---------------------
     2011.08.31    황민희          최초 생성
 
    author   : 모바일 실행환경 개발팀 황민희
    since    : 2011.08.31
--%>
<!DOCTYPE html> 
<html lang="kr"> 
    <head>
        <title>Generate code - Button</title> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        
        <!-- eGovFrame Common import -->
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
		
		<!-- jQuery UI Tab Title Size -->
		<style type="text/css">
			.tabTitle{
				font-size: 65%;
			}
		</style>
        
        <!-- JQuery UI Tab -->
        <script>
			$(function() {
				$( "#tabs" ).tabs();
			});
		</script>
				
		<script type="text/javascript">
		function generate(status) {
			 var f = document.forms[0];
			 f.action="<c:url value="/generate/panel/panelGen.do"/>";
			 f.xmlStatus.value = status;
			 f.target="generateUI";
             if (status == 'deleteXml') {
                 jConfirm('삭제 하시겠습니까?', '가이드 프로그램', 'f', function(answer) {
                     if(answer) {
                         f.submit();
                     }
                 });
             } else {
                 f.submit();
             }
         }

        if (${fn:length(xml.component) != 0}) {
            window.onload = generate;
        }

        function saveMessge() {
            jOverlay('저장되었습니다.', '가이드 프로그램', 'g');
        }               
		</script>		
	</head>
	
    <body>
    
		<!-- page start -->
		<div data-role="page">
		
            <!-- header start -->
            <div data-role="header" data-position="inline" data-theme="z"  class="egovBarHeader">
                <a href="<c:url value="/guide/guide.do"/>" data-icon="home" class="ui-btn-left" data-ajax="false">Home</a>
                <a href="<c:url value="/guide/guide.do"/>" data-icon="back" class="ui-btn-right" data-ajax="false">Back</a>
                <h1><img src="<c:url value="/images/egovframework/mbl/rte/guide/h1_logo.png" />" alt="egovframework" /></h1>
            </div>  
            <!-- header end -->
			
			<!-- content start -->
			<div data-role="content" data-theme="d">
			
				<!-- content-primary start -->
				<div class="content-primary">
					<div class="egov-tit">
						<h1>Panel</h1>
					</div>		
					
					<form method="post">			
					<input type="hidden" name="xmlStatus">

					<div class="gen-Group">
						<div class="gen-grid">
                            <ul class="c-attr">
								<li>
									<div class="gen-wid1"><strong>색상</strong></div>
			                     	<div class="gen-wid2">
			                     		<select name ="cssTheme" data-role="none" class="gen-sele">
						                    <option value="css:ui-body-a"  ${(xml.component["cssTheme"] == 'css:ui-body-a') ? 'selected="selected"' : ''}>검정</option>
						                    <option value="css:ui-body-b" ${(xml.component["cssTheme"] == 'css:ui-body-b') ? 'selected="selected"' : ''}>회색</option>
						                    <option value="css:ui-body-c" ${(xml.component["cssTheme"] == 'css:ui-body-c') ? 'selected="selected"' : ''}>연한 회색</option>
						                    <option value="css:ui-body-d" ${(xml.component["cssTheme"] == 'css:ui-body-d') ? 'selected="selected"' : ''}>흰색</option>
						                    <option value="css:ui-body-e" ${(xml.component["cssTheme"] == 'css:ui-body-e') ? 'selected="selected"' : ''}>노랑</option>
						                    <option value="css:ui-body-f" ${(xml.component["cssTheme"] == 'css:ui-body-f') ? 'selected="selected"' : ''}>빨강</option>
						                    <option value="css:ui-body-g" ${(xml.component["cssTheme"] == 'css:ui-body-g') ? 'selected="selected"' : ''}>초록</option>
										</select>        
			                     	</div>
								</li>
								<li>
									<div class="gen-wid1"><strong>체크무늬</strong></div>
			                     	<div class="gen-wid2">
			                     		<select name="cssPattern" data-role="none" class="gen-sele">
	                                        <option value="">선택</option>
						                    <option value="css:egov-panel-pattern-a" ${(xml.component["cssPattern"] == 'css:egov-panel-pattern-a') ? 'selected="selected"' : ''}>검정</option>
						                    <option value="css:egov-panel-pattern-b" ${(xml.component["cssPattern"] == 'css:egov-panel-pattern-b') ? 'selected="selected"' : ''}>회색</option>
						                    <option value="css:egov-panel-pattern-c" ${(xml.component["cssPattern"] == 'css:egov-panel-pattern-c') ? 'selected="selected"' : ''}>연한 회색</option>
						                    <option value="css:egov-panel-pattern-d" ${(xml.component["cssPattern"] == 'css:egov-panel-pattern-d') ? 'selected="selected"' : ''}>흰색</option>
						                    <option value="css:egov-panel-pattern-e" ${(xml.component["cssPattern"] == 'css:egov-panel-pattern-e') ? 'selected="selected"' : ''}>노랑</option>
						                    <option value="css:egov-panel-pattern-f" ${(xml.component["cssPattern"] == 'css:egov-panel-pattern-f') ? 'selected="selected"' : ''}>빨강</option>
						                    <option value="css:egov-panel-pattern-g" ${(xml.component["cssPattern"] == 'css:egov-panel-pattern-g') ? 'selected="selected"' : ''}>초록</option>
	                                    </select>        
			                     	</div>
								</li>
                            </ul>
					   </div>
				   </div>
				   </form>
				   
						
					<!-- btn  -->
					<div class="gen-btn">   
						<a href="javascript:generate();"><span>생성</span></a>
						<a href="javascript:generate('makeXml');"><span>저장</span></a>
						<a href="javascript:generate('deleteXml');"><span>삭제</span></a>
					</div>
					<!-- //btn  -->

					<jsp:include page="../genSource.jsp"></jsp:include>
					
					<div style="clear:both;"></div>
					
				</div>
				<!-- content-primary end -->
				
				<!-- content-secondary start -->
				<div class="content-secondary"> 
					<jsp:include page="../componentMenu.jsp"></jsp:include>
				</div>			
				<!-- content-secondary end -->
								
			</div>
			<!-- content end -->
			
			<!-- footer start -->
			<div data-role="footer" data-theme="z"  class="egovBar">
				 <h4>Copyright(c)2012 Ministry of Public Administration and Security.</h4>
			</div>
			<!-- footer end --> 
			
		</div>
		<!-- page end -->
	
    </body>
</html>