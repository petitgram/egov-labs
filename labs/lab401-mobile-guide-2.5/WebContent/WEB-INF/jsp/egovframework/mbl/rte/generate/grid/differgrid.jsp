<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
  Class Name : grid.jsp
  Description :  UX Grid Generate code
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
        <title>Generate code - DifferGrid</title> 
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
		</script>
        
        <script>

        function validation(){
            var valid = true;
            var f = document.forms[0];
            for( var i = 1; i <= f.compCount.value; i++){
				var widName = "egov_wid_" + i;
				var text = document.getElementById(widName).value;
				var differtext = text.split(',');
				var sum = 0;
				for(var j=0; j < differtext.length; j++){
					sum +=parseInt(differtext[j]);
				}
				if(sum != 12){
	            	jAlert('Grid의 총합이 \n12가 되지 않습니다', '가이드프로그램', 'g');
					valid = false;
				}
            }
            
            return valid;
        };
        
		 function changeTab() {
			 var f = document.forms[0];
			 var prefix = f.compType.value;
			 if(prefix == "ui-grid"){
			 	f.action="<c:url value="/generate/grid/grid.do"/>";}
			 else{
				 f.action="<c:url value="/generate/grid/differgrid.do"/>";} 
			 f.target="_self";
			 f.submit();
		 }

		 function generate(status) {
             var f = document.forms[0];
			 var prefix = f.compType.value;
			 if(prefix == "ui-grid"){
			 	f.action="<c:url value="/generate/grid/gridGen.do"/>";
			 } else{
				 f.action="<c:url value="/generate/grid/differgridGen.do"/>";
			 } 
			 f.xmlStatus.value = status;
             f.target="generateUI";
             
			 if(validation() == false)
				 return ;
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
						<h1>Grid View <span class="sub">- 가변넓이</span></h1>
					</div>					
					
					<form method="post">
					<input type="hidden" name="xmlStatus">

					<c:set var="xmlCompCount">${(xml.component["compCount"] != null) ? xml.component["compCount"] : 1}</c:set>
					<c:set var="compCount">${(param.compCount != null) ? param.compCount : xmlCompCount}</c:set>
									
					<div class="gen-Group">			
						<div class="gen-grid">						
							<ul class="c-attr">
								<li>
									<div class="gen-wid1"><strong>형태</strong></div>
			                     	<div class="gen-wid2">
			                     		<select name ="compType" id="compType" data-role="none" class="gen-sele" onchange="javascript:changeTab();">
						                    <option value="ui-grid" >동일넓이</option>
											<option value="egov-grid"  selected>가변넓이</option>
										</select>          
			                     	</div>
								</li>
								<li>
                                    <div class="gen-wid1"><strong>세로 수</strong></div>
			                     	<div class="gen-wid2">
			                     		 <select name="compCount" data-role="none" class="gen-sele" onChange="javascript:changeTab();">
	                                        <c:forEach var="x" begin="1" end="5">
	                                        <option value="${x}" ${(compCount == x) ? 'selected="selected"' : ''}>${x}</option>
	                                        </c:forEach>
	                                    </select>        
			                     	</div>      
								</li>
							</ul>							
						</div>
					</div>

					<div class="demo">
						<div id="tabs">						
							<ul class="tabTitle" id="tabTitle">
								<c:forEach var="compIndex" begin="1" end="${compCount}">
								<li><a href="#tabs-${compIndex}" data-ajax="false">Grid ${compIndex}</a></li>
								</c:forEach>
							</ul>
							<c:forEach var="compIndex" begin="1" end="${compCount}">
							<div id="tabs-${compIndex}" class="gen-cont">
		                        <div class="gen-grid">
                                    <ul class="c-attr">
                                    	<li>                           
		                                	<div class="gen-wid1"><strong>가로 수</strong></div>
					                     	<div class="gen-wid2">
												 <c:set var="compTextName">egov_wid_${compIndex}</c:set>					                     	
					                     		 <input type="text" name="egov_wid_${compIndex}" id="egov_wid_${compIndex}" value="<c:out value='${xml.component[compTextName]}' default="1,2,9" />" data-role="none" class="gen-sele" />       
					                     	</div> 
		                                </li>
		                            </ul>
		                        </div>   
                        	</div>		 
                        	</c:forEach>
						</div>
					</div>
					<p class="anno">※ ',' 구분자를 사용하여 합이 12가 되도록 입력 합니다.(예 2,4,6)</p>
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