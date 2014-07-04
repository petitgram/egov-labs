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
<html lang="kr"> 
    <head>
        <title>Generate code - Confirm</title> 
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
		 
		 function generate(status){
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
                <h1><img src="<c:url value="/images/egovframework/mbl/rte/guide/h1_logo.png"/>" alt="egovframework" /></h1>
            </div>  
            <!-- header end -->
			
			<!-- content start -->		
			<div data-role="content" data-theme="d">
			
				<!-- content-primary start -->
				<div class="content-primary">
					<div class="egov-tit">
						<h1>Dialog <span class="sub">- Confirm</span></h1>
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
							                <option value="Dialog">Dialog</option>
											<option value="ActionSheet">ActionSheet</option>
											<option value="Overlay"  >Overlay</option>
											<option value="Alert" >Alert</option>
											<option value="Confirm" selected>Confirm</option>
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
								<div class="gen-wid1"><strong>색상</strong></div>
	                              	<div class="gen-wid2">
									<select name="etcTheme" data-role="none" class="gen-sele">
										<option value="a" ${(xml.component["etcTheme"] == 'a') ? 'selected="selected"' : ''}>검정</option>
										<option value="b" ${(xml.component["etcTheme"] == 'b') ? 'selected="selected"' : ''}>파랑</option>
										<option value="c" ${(xml.component["etcTheme"] == 'c') ? 'selected="selected"' : ''}>회색</option>
										<option value="d" ${(xml.component["etcTheme"] == 'd') ? 'selected="selected"' : ''}>흰색</option>
										<option value="e" ${(xml.component["etcTheme"] == 'e') ? 'selected="selected"' : ''}>노랑</option>
										<option value="f" ${(xml.component["etcTheme"] == 'f') ? 'selected="selected"' : ''}>빨강</option>
										<option value="g" ${(xml.component["etcTheme"] == 'g') ? 'selected="selected"' : ''}>초록</option>                      			                    
				                    </select>
			                    </div>
							</li>
							<li>
								<div class="gen-wid1"><strong>대제목</strong></div>
	                              	<div class="gen-wid2">
	                                  	<input type="text" name="etcHeader" value="<c:out value='${xml.component["etcHeader"]}' default="Confirm" />" data-role="none" class="gen-sele" />
								</div>
							</li>
							<li>
								<div class="gen-wid1"><strong>소제목</strong></div>
	                              	<div class="gen-wid2">
									<input type="text" name="etcContent"  value="<c:out value='${xml.component["etcContent"]}' default="Confirm" />" data-role="none" class="gen-sele" />
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