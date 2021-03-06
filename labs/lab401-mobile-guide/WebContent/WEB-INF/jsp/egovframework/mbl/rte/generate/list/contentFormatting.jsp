<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
  Class Name :contentFormatting.jsp
  Description :  list generate code
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
        <title>Generate code - List</title> 
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
        
        <script language='JavaScript' type='text/javascript'>

        function changeType(componentId) {
           location.href = "<c:url value='/generate/list/" + componentId + ".do'/>"; 
        }

        function changeTab() {
            var f = document.forms[0];
            f.action="<c:url value="/generate/list/contentFormatting.do"/>";
            f.target="_self";
            document.forms[0].submit();
        }

        function generate(status) {
             var f = document.forms[0];
             f.action="<c:url value="/generate/list/contentFormattingGen.do"/>";
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
						<h1>Table / List View <span class="sub">- Content Formatting</span></h1>
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
	                                        <option value="listIcon">List ICon</option>
	                                        <option value="contentFormatting" selected="selected">Content Formatting</option>
	                                        <option value="searchFilterBar">Search Filter Bar</option>
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
                                	<div class="gen-wid1"><strong>모양</strong></div>
                                	<div class="gen-wid2">
	                                    <input type="radio" name="attrShape" id="attrShape" data-role="none" value="" ${(xml.component["attrShape"] == null || xml.component["attrShape"] == '') ? 'checked="checked"' : ''} /><label for="">사각형</label>
	                                    <input type="radio" name="attrShape" id="attrShape" data-role="none" value="attr:data-inset=true" ${(xml.component["attrShape"] == 'attr:data-inset=true') ? 'checked="checked"' : ''} /><label for="">둥근형</label>                              
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
                                        	<div class="gen-wid1"><strong>대제목</strong></div>
                                			<div class="gen-wid2">
	                                            <c:set var="compTitleName">compTitle_${compIndex}</c:set>
	                                            <input type="text" name="compTitle_${compIndex}" value="<c:out value='${xml.component[compTitleName]}' default="title ${compIndex}" />" data-role="none" class="gen-sele" />
                                        	</div>
                                        </li>
                                        <li>
                                        	<div class="gen-wid1"><strong>소제목</strong></div>
                                			<div class="gen-wid2">
	                                            <c:set var="compSubTitleName">compSubTitle_${compIndex}</c:set>
	                                            <input type="text" name="compSubTitle_${compIndex}" value="<c:out value='${xml.component[compSubTitleName]}' default="subTitle ${compIndex}" />" data-role="none" class="gen-sele" />                                        
                                        	</div>
                                        </li>
                                        <li>
                                        	<div class="gen-wid1"><strong>내용</strong></div>
                                			<div class="gen-wid2">
	                                            <c:set var="compContentName">compContent_${compIndex}</c:set>
	                                            <input type="text" name="compContent_${compIndex}" value="<c:out value='${xml.component[compContentName]}' default="content ${compIndex}" />" data-role="none" class="gen-sele" />                                        
                                        	</div>
                                        </li>
                                        <li>
                                        	<div class="gen-wid1"><strong>각주</strong></div>
                                			<div class="gen-wid2">
	                                            <c:set var="compCommentName">compComment_${compIndex}</c:set>
	                                            <input type="text" name="compComment_${compIndex}" value="<c:out value='${xml.component[compCommentName]}' default="comment ${compIndex}" />" data-role="none" class="gen-sele" />                                        
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