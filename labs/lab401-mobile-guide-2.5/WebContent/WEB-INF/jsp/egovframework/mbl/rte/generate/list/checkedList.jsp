<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
  Class Name : changeModeList.jsp
  Description :  list generate code
  Modification Information

      수정일         수정자           수정내용
    -------------    --------    ---------------------
     2012.08.27    박지민          최초 생성
 
    author   : 모바일 실행환경 개발팀 황민희
    since    : 2011.08.31
--%>
<!DOCTYPE html> 
<html lang="kr"> 
    <head>
        <title>Generate code - List</title> 
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

        function changeType(componentId) {
           location.href = "<c:url value='/generate/list/" + componentId + ".do'/>"; 
        }

        function changeTab() {
            var f = document.forms[0];
            f.action="<c:url value="/generate/list/checkedList.do"/>";
            f.target="_self";
            document.forms[0].submit();
        }

        function generate(status) {
             var f = document.forms[0];
             f.action="<c:url value="/generate/list/checkedListGen.do"/>";
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
						<h1>Table / List View <span class="sub">- Checked List</span></h1>
					</div>
					
					<form method="post">			
					<input type="hidden" name="xmlStatus">		

                    <c:set var="xmlCompCount">${(xml.component["compCount"] != null) ? xml.component["compCount"] : 5}</c:set>
                    <c:set var="compCount">${(param.compCount != null) ? param.compCount : xmlCompCount}</c:set>

                    <div class="gen-Group">
                        <div class="gen-grid">
                            <ul class="c-attr">
                                <li>
                                	<div class="gen-wid1"><strong>기능</strong></div>
                                	<div class="gen-wid2">
	                                    <select name="compType" data-role="none" class="gen-sele" onChange="javascript:changeType(this.value);">
	                                        <option value="list">List</option>
	                                        <option value="nestedList">Nested List</option>
	                                        <option value="numberedList">Numbered List</option>
	                                        <option value="splitButton">Split Button</option>
	                                        <option value="listDivider">List Divider</option>
	                                        <option value="countBubble">Count Bubble</option>
	                                        <option value="thumbnail">Thumbnail</option>
	                                        <option value="listIcon">List Icon</option>
	                                        <option value="contentFormatting">Content Formatting</option>
	                                        <option value="searchFilterBar">Search Filter Bar</option>
	                                        <option value="changeModeList">Change Mode List</option>
	                                        <option value="checkedList" selected="selected">Checked List</option>
	                                    </select>
                                    </div>                                 
                                </li>
                                <li>
                                	<div class="gen-wid1"><strong>리스트 수</strong></div>
                                	<div class="gen-wid2">
	                                    <select name="compCount" data-role="none" class="gen-sele" onChange="javascript:changeTab();">
	                                        <c:forEach var="x" begin="1" end="5">
	                                        <option value="${x}" ${(compCount == x) ? 'selected="selected"' : ''}>${x}</option>
	                                        </c:forEach>
	                                    </select>
                                    </div>                           
                                </li>
                                
                                <li>
                                	<div class="gen-wid1"><strong>색상</strong></div>
                                	<div class="gen-wid2">
	                                    <select name="attrTheme" data-role="none" class="gen-sele">
	                                        <option value="" selected>선택</option>
	                                        <option value="data-theme=*a*">검정</option>
	                                        <option value="data-theme=*b*">파랑</option>
	                                        <option value="data-theme=*c*">회색</option>
	                                        <option value="data-theme=*d*">흰색</option>
	                                        <option value="data-theme=*e*">노랑</option>
	                                        <option value="data-theme=*f*">빨강</option>
	                                        <option value="data-theme=*g*">초록</option>        
	                                    </select>
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
                                <li><a href="#tabs-${compIndex}" data-ajax="false">List ${compIndex}</a></li>
                                </c:forEach>
                            </ul>
                            <c:forEach var="compIndex" begin="1" end="${compCount}">
                            <div id="tabs-${compIndex}" class="gen-cont">
                                <div class="gen-grid">
                                    <ul class="c-attr">
                                    	<li>
                                        	<div class="gen-wid1"><strong>내용</strong></div>
                                			<div class="gen-wid2">
	                                            <c:set var="compText">compText_${compIndex}</c:set>
	                                            <input type="text" name="compText_${compIndex}" value="List ${compIndex}" data-role="none" class="gen-sele" />
                                        	</div>
                                        </li>
                                        <li>
                                        	<div class="gen-wid1"><strong>아이콘</strong></div>
                                			<div class="gen-wid2">
	                                            <c:set var="attrIcon">attrIcon_${compIndex}</c:set>
	                                            <select name="attrIcon_${compIndex}" data-role="none" class="gen-sele" >
	                                            	<option value="" ${(xml.component["attrIcon"] == '' || xml.component["attrIcon"] == null) ? 'selected="selected"' : ''}>선택</option>
		                                            <option value="attr:data-icon=arrow-l" ${(xml.component["attrIcon"] == 'attr:data-icon=arrow-l' ) ? 'selected="selected"' : ''}>arrow-left</option>
			                                        <option value="attr:data-icon=arrow-r" ${(xml.component["attrIcon"] == 'attr:data-icon=arrow-r' ) ? 'selected="selected"' : ''}>arrow-right</option>
			                                        <option value="attr:data-icon=arrow-u" ${(xml.component["attrIcon"] == 'attr:data-icon=arrow-u' ) ? 'selected="selected"' : ''}>arrow-up</option>
			                                        <option value="attr:data-icon=arrow-d" ${(xml.component["attrIcon"] == 'attr:data-icon=arrow-d' ) ? 'selected="selected"' : ''}>arrow-down</option>
			                                        <option value="attr:data-icon=delete" ${(xml.component["attrIcon"] == 'attr:data-icon=delete' ) ? 'selected="selected"' : ''}>delete</option>
			                                        <option value="attr:data-icon=plus" ${(xml.component["attrIcon"] == 'attr:data-icon=plus' ) ? 'selected="selected"' : ''}>plus</option>
			                                        <option value="attr:data-icon=minus" ${(xml.component["attrIcon"] == 'attr:data-icon=minus' ) ? 'selected="selected"' : ''}>minus</option>
			                                        <option value="attr:data-icon=check" ${(xml.component["attrIcon"] == 'attr:data-icon=check' ) ? 'selected="selected"' : ''}>check</option>
			                                        <option value="attr:data-icon=gear" ${(xml.component["attrIcon"] == 'attr:data-icon=gear' ) ? 'selected="selected"' : ''}>gear</option>
			                                        <option value="attr:data-icon=refresh" ${(xml.component["attrIcon"] == 'attr:data-icon=refresh' ) ? 'selected="selected"' : ''}>refresh</option>
			                                        <option value="attr:data-icon=forward" ${(xml.component["attrIcon"] == 'attr:data-icon=forward' ) ? 'selected="selected"' : ''}>forward</option>
			                                        <option value="attr:data-icon=back" ${(xml.component["attrIcon"] == 'attr:data-icon=back' ) ? 'selected="selected"' : ''}>back</option>
			                                        <option value="attr:data-icon=grid" ${(xml.component["attrIcon"] == 'attr:data-icon=grid' ) ? 'selected="selected"' : ''}>grid</option>
			                                        <option value="attr:data-icon=star" ${(xml.component["attrIcon"] == 'attr:data-icon=star' ) ? 'selected="selected"' : ''}>star</option>
			                                        <option value="attr:data-icon=alert" ${(xml.component["attrIcon"] == 'attr:data-icon=alert' ) ? 'selected="selected"' : ''}>alert</option>
			                                        <option value="attr:data-icon=info" ${(xml.component["attrIcon"] == 'attr:data-icon=info' ) ? 'selected="selected"' : ''}>info</option>
			                                        <option value="attr:data-icon=search" ${(xml.component["attrIcon"] == 'attr:data-icon=search' ) ? 'selected="selected"' : ''}>search</option>
			                                        <option value="attr:data-icon=home" ${(xml.component["attrIcon"] == 'attr:data-icon=home' ) ? 'selected="selected"' : ''}>home</option>
			                                        <option value="attr:data-icon=phone" ${(xml.component["attrIcon"] == 'attr:data-icon=phone' ) ? 'selected="selected"' : ''}>phone</option>
			                                        <option value="attr:data-icon=mail" ${(xml.component["attrIcon"] == 'attr:data-icon=mail' ) ? 'selected="selected"' : ''}>mail</option>
			                                        <option value="attr:data-icon=gps" ${(xml.component["attrIcon"] == 'attr:data-icon=gps' ) ? 'selected="selected"' : ''}>gps</option>
			                                        <option value="attr:data-icon=audio" ${(xml.component["attrIcon"] == 'attr:data-icon=audio' ) ? 'selected="selected"' : ''}>audio</option>
			                                        <option value="attr:data-icon=camera" ${(xml.component["attrIcon"] == 'attr:data-icon=camera' ) ? 'selected="selected"' : ''}>camera</option>
			                                        <option value="attr:data-icon=file" ${(xml.component["attrIcon"] == 'attr:data-icon=file' ) ? 'selected="selected"' : ''}>file</option>
			                                        <option value="attr:data-icon=mic" ${(xml.component["attrIcon"] == 'attr:data-icon=mic' ) ? 'selected="selected"' : ''}>mic</option>
			                                        <option value="attr:data-icon=explorer" ${(xml.component["attrIcon"] == 'attr:data-icon=explorer' ) ? 'selected="selected"' : ''}>explorer</option>
	                                            </select>
                                        	</div>
                                        </li>
                                        <li>
                                        	<div class="gen-wid1"><strong>아이콘 위치</strong></div>
                                			<div class="gen-wid2">
	                                            <c:set var="iconpos">iconpos_${compIndex}</c:set>
	                                            <select name="iconpos_${compIndex}" data-role="none" class="gen-sele" >
	                                            	<option value="" selected >선택</option>
		                                            <option value="data-iconpos=*left*" >왼쪽</option>
		                                        	<option value="data-iconpos=*right*" >오른쪽</option>
	                                            </select>                                        
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
				 <h4>Copyright(c)2012 Ministry of Public Administration and Security.</h4>
			</div>
			<!-- footer end --> 
			
		</div>
		<!-- page end -->
	
    </body>
</html>