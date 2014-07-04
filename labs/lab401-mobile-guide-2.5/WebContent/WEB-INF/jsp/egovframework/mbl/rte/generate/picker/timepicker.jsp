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
     2012.08.10    박지민          표준 코드 Upgrade 및 Flip에 따른 변경사항 추가
 
    author   : 모바일 실행환경 개발팀 황민희
    since    : 2011.08.31
--%>
<!DOCTYPE html> 
<html lang="kr"> 
    <head>
        <title>Generate code - Picker</title> 
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
			
			
			$(function() {
				 $("#timemode2").change(function() {
					 
					var attr = "";
					var color = ["", "a", "b", "c", "d", "e", "f", "g"];
					
					var timemode = ["mode:timebox", "mode:timebox", "mode:timeflipbox"];
					
					if($("#timemode2 option:selected").index() == 2) {
						attr = "themeDate";
						$("#timemode option:selected").val("mode:timeflipbox");						
					}
					else {						
						attr = "themeButton";
						$("#timemode option:selected").val("mode:timebox");
					}
						 
					 $("#etcOptionsSub option").each(function(i){
						 
						 if(i > 1) {
							 
						 	$(this).val(attr + ":" + color[i]);
						 }
					 });
					 
		 	      });				 
			
			 });
		</script>
        
        <script>

		 function modechange() {
			 var f = document.forms[0];
			 var prefix = f.etcOptionsMode1.value;
			 if(prefix =="mode:timebox" || prefix =="mode:timeflipbox")
				 f.action="<c:url value="/generate/picker/timepicker.do"/>";
			 else
			 	f.action="<c:url value="/generate/picker/picker.do"/>";
			 f.target="_self";
			 f.submit();
         }      

		 function generate(status) {
             var f = document.forms[0];
			 var prefix = f.etcOptionsMode1.value;
			 if(prefix =="mode:timebox" || prefix =="mode:timeflipbox") {
				 f.action="<c:url value="/generate/picker/timepickerGen.do"/>";
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
                <h1><img src="<c:url value="/images/egovframework/mbl/rte/guide/h1_logo.png" />" alt="egovframework" /></h1>
            </div>  
            <!-- header end -->
			
			<!-- content start -->		
			<div data-role="content" data-theme="d">
				<!-- content-primary start -->
				<div class="content-primary">
					<div class="egov-tit">
                        <h1>Date / Time Picker <span class="sub">- Time Picker</span></h1>
					</div>
					
					<form method="post">
					<input type="hidden" name="xmlStatus">
					
                    <div class="gen-Group">
                        <div class="gen-grid">
                            <ul class="c-attr">
                                <li>
                                    <div class="gen-wid1"><strong>유형</strong></div>
                                    <div class="gen-wid2">
										<select name="etcOptionsMode1" id="timemode" data-role="none" class="gen-sele" onchange="javascript:modechange();">
											<option value=""  >Date</option>
	                                        <option value="mode:timebox"  selected>Time</option>								
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
										<select name="etcOptionsTimeFormat" id="timemode2" data-role="none" class="gen-sele" >
										    <option value="overrideTimeFormat:24">24시간</option>
										    <option value="overrideTimeOutput:%l:%M %p">12시간</option>
										    <option value="overrideTimeOutput:%l:%M %p">스크롤 형태</option>
										</select>
                                    </div>                              
                                </li>
                                <li>
                                    <div class="gen-wid1"><strong>헤더 색상</strong></div>
                                    <div class="gen-wid2">
										<select name="etcOptionsHeader" data-role="none" class="gen-sele">
	                                        <option value="">선택</option>
	                                        <option value="themeHeader:a">검정</option>
	                                        <option value="themeHeader:b">파랑</option>
	                                        <option value="themeHeader:c">회색</option>
	                                        <option value="themeHeader:d">흰색</option>
	                                        <option value="themeHeader:e">노랑</option>
	                                        <option value="themeHeader:f">빨강</option>
	                                        <option value="themeHeader:g">초록</option>      									
										</select>
                                    </div>                              
                                </li>

                                <li>
                                    <div class="gen-wid1"><strong>보조 색상</strong></div>
                                    <div class="gen-wid2">
	
										<select name="etcOptionsSub" id="etcOptionsSub" data-role="none" class="gen-sele">
	                                        <option value="">선택</option>
	                                        <option value="themeButton:a">검정</option>
	                                        <option value="themeButton:b">파랑</option>
	                                        <option value="themeButton:c">회색</option>
	                                        <option value="themeButton:d">흰색</option>
	                                        <option value="themeButton:e">노랑</option>
	                                        <option value="themeButton:f">빨강</option>
	                                        <option value="themeButton:g">초록</option>         									
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
					
					<p class="anno">※ 해당 컴포넌트는 가이드 소스에 대한 UX Component UI 를 iFrame방식으로 디스플레이시 
					브라우저 사파리 4.3에서는  지원하지 않고 있습니다. 사파리 5에서는 지원하고 있습니다.</p>  					
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