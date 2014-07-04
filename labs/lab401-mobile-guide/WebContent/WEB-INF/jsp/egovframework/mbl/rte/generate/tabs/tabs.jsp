<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
  Class Name : tabs.jsp
  Description :  UX Tabs Generate code
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
        <title>Generate code - Tabs</title> 
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
			 f.action="<c:url value="/generate/tabs/tabs.do"/>";
             f.target="_self";
             document.forms[0].submit();
         }

         function generate(status) {
             var f = document.forms[0];
             f.action="<c:url value="/generate/tabs/tabsGen.do"/>";
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

            <c:set var="xmlCompCount">${(xml.component["compCount"] != null) ? xml.component["compCount"] : 1}</c:set>
            <c:set var="compCount">${(param.compCount != null) ? param.compCount : xmlCompCount}</c:set>
			
			<!-- content start -->		
			<div data-role="content" data-theme="d">

				<!-- content-primary start -->
				<div class="content-primary">
					<div class="egov-tit">
						<h1>Tabs</h1>
					</div>					
					
					<form method="post">
					<input type="hidden" name="xmlStatus">
					
					<div class="gen-Group">
                        <div class="gen-grid">
                            <ul class="c-attr" id="groupInfo">
                                <li>
                                    <div class="gen-wid1"><strong>탭수</strong></div>
			                     	<div class="gen-wid2">
			                     		<select name="compCount" data-role="none" class="gen-sele" onChange="javascript:changeTab();">
	                                        <c:forEach var="x" begin="1" end="6">
	                                        <option value="${x}" ${(compCount == x) ? 'selected="selected"' : ''}>${x}</option>
	                                        </c:forEach>
	                                    </select>  
			                     	</div>                                   
                                </li>
                                <li>
                                	<div class="gen-wid1"><strong>색상</strong></div>
			                     	<div class="gen-wid2">
			                     		<select name="attrTheme" data-role="none" class="gen-sele">
		                                    <option value="">선택</option>
		                                    <option value="attr:data-theme=a" ${(xml.component["attrTheme"] == 'attr:data-theme=a') ? 'selected="selected"' : ''}>검정</option>
		                                    <option value="attr:data-theme=b" ${(xml.component["attrTheme"] == 'attr:data-theme=b') ? 'selected="selected"' : ''}>파랑</option>
		                                    <option value="attr:data-theme=c" ${(xml.component["attrTheme"] == 'attr:data-theme=c') ? 'selected="selected"' : ''}>회색</option>
		                                    <option value="attr:data-theme=d" ${(xml.component["attrTheme"] == 'attr:data-theme=d') ? 'selected="selected"' : ''}>흰색</option>
		                                    <option value="attr:data-theme=e" ${(xml.component["attrTheme"] == 'attr:data-theme=e') ? 'selected="selected"' : ''}>노랑</option>
		                                    <option value="attr:data-theme=f" ${(xml.component["attrTheme"] == 'attr:data-theme=f') ? 'selected="selected"' : ''}>빨강</option>
		                                    <option value="attr:data-theme=g" ${(xml.component["attrTheme"] == 'attr:data-theme=g') ? 'selected="selected"' : ''}>초록</option>        
		                                </select>  
			                     	</div>
                                </li>
                                <li>
                                	<div class="gen-wid1"><strong>형태</strong></div>
			                     	<div class="gen-wid2">
			                     		<input type="radio" name="cssShape" data-role="none" value="" ${(xml.component["cssShape"] == null || xml.component["cssShape"] == '') ? 'checked="checked"' : ''} /><label for="">Normal tab(radius: 0em)</label>
                                    	<input type="radio" name="cssShape" data-role="none" value="Y" ${(xml.component["cssShape"] == 'Y' ) ? 'checked="checked"' : ''} /><label for="">Round tab(radius: 0.250em)</label>     
			                     	</div>
                                </li>
                            </ul>        
                        </div>      
					</div>
					<br>
				
                    <!-- JQuery UI Tab -->
                    <div class="demo">
                        <div id="tabs">                     
                            <ul class="tabTitle" id="tabTitle">
                                <c:forEach var="compIndex" begin="1" end="${compCount}">
                                <li><a href="#tabs-${compIndex}" data-ajax="false">Tab ${compIndex}</a></li>
                                </c:forEach>
                            </ul>
                            <c:forEach var="compIndex" begin="1" end="${compCount}">
                            <div id="tabs-${compIndex}" class="gen-cont">
                                <div class="gen-grid">
                                    <ul class="c-attr">
                                        <li>
                                        	<div class="gen-wid1"><strong>탭명</strong></div>
					                     	<div class="gen-wid2">
					                     		<c:set var="compTextName">compText_${compIndex}</c:set>
                                            	<input type="text" name="compText_${compIndex}" value="<c:out value='${xml.component[compTextName]}' default="Tabs ${compIndex}" />" data-role="none" class="gen-sele" />
					                     	</div>
                                        </li>
                                        <li>
                                        	<div class="gen-wid1"><strong>Icon</strong></div>
					                     	<div class="gen-wid2">
					                     		<c:set var="compIconName">compIcon_${compIndex}</c:set>
	                                            <select name="compIcon_${compIndex}" data-role="none" class="gen-sele">
	                                                <option value="">선택</option>
	                                                <option value="attr:data-icon=arrow-l" ${(xml.component[compIconName] == 'attr:data-icon=arrow-l' ) ? 'selected="selected"' : ''}>arrow-left</option>
	                                                <option value="attr:data-icon=arrow-r" ${(xml.component[compIconName] == 'attr:data-icon=arrow-r' ) ? 'selected="selected"' : ''}>arrow-right</option>
	                                                <option value="attr:data-icon=arrow-u" ${(xml.component[compIconName] == 'attr:data-icon=arrow-u' ) ? 'selected="selected"' : ''}>arrow-up</option>
	                                                <option value="attr:data-icon=arrow-d" ${(xml.component[compIconName] == 'attr:data-icon=arrow-d' ) ? 'selected="selected"' : ''}>arrow-down</option>
	                                                <option value="attr:data-icon=delete" ${(xml.component[compIconName] == 'attr:data-icon=delete' ) ? 'selected="selected"' : ''}>delete</option>
	                                                <option value="attr:data-icon=plus" ${(xml.component[compIconName] == 'attr:data-icon=plus' ) ? 'selected="selected"' : ''}>plus</option>
	                                                <option value="attr:data-icon=minus" ${(xml.component[compIconName] == 'attr:data-icon=minus' ) ? 'selected="selected"' : ''}>minus</option>
	                                                <option value="attr:data-icon=check" ${(xml.component[compIconName] == 'attr:data-icon=check' ) ? 'selected="selected"' : ''}>check</option>
	                                                <option value="attr:data-icon=gear" ${(xml.component[compIconName] == 'attr:data-icon=gear' ) ? 'selected="selected"' : ''}>gear</option>
	                                                <option value="attr:data-icon=refresh" ${(xml.component[compIconName] == 'attr:data-icon=refresh' ) ? 'selected="selected"' : ''}>refresh</option>
	                                                <option value="attr:data-icon=forward" ${(xml.component[compIconName] == 'attr:data-icon=forward' ) ? 'selected="selected"' : ''}>forward</option>
	                                                <option value="attr:data-icon=back" ${(xml.component[compIconName] == 'attr:data-icon=back' ) ? 'selected="selected"' : ''}>back</option>
	                                                <option value="attr:data-icon=grid" ${(xml.component[compIconName] == 'attr:data-icon=grid' ) ? 'selected="selected"' : ''}>grid</option>
	                                                <option value="attr:data-icon=star" ${(xml.component[compIconName] == 'attr:data-icon=star' ) ? 'selected="selected"' : ''}>star</option>
	                                                <option value="attr:data-icon=alert" ${(xml.component[compIconName] == 'attr:data-icon=alert' ) ? 'selected="selected"' : ''}>alert</option>
	                                                <option value="attr:data-icon=info" ${(xml.component[compIconName] == 'attr:data-icon=info' ) ? 'selected="selected"' : ''}>info</option>
	                                                <option value="attr:data-icon=search" ${(xml.component[compIconName] == 'attr:data-icon=search' ) ? 'selected="selected"' : ''}>search</option>
	                                                <option value="attr:data-icon=home" ${(xml.component[compIconName] == 'attr:data-icon=home' ) ? 'selected="selected"' : ''}>home</option>
	                                                <option value="attr:data-icon=phone" ${(xml.component[compIconName] == 'attr:data-icon=phone' ) ? 'selected="selected"' : ''}>phone</option>
	                                                <option value="attr:data-icon=mail" ${(xml.component[compIconName] == 'attr:data-icon=mail' ) ? 'selected="selected"' : ''}>mail</option>
	                                            </select>
					                     	</div>
                                        </li>
                                        <li>
                                        	<div class="gen-wid1"><strong>활성화</strong></div>
					                     	<div class="gen-wid2">
					                     		<c:set var="compActiveName">compActive_${compIndex}</c:set>
                                            <input type="radio" name="compActive_${compIndex}" id="compActive_${compIndex}" data-role="none" value="" ${(xml.component[compActiveName] == null || xml.component[compActiveName] == '') ? 'checked="checked"' : ''}/><label for="">No</label>
                                            <input type="radio" name="compActive_${compIndex}" id="compActive_${compIndex}" data-role="none" value="css:ui-btn-active"  ${(xml.component[compActiveName] == 'css:ui-btn-active') ? 'checked="checked"' : ''} /><label for="">Yes</label>
					                     	</div>
                                        </li>
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
				 <h4>Copyright(c)2011 Ministry of Public Administration and Security.</h4>
			</div>
			<!-- footer end --> 
			
		</div>
		<!-- page end -->
	
    </body>
</html>