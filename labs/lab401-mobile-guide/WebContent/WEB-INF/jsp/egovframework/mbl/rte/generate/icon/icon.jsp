<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
  Class Name : icon.jsp
  Description :  UX Icon Generate code
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
        <title>Generate code - Icon</title> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        
        <!-- eGovFrame Common import -->
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
		<script type="text/javascript">
	 	function hideCompType() {
			 var f = document.forms[0];
		     $('#showComptype').hide();
		     f.attrArrange.value = '';				 
		 }
	 	function showCompType() {
			 var f = document.forms[0];
		     $('#showComptype').show();				 
		 }		 

        function generate(status) {
            var f = document.forms[0];
            f.action="<c:url value="/generate/icon/iconGen.do"/>";
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
						<h1>Icon</h1>
					</div>
					
					<form method="post">		
					<input type="hidden" name="xmlStatus">												
                    <div class="gen-Group">
                        <div class="gen-grid">
                            <ul class="c-attr">
                                <li> 
                                    <div class="gen-wid1"><strong>형태</strong></div>
                                    <div class="gen-wid2">
										<select name="attrIcon" data-role="none" class="gen-sele">
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
	                                    <input type="radio" name="attrShape" data-role="none" value="" ${(xml.component["attrShape"] == null || xml.component["attrShape"] == '') ? 'checked="checked"' : ''} onChange="javascript:showCompType();" /><label for="">버튼+아이콘</label>
	                                    <input type="radio" name="attrShape" data-role="none" value="attr:data-iconpos=notext" ${(xml.component["attrShape"] == 'attr:data-iconpos=notext' ) ? 'checked="checked"' : ''} onChange="javascript:hideCompType();"/><label for="">아이콘(Only)</label>                               
									</div>
								</li>
								<li id="showComptype">
									<div class="gen-wid1"><strong>정렬</strong></div>
									<div class="gen-wid2">
										<select name="attrArrange" id="attrArrange" data-role="none" class="gen-sele">
						                    <option value="">선택</option>
						                    <option value="attr:data-iconpos=left" ${(xml.component["attrArrange"] == 'attr:data-iconpos=left') ? 'selected="selected"' : ''}>왼쪽</option>
						                    <option value="attr:data-iconpos=right" ${(xml.component["attrArrange"] == 'attr:data-iconpos=right') ? 'selected="selected"' : ''}>오른쪽</option>
						                    <option value="attr:data-iconpos=top" ${(xml.component["attrArrange"] == 'attr:data-iconpos=top') ? 'selected="selected"' : ''}>위</option>
						                    <option value="attr:data-iconpos=bottom" ${(xml.component["attrArrange"] == 'attr:data-iconpos=bottom') ? 'selected="selected"' : ''}>아래</option>
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