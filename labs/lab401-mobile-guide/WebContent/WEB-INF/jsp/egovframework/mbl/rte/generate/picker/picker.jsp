<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
  Class Name : picker.jsp
  Description :  UX Picker Generate code
  Modification Information

      수정일         수정자           수정내용
    -------------    --------    ---------------------
     2011.08.31    황민희          최초 생성
 
    author   : 모바일 실행환경 개발팀 황민희
    since    : 2011.08.31
--%>
<!DOCTYPE html> 
<html> 
    <head>
        <title>Generate code - Picker</title> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        
        <!-- eGovFrame Common import -->
        <!-- jQuery UI CSS -->
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/rte/guide/jquery.ui.all.css"/>" />
        
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/cmm/jquery.mobile-1.0b3.min.css" />" />
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/cmm/EgovMobile.css" />" />
        
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery-1.6.2.min.js"/>"></script>
		<!-- History.js -->
		<script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery.history.js"/>"></script> 
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery.mobile-1.0b3.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/EgovMobile.js" />"></script>
    
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
        
        <script language='JavaScript' type='text/javascript'> /* 스크립트를 헤드에 두지만 바디에 두어도 가능한 것확인. 바디 width=100%를 크기 조절하면 됨 */

		 function modechange() {
			 var f = document.forms[0];
			 var prefix = f.etcOptionsMode1.value;
			 if(prefix =="mode:timebox")
				 f.action="<c:url value="/generate/picker/timepicker.do"/>";
			 else
			 	f.action="<c:url value="/generate/picker/picker.do"/>";
			 f.target="_self";
			 f.submit();
         }      

		 function generate(status) {
             var f = document.forms[0];
			 var prefix = f.etcOptionsMode1.value;
			 if(prefix =="mode:timebox") {
				 f.action="<c:url value="/generate/picker/timepickeGenr.do"/>";
			 } else {
             	f.action="<c:url value="/generate/picker/pickerGen.do"/>";
			 }

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
                <h1><img src="<c:url value="/images/egovframework/mbl/rte/guide/h1_logo.png"/>" /></h1>
            </div>  
            <!-- header end -->
			
			<!-- content start -->		
			<div data-role="content" data-theme="d">
				<!-- content-primary start -->
				<div class="content-primary">
					<div class="egov-tit">
						<h1>Date / Time Picker <span class="sub">- Date Picker</span></h1>
					</div>
					
					<form method="post">
					<input type="hidden" name="xmlStatus">
					
					<div class="gen-Group">
					    <div class="gen-grid">
							<ul class="c-attr">
								<li>
								    <div class="gen-wid1"><strong>유형</strong></div>
									<div class="gen-wid2">
										<select name="etcOptionsMode1" id="mode" data-role="none" class="gen-sele" onchange="javascript:modechange();">
											<option value=""  selected>Date</option>
	                                        <option value="mode:timebox" >Time</option>								
										</select>
									</div>								
								</li>
						    </ul>
					    </div>
					</div>

                    <div class="gen-Group">
                        <div class="gen-grid">
                            <ul class="c-attr">
                                <li>
                                    <div class="gen-wid1"><strong>형태</strong></div>
									<div class="gen-wid2">
										<select name="etcOptionsMode2" data-role="none" class="gen-sele" >
										    <option value="" ${(xml.component["etcOptionsMode2"] == null || xml.component["etcOptionsMode2"] == '') ? 'selected="selected"' : ''} >안드로이드</option>
										    <option value="mode:calbox" ${(xml.component["etcOptionsMode2"] == 'mode:calbox') ? 'selected="selected"' : ''} >달력</option>
										</select>
									</div>
							    </li>
                                <li>
                                    <div class="gen-wid1"><strong>주요색</strong></div>

								    <div class="gen-wid2">
									<select name="etcOptionsButton" data-role="none" class="gen-sele">
                                        <option value="">선택</option>
                                        <option value="button:a" ${(xml.component["etcOptionsButton"] == 'button:a') ? 'selected="selected"' : ''}>검정</option>
                                        <option value="button:b" ${(xml.component["etcOptionsButton"] == 'button:b') ? 'selected="selected"' : ''}>파랑</option>
                                        <option value="button:c" ${(xml.component["etcOptionsButton"] == 'button:c') ? 'selected="selected"' : ''}>회색</option>
                                        <option value="button:d" ${(xml.component["etcOptionsButton"] == 'button:d') ? 'selected="selected"' : ''}>흰색</option>
                                        <option value="button:e" ${(xml.component["etcOptionsButton"] == 'button:e') ? 'selected="selected"' : ''}>노랑</option>
                                        <option value="button:f" ${(xml.component["etcOptionsButton"] == 'button:f') ? 'selected="selected"' : ''}>빨강</option>
                                        <option value="button:g" ${(xml.component["etcOptionsButton"] == 'button:g') ? 'selected="selected"' : ''}>초록</option>      									
									</select>
								    </div>
							    </li>
                                <li>
                                    <div class="gen-wid1"><strong>보조색</strong></div>

								    <div class="gen-wid2">
										<select name="etcOptionsPage" data-role="none" class="gen-sele">
	                                        <option value="">선택</option>
	                                        <option value="page:a" ${(xml.component["etcOptionsPage"] == 'page:a') ? 'selected="selected"' : ''}>검정</option>
	                                        <option value="page:b" ${(xml.component["etcOptionsPage"] == 'page:b') ? 'selected="selected"' : ''}>파랑</option>
	                                        <option value="page:c" ${(xml.component["etcOptionsPage"] == 'page:c') ? 'selected="selected"' : ''}>회색</option>
	                                        <option value="page:d" ${(xml.component["etcOptionsPage"] == 'page:d') ? 'selected="selected"' : ''}>흰색</option>
	                                        <option value="page:e" ${(xml.component["etcOptionsPage"] == 'page:e') ? 'selected="selected"' : ''}>노랑</option>
	                                        <option value="page:f" ${(xml.component["etcOptionsPage"] == 'page:f') ? 'selected="selected"' : ''}>빨강</option>
	                                        <option value="page:g" ${(xml.component["etcOptionsPage"] == 'page:g') ? 'selected="selected"' : ''}>초록</option>         									
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
					
					<p class="anno">※ 해당 컴포넌트는 iOS4에서 일부 동작이 정상작동되지 않으므로 iOS5에서 확인하도록 권장합니다.</p>					
					
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
				 <h4>Copyright(c)2011 Ministry of Public Administration and Security.</h4>
			</div>
			<!-- footer end --> 
			
		</div>
		<!-- page end -->
	
    </body>
</html>