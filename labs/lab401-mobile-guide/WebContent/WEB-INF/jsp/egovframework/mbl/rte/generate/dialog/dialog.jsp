<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
  Class Name : dialog.jsp
  Description :  UX Dialog Generate code
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
        <title>Generate code - Check</title> 
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
		        
		<script type="text/javascript">

		 function changeTab(){
			 var f = document.forms[0];
             var prefix ="";
             if(f.compType.value =='Dialog') prefix = "dialog";
             if(f.compType.value =='ActionSheet') prefix = "actionsheet";
             if(f.compType.value =='Overlay') prefix = "overlay";
             if(f.compType.value =='Alert') prefix = "alert";
             if(f.compType.value =='Confirm') prefix = "confirm";
             if(f.compType.value =='Prompt') prefix = "prompt";
			 f.action = "<c:url value='/generate/dialog/"+prefix +".do'/>";
			 f.target="_self";
			 f.submit();
		 }
		 
		 function generate(status) {
             var f = document.forms[0];
             var prefix ="";
             if(f.compType.value =='Dialog') prefix = "dialog";
             if(f.compType.value =='ActionSheet') prefix = "actionsheet";
             if(f.compType.value =='Overlay') prefix = "overlay";
             if(f.compType.value =='Alert') prefix = "alert";
             if(f.compType.value =='Confirm') prefix = "confirm";
             if(f.compType.value =='Prompt') prefix = "prompt";
             f.action = "<c:url value='/generate/dialog/"+prefix +"Gen.do'/>";

			 f.xmlStatus.value = status;
			 f.target = "generateUI";
             
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
						<h1>Dialog <span class="sub">- Dialog</span></h1>
					</div>					
					<form method="post">
					<input type="hidden" name="xmlStatus">
					<div class="gen-Group">
						<div class="gen-grid">
							<ul class="c-attr">
								<li>
									<div class="gen-wid1"><strong>유형</strong></div>
                                	<div class="gen-wid2">
									    <select name="compType" id="compType" data-role="none" class="gen-sele" onchange="javascript:changeTab();">
							                <option value="Dialog" selected>Dialog</option>
											<option value="ActionSheet">ActionSheet</option>
											<option value="Overlay">Overlay</option>
											<option value="Alert" >Alert</option>
											<option value="Confirm">Confirm</option>
											<option value="Prompt">Prompt</option>						                
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
									<div class="gen-wid1"><strong>효과</strong></div>
                                	<div class="gen-wid2">
									    <select name="attrEffect" data-role="none" class="gen-sele">
							                <option value="">선택</option>
											<option value="attr:data-transition=slide" ${(xml.component["attrEffect"] == 'attr:data-transition=slide') ? 'selected="selected"' : ''}>slide</option>
											<option value="attr:data-transition=slideup"  ${(xml.component["attrEffect"] == 'attr:data-transition=slideup') ? 'selected="selected"' : ''}>slideup</option>
											<option value="attr:data-transition=slidedown"  ${(xml.component["attrEffect"] == 'attr:data-transition=slidedown') ? 'selected="selected"' : ''}>slidedown</option>
											<option value="attr:data-transition=pop"  ${(xml.component["attrEffect"] == 'attr:data-transition=pop') ? 'selected="selected"' : ''}>pop</option>
											<option value="attr:data-transition=fade"  ${(xml.component["attrEffect"] == 'attr:data-transition=fade') ? 'selected="selected"' : ''}>fade</option>
											<option value="attr:data-transition=flip"  ${(xml.component["attrEffect"] == 'attr:data-transition=flip') ? 'selected="selected"' : ''}>flip</option>
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
				 <h4>Copyright(c)2011 Ministry of Public Administration and Security.</h4>
			</div>
			<!-- footer end --> 
			
		</div>
		<!-- page end -->
	
    </body>
</html>