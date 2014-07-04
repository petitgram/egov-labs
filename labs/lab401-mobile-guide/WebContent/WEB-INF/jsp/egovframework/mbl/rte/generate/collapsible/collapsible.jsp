<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
  Class Name : collapsible.jsp
  Description :  UX button Generate code
  Modification Information

      수정일         수정자           수정내용
    -------------    --------    ---------------------
     2011.08.31    황민희          최초 생성
 
    author   : 모바일 실행환경 개발팀 황민희
    since    : 2011.10.07
--%>
<!DOCTYPE html> 
<html> 
    <head>
        <title>Generate code - collapsible</title> 
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

		 
		 function changeTab() {
			 var f = document.forms[0];
			 f.action="<c:url value="/generate/collapsible/collapsible.do"/>";
			 f.target="_self";
			 document.forms[0].submit();
		 }

		 function generate(status) {
             var f = document.forms[0];
             f.action="<c:url value="/generate/collapsible/collapsibleGen.do"/>";
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
						<h1>Collapsible Block</h1>
					</div>					
					<form method="post">
					<input type="hidden" name="xmlStatus">
                    
                    <c:set var="xmlCompCount">${(xml.component["compCount"] != null) ? xml.component["compCount"] : 1}</c:set>
                    <c:set var="compCount">${(param.compCount != null) ? param.compCount : xmlCompCount}</c:set>
                    
					<div class="gen-Group">
					
                        <div class="gen-grid">
                            <ul class="c-attr" id="groupInfo">
                                <li>
	                                <div class="gen-wid1"><strong>Collapsible Block 수</strong></div>
			                     	<div class="gen-wid2">
			                     		<select name="compCount" data-role="none" class="gen-sele" onChange="javascript:changeTab();">
	                                        <c:forEach var="x" begin="1" end="5">
	                                             <option value="${x}" ${(compCount == x) ? 'selected="selected"' : ''}>${x}</option>
	                                        </c:forEach>
	                                    </select>            
			                     	</div>                               
                                </li>
                       			<li>
	                       			<div class="gen-wid1"><strong>그룹여부</strong></div>
			                     	<div class="gen-wid2">
			                     		<input type="radio" name="compGroup" id="compGroup" ${(compCount == 1) ? 'disabled="disabled"' : ''} data-role="none" value="" ${(xml.component["compGroup"] == null || xml.component["compGroup"] == '') ? 'checked="checked"' : ''}><label for="">No</label>
			                            <input type="radio" name="compGroup" id="compGroup" ${(compCount == 1) ? 'disabled="disabled"' : ''} data-role="none" value="compGroup" ${(xml.component["attrGroup"] == 'compGroup') ? 'checked="checked"' : ''} ><label for="">Yes</label>                              
			                     	</div>
			                    </li>                                
                            </ul>
                        </div>    						
					</div>
					
					<!-- JQuery UI Tab -->
					<div class="demo">
						<div id="tabs">						
							<ul class="tabTitle" id="tabTitle">
								<c:forEach var="compIndex" begin="1" end="${compCount}">
								<li><a href="#tabs-${compIndex}">Block ${compIndex}</a></li>
								</c:forEach>
							</ul>
							<c:forEach var="compIndex" begin="1" end="${compCount}">
							<div id="tabs-${compIndex}" class="gen-cont">
		                        <div class="gen-grid">
                                    <ul class="c-attr">
                                        <li>
                                        	<div class="gen-wid1"><strong>Collapsible Block 명</strong></div>
					                     	<div class="gen-wid2">
					                     		<c:set var="compTitleName">compTitle_${compIndex}</c:set>
                                            	<input type="text" name="compTitle_${compIndex}" value="<c:out value='${xml.component[compTitleName]}' default="Collapsible Block ${compIndex}" />" data-role="none" class="gen-sele" />           
					                     	</div>				                     	
                                        </li>
                                        <li>
                                        	<div class="gen-wid1"><strong>Collapsible Block 내용</strong></div>
					                     	<div class="gen-wid2">
					                     		<c:set var="compTextName">compText_${compIndex}</c:set>
                                            	<input type="text" name="compText_${compIndex}" value="<c:out value='${xml.component[compTextName]}' default="Collapsible Block Content ${compIndex}" />" data-role="none" class="gen-sele" />           
					                     	</div>				                     	
                                        </li>                                        
	                                    <li>
	                                      	<div class="gen-wid1"><strong>색상</strong></div>
	                                      	<div class="gen-wid2">
	                                      	   <c:set var="compColorName">compColor_${compIndex}</c:set>
	                                           <select name="compColor_${compIndex}" data-role="none" class="gen-sele">
		                                        <option value="">선택</option>
		                                        <option value="attr:data-theme=a" ${(xml.component[compColorName] == 'attr:data-theme=a') ? 'selected="selected"' : ''}>검정</option>
		                                        <option value="attr:data-theme=b" ${(xml.component[compColorName] == 'attr:data-theme=b') ? 'selected="selected"' : ''}>파랑</option>
		                                        <option value="attr:data-theme=c" ${(xml.component[compColorName] == 'attr:data-theme=c') ? 'selected="selected"' : ''}>회색</option>
		                                        <option value="attr:data-theme=d" ${(xml.component[compColorName] == 'attr:data-theme=d') ? 'selected="selected"' : ''}>흰색</option>
		                                        <option value="attr:data-theme=e" ${(xml.component[compColorName] == 'attr:data-theme=e') ? 'selected="selected"' : ''}>노랑</option>
		                                        <option value="attr:data-theme=f" ${(xml.component[compColorName] == 'attr:data-theme=f') ? 'selected="selected"' : ''}>빨강</option>
		                                        <option value="attr:data-theme=g" ${(xml.component[compColorName] == 'attr:data-theme=g') ? 'selected="selected"' : ''}>초록</option>        
	                                           </select>
	                                      	</div>
	                                    </li>
	                                    <li>
	                                         <div class="gen-wid1"><strong>펼침여부</strong></div> 
	                                         <div class="gen-wid2">
						                     	<c:set var="compCollapseName">compCollapse_${compIndex}</c:set>
	                                            <input type="radio" name="compCollapse_${compIndex}" id="compCollapse_${compIndex}" data-role="none" value="" ${(xml.component[compCollapseName] == null || xml.component[compCollapseName] == '') ? 'checked="checked"' : ''}/><label for="">No</label>
	                                            <input type="radio" name="compCollapse_${compIndex}" id="compCollapse_${compIndex}" data-role="none" value="attr:data-collapsed=false"  ${(xml.component[compCollapseName] == 'attr:data-collapsed=false') ? 'checked="checked"' : ''} /><label for="">Yes</label>
					                     	</div>
	                                   	</li>	                                                                            
                                    </ul>	
		                        </div>      
                        	</div>		
                        	</c:forEach>
                            
                                                    
						</div>
					</div>
						
                    <!-- btn  -->
                    <div class="gen-btn">    
                        <a href="javascript:generate();"><span>생성</span></a>
                        <a href="javascript:generate('makeXml');"><span>저장</span></a>
                        <a href="javascript:generate('deleteXml');"><span>삭제</span></a>
                    </div>
                    <!-- //btn  -->
					</form>
					
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
