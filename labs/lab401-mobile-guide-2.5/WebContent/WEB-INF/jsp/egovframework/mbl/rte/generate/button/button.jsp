<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
  Class Name : button.jsp
  Description :  UX button Generate code
  Modification Information

      수정일         수정자           수정내용
    -------------    --------    ---------------------
     2011.08.31    황민희          최초 생성
     2012.08.09    박지민          1.1.1 버전에 맞춰 표준코드 Upgrade 및 기능 추가
 
    author   : 모바일 실행환경 개발팀 황민희
    since    : 2011.08.31	
--%>
<!DOCTYPE html> 
<html lang="kr">
    <head>
        <title>Generate code - Button</title> 
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
        <link rel="stylesheet"  href="<c:url value="/css/egovframework/mbl/rte/guide/guide.css" />">
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
		 function changeTab() {
			 var f = document.forms[0];
			 f.action="<c:url value="/generate/button/button.do"/>";
			 f.target="_self";
			 f.submit();
		 }

         function generate(status) {
             var f = document.forms[0];
             f.action="<c:url value="/generate/button/buttonGen.do"/>";
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
                <h1><img src="<c:url value="/images/egovframework/mbl/rte/guide/h1_logo.png"/>" alt="egovframework" /></h1>
            </div>  
            <!-- header end -->
			
			<!-- content start -->		
			<div data-role="content" data-theme="d">
			
				<!-- content-primary start -->
				<div class="content-primary">
					<div class="egov-tit">
						<h1>Button</h1>
					</div>					
					<form method="post">
					
					<input type="hidden" name="xmlStatus">
					
					<c:set var="xmlCompCount">${(xml.component["compCount"] != null) ? xml.component["compCount"] : 1}</c:set>
					<c:set var="compCount">${(param.compCount != null) ? param.compCount : xmlCompCount}</c:set>

					<div class="gen-Group">
						<div class="gen-grid">
                       		<ul class="c-attr" id="groupInfo">
                       			<li>
	                       			<div class="gen-wid1"><strong>버튼수</strong></div>
			                     	<div class="gen-wid2">
			                     		<select name="compCount" data-role="none" class="gen-sele" onChange="javascript:changeTab();">
		                                     <c:forEach var="x" begin="1" end="5">
		                                     <option value="${x}" ${(compCount == x) ? 'selected="selected"' : ''}>${x}</option>
		                                     </c:forEach>
		                                 </select>            
			                     	</div>
		                     	</li>
                       			<li>
	                       			<div class="gen-wid1"><strong>배치</strong></div>
			                     	<div class="gen-wid2">
			                     		<input type="radio" name="attrArrange" ${(compCount == 1) ? 'disabled="disabled"' : ''} data-role="none" value="" ${(xml.component["attrArrange"] == null || xml.component["attrArrange"] == '') ? 'checked="checked"' : ''}>Vertical group
			                            <input type="radio" name="attrArrange" ${(compCount == 1) ? 'disabled="disabled"' : ''} data-role="none" value="attr:data-type=horizontal" ${(xml.component["attrArrange"] == 'attr:data-type=horizontal') ? 'checked="checked"' : ''} >Horizontal group                              
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
								<li><a href="#tabs-${compIndex}" data-ajax="false">Button ${compIndex}</a></li>
								</c:forEach>
							</ul>
							<c:forEach var="compIndex" begin="1" end="${compCount}">
							<div id="tabs-${compIndex}" class="gen-cont">
								<div class="gen-grid">
			                        <ul class="c-attr">
	                                  	<li>
	                                  		<div class="gen-wid1"><strong>버튼명</strong></div>
	                                  		<div class="gen-wid2">
	                                 				<c:set var="compTextName">compText_${compIndex}</c:set>
	                                        		<input type="text" name="compText_${compIndex}" value="<c:out value='${xml.component[compTextName]}' default="Button ${compIndex}" />" data-role="none" class="gen-sele" />
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
	                                   	<c:if test="${compCount == 1}">
	                                    <li>
	                                         <div class="gen-wid1"><strong>형태</strong></div> 
	                                         <div class="gen-wid2">
	                                         	<input type="radio" name="compShape_1" data-role="none" value="" ${(xml.component["compShape_1"] == null || xml.component["compShape_1"] == '') ? 'checked="checked"' : ''} />둥근 형(radius: 1em)
                                                <input type="radio" name="compShape_1" data-role="none" value="attr:data-corners=false" ${(xml.component["compShape_1"] == 'attr:data-corners=false') ? 'checked="checked"' : ''} />사각형(radius: 0em)
	                                         </div>
	                                   	</li>
	                                   	<li>
	                                      	<div class="gen-wid1"><strong>넓이</strong></div>
	                                      	<div class="gen-wid2">
	                                      		<input type="radio" name="compWidth_1" data-role="none" value="" ${(xml.component["compWidth_1"] == null || xml.component["compWidth_1"] == '') ? 'checked="checked"' : ''} />화면에 맞게
	                                          	<input type="radio" name="compWidth_1" data-role="none" value="attr:data-inline=true" ${(xml.component["compWidth_1"] == 'attr:data-inline=true') ? 'checked="checked"' : ''} />텍스트에 맞게
	                                      	</div>
	                                    </li>
	                                    <li>
	                                      	<div class="gen-wid1"><strong>높이</strong></div>
	                                      	<div class="gen-wid2">
	                                      		<input type="radio" name="compHeight_1" data-role="none" value="" ${(xml.component["compHeight_1"] == null || xml.component["compHeight_1"] == '') ? 'checked="checked"' : ''} />Normal(39px)
	                                          	<input type="radio" name="compHeight_1" data-role="none" value="attr:data-mini=true" ${(xml.component["compHeight_1"] == 'attr:data-mini=true') ? 'checked="checked"' : ''} />Small (28px)
	                                      	</div>
	                                    </li>
	                                    <li>
	                                      	<div class="gen-wid1"><strong>아이콘</strong></div>
	                                      	<div class="gen-wid2">
	                                      		<input type="radio" name="compIcon_1" data-role="none" value="" ${(xml.component["compIcon_1"] == null || xml.component["compIcon_1"] == '') ? 'checked="checked"' : ''} />미포함
	                                          	<input type="radio" name="compIcon_1" data-role="none" value="attr:data-icon=gear" ${(xml.component["compIcon_1"] == 'attr:data-icon=gear') ? 'checked="checked"' : ''} />포함
	                                      	</div>
	                                    </li>
	                                    
	                                    <li>
	                                      	<div class="gen-wid1"><strong>아이콘 위치</strong></div>
	                                      	<div class="gen-wid2">
	                                      		<input type="radio" name="compIconpos_1" data-role="none" value="" ${(xml.component["compIconpos_1"] == null || xml.component["compIconpos_1"] == '') ? 'checked="checked"' : ''} />미지정
	                                          	<input type="radio" name="compIconpos_1" data-role="none" value="attr:data-iconpos=top" ${(xml.component["compIconpos_1"] == 'attr:data-iconpos=top') ? 'checked="checked"' : ''} />상
	                                          	<input type="radio" name="compIconpos_1" data-role="none" value="attr:data-iconpos=bottom" ${(xml.component["compIconpos_1"] == 'attr:data-iconpos=bottom') ? 'checked="checked"' : ''} />하
	                                          	<input type="radio" name="compIconpos_1" data-role="none" value="attr:data-iconpos=left" ${(xml.component["compIconpos_1"] == 'attr:data-iconpos=left') ? 'checked="checked"' : ''} />좌
	                                          	<input type="radio" name="compIconpos_1" data-role="none" value="attr:data-iconpos=right" ${(xml.component["compIconpos_1"] == 'attr:data-iconpos=right') ? 'checked="checked"' : ''} />우
	                                      	</div>
	                                    </li>
	                                    
	                                    <li>
	                                      	<div class="gen-wid1"><strong>그림자</strong></div>
	                                      	<div class="gen-wid2">
	                                      		<input type="radio" name="compShadow_1" data-role="none" value="" ${(xml.component["compShadow_1"] == null || xml.component["compShadow_1"] == '') ? 'checked="checked"' : ''} />포함
	                                          	<input type="radio" name="compShadow_1" data-role="none" value="attr:data-shadow=false" ${(xml.component["compShadow_1"] == 'attr:data-shadow=false') ? 'checked="checked"' : ''} />미포함
	                                      	</div>
	                                    </li>
	                                    </c:if>
	                                 </ul>
                                 </div>  
                        	</div>		
                        	</c:forEach>
                                                    
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