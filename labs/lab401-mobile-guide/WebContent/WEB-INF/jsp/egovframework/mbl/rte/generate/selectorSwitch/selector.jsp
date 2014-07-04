<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
  Class Name : selector.jsp
  Description :  UX Selector / Switch Generate code
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
        <title>Generate code - selector</title> 
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

        function changeGroup() {
            if($('#isGroup').attr('')) {
               $('#groupCount').hide();
            } else {
                $('#groupCount').show();
               $('#compCount').val('1');
               changeTab();
            }
        }   
           	 
		 function changeTab() {
			 var f = document.forms[0];
			 f.action="<c:url value="/generate/selectorSwitch/selector.do"/>";
			 f.changeStatus.value = "change";
			 f.target="_self";
			 f.submit();
		 }

         function generateSelect() {
             if($(":input:radio[name=attrEffect]:checked").val() == ''){
            	 $('#multiple').hide();
            	 document.form.mutiple.value="";}
             else{
            	 $('#multiple').show();}
         }

         function changeType(componentId) {
             if(componentId =='selector'){
             	location.href ="<c:url value="/generate/selectorSwitch/selector.do"/>";}
             else{
              	location.href ="<c:url value="/generate/selectorSwitch/switch.do"/>";
             }
         }	   

         function addOptions(optionsIndex) {

        	 $options = $('#options_' + optionsIndex);
        	 var nameIndex = $options.find('li').length;
        	 if (nameIndex > 5) {
            	 jAlert('더이상 추가 할 수 없습니다.', '가이드 프로그램', 'g');
            	 return;
        	 }
        	 var optionsHtml = '';
             optionsHtml += '<li>';
             optionsHtml += '  <div class="c-wid3"><input type="text" name="compArrayOptionName_' + optionsIndex + '" value="option' + optionsIndex + '-' + nameIndex + '" maxlength="10" size="5" data-role="none" class="gen-sele1"/></div>';
             optionsHtml += '  <div class="c-wid4">';
             optionsHtml += '    <select name="compArrayOptionActive_' + optionsIndex + '" data-role="none" class="gen-sele">';
             optionsHtml += '      <option value="">활성화</option>';
             optionsHtml += '      <option value="attr:disabled=disabled">비활성화</option>';
             optionsHtml += '    </select>';
             optionsHtml += '  </div>';
             optionsHtml += '</li>';                                   
             
             $(optionsHtml).appendTo($options);
         }

         function removeOptions(optionsIndex) {

             $options = $('#options_' + optionsIndex);
             var nameIndex = $options.find('li').length;
             
             if (nameIndex < 3) {
            	 jAlert('더이상 삭제 할 수 없습니다.', '가이드 프로그램', 'g');
                 return;
             }             
        	 $options = $('#options_' + optionsIndex);
        	 $options.find('li:last').remove();
         }

         function generate(status) {
             var f = document.forms[0];
             f.action="<c:url value="/generate/selectorSwitch/selectorGen.do"/>";
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
         

         if (${fn:length(xml.component) != 0} && '${param.changeStatus}' != 'change') {
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
						<h1>Selector / Switch <span class="sub">- Selector</span></h1>
					</div>
					
					<form method="post">
					
					<input type="hidden" name="xmlStatus">
					<input type="hidden" name="changeStatus">

                    <c:set var="xmlCompCount">${(xml.component["compCount"] != null) ? xml.component["compCount"] : 1}</c:set>
                    <c:set var="compCount">${(param.compCount != null) ? param.compCount : xmlCompCount}</c:set>
                                    
                    <div class="gen-Group">
                        <div class="gen-grid">
                            <ul class="c-attr">
                                <li>
                                    <div class="gen-wid1"><strong>유형</strong></div>
                                    <div class="gen-wid2">
										<select name="compType" data-role="none" class="gen-sele"  onchange="javascript:changeType(this.value);">
											<option value="selector">Selector</option>
											<option value="switch">Switch</option>
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
	                                    <c:set var="isGroup">${(param.changeStatus == 'change') ? param.isGroup : xml.component["isGroup"]}</c:set>
	                                    <input type="radio" name="isGroup" id="isGroup" onchange="javascript:changeGroup();" value="" data-role="none"  ${(isGroup == null || isGroup == '') ? 'checked="checked"' : ''}><label for="">비그룹</label>
	                                    <input type="radio" name="isGroup" id="isGroup" onchange="javascript:changeGroup();" value="Y" data-role="none" ${(isGroup == 'Y') ? 'checked="checked"' : ''} ><label for="">그룹</label>                                                                
	                                </div>
	                            </li>
	                            <c:if test="${isGroup == 'Y'}">
	                            <li>
	                                <div class="gen-wid1"><strong>그룹 수</strong></div>
	                                <div class="gen-wid2">
	                                    <select name="compCount" id="compCount" data-role="none" class="gen-sele" onChange="javascript:changeTab();">
	                                        <c:forEach var="x" begin="1" end="5">
	                                        <option value="${x}" ${(compCount == x) ? 'selected="selected"' : ''}>${x}</option>
	                                        </c:forEach>
	                                    </select>                                   
	                                </div>
	                            </li>
	                            </c:if>	                            
                                <li>
                                    <div class="gen-wid1"><strong>색상</strong></div>
                                    <div class="gen-wid2">
									    <c:set var="attrTheme">${(param.changeStatus == 'change') ? param.attrTheme : xml.component["attrTheme"]}</c:set>
	                                    <select name="attrTheme" data-role="none" class="gen-sele">
		                                   <option value="">선택</option>
	                                       <option value="attr:data-theme=a" ${(attrTheme == 'attr:data-theme=a') ? 'selected="selected"' : ''}>검정</option>
	                                       <option value="attr:data-theme=b" ${(attrTheme == 'attr:data-theme=b') ? 'selected="selected"' : ''}>파랑</option>
	                                       <option value="attr:data-theme=c" ${(attrTheme == 'attr:data-theme=c') ? 'selected="selected"' : ''}>회색</option>
	                                       <option value="attr:data-theme=d" ${(attrTheme == 'attr:data-theme=d') ? 'selected="selected"' : ''}>흰색</option>
	                                       <option value="attr:data-theme=e" ${(attrTheme == 'attr:data-theme=e') ? 'selected="selected"' : ''}>노랑</option>
	                                       <option value="attr:data-theme=f" ${(attrTheme == 'attr:data-theme=f') ? 'selected="selected"' : ''}>빨강</option>
	                                       <option value="attr:data-theme=g" ${(attrTheme == 'attr:data-theme=g') ? 'selected="selected"' : ''}>초록</option>	                                     
	                                    </select>   
									</div>
								</li>
                                <li>
                                    <div class="gen-wid1"><strong>모양</strong></div>
                                    <div class="gen-wid2">
	                                    <input type="radio" name="attrCompShape" id="attrCompShape" data-role="none" value="" ${(xml.component["attrCompShape"] == null || xml.component["attrCompShape"] == '') ? 'checked="checked"' : ''} /><label for="">둥근 형(radius: 1em)</label>
	                                    <input type="radio" name="attrCompShape" id="attrCompShape" data-role="none" value="attr:data-corners=false" ${(xml.component["attrCompShape"] == 'attr:data-corners=false') ? 'checked="checked"' : ''} /><label for="">사각형(radius: 0em)</label>                                                                
                                    </div>
                                </li>
                                <li>
                                    <div class="gen-wid1"><strong>아이콘</strong></div>
                                    <div class="gen-wid2">
                                        <select name="attrIcon" data-role="none" class="gen-sele">
                                            <option value="">선택</option>
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
                                    <div class="gen-wid1"><strong>아이콘 정렬</strong></div>
                                    <div class="gen-wid2">
                                        <select name="attrArrange" id="attrArrange" data-role="none" class="gen-sele">
                                            <option value="">선택</option>
                                            <option value="attr:data-iconpos=left" ${(xml.component["attrArrange"] == 'attr:data-iconpos=left') ? 'selected="selected"' : ''}>왼쪽</option>
                                            <option value="attr:data-iconpos=right" ${(xml.component["attrArrange"] == 'attr:data-iconpos=right') ? 'selected="selected"' : ''}>오른쪽</option>
                                        </select>                                                                
                                    </div>
                                </li>
                                <li>
                                    <div class="gen-wid1"><strong>넓이</strong></div>
                                    <div class="gen-wid2">
	                                    <input type="radio" name="attrDataInline" id="attrDataInline" data-role="none" value="" ${(xml.component["attrDataInline"] == null || xml.component["attrDataInline"] == '') ? 'checked="checked"' : ''} /><label for="">화면에 맞게</label>
	                                    <input type="radio" name="attrDataInline" id="attrDataInline" data-role="none" value="attr:data-inline=true" ${(xml.component["attrDataInline"] == 'attr:data-inline=true') ? 'checked="checked"' : ''} /><label for="">텍스트에 맞게</label>                                                                
                                    </div>
                                </li>
                                <li>
                                    <div class="gen-wid1"><strong>Shadow 효과</strong></div>
                                    <div class="gen-wid2">
                                        <input type="radio" name="attrDataShadow" id="attrDataShadow" data-role="none" value="" ${(xml.component["attrDataShadow"] == null || xml.component["attrDataShadow"] == '') ? 'checked="checked"' : ''} /><label for="">Shadow 적용</label>
                                        <input type="radio" name="attrDataShadow" id="attrDataShadow" data-role="none" value="attr:data-shadow=false" ${(xml.component["attrDataShadow"] == 'attr:data-shadow=false') ? 'checked="checked"' : ''} /><label for="">Shadow 제거</label>                                                                
                                    </div>
                                </li>                                                                                             								
                            
								<li>
									<div class="gen-wid1"><strong>효과</strong></div>
									<div class="gen-wid2">
									    <c:set var="attrEffect">${(param.changeStatus == 'change') ? param.attrEffect : xml.component["attrEffect"]}</c:set>
								     	<input type="radio" name="attrEffect" id="attrEffect" value="" data-role="none" ${(attrEffect == null || attrEffect == '') ? 'checked="checked"' : ''} onchange="javascript:generateSelect();"/><label for="">리스트</label> 
										<input type="radio" name="attrEffect" id="attrEffect" value="attr:data-native-menu=false" data-role="none" ${(attrEffect == 'attr:data-native-menu=false') ? 'checked="checked"' : ''} onchange="javascript:generateSelect();"/><label for="">팝업</label>
									</div>
								</li>                            							
								<li id="multiple" ${(attrEffect != 'attr:data-native-menu=false') ? 'style="display:none"' : ''}>
									<div class="gen-wid1"><strong>기능</strong></div>
									<div class="gen-wid2">
									    <c:set var="attrFunction">${(param.changeStatus == 'change') ? param.attrFunction : xml.component["attrFunction"]}</c:set>
										<input type="radio" name="attrFunction" value="" data-role="none" ${(attrFunction == null || attrFunction == '') ? 'checked="checked"' : ''}/><label for="">단일선택</label> 
										<input type="radio" name="attrFunction" value="attr:multiple=multiple" data-role="none" ${(attrFunction == 'attr:multiple=multiple') ? 'checked="checked"' : ''}/><label for="">다중선택</label>
									</div>
								</li>  	
							</ul>							  							                            																															
						</div>
					</div>
					
					<div class="demo">
						<div id="tabs">						
							<ul class="tabTitle" id="tabTitle">
								<c:forEach var="compIndex" begin="1" end="${compCount}">
								<li><a href="#tabs-${compIndex}" data-ajax="false">options ${compIndex}</a></li>
								</c:forEach>
							</ul>
							<c:forEach var="compIndex" begin="1" end="${compCount}">
							<div id="tabs-${compIndex}" class="gen-cont">
							    <c:if test="${isGroup == 'Y'}">
							    
							    <c:set var="compOptionGroupTitleName">compOptionGroupTitle_${compIndex}</c:set>
							    <c:set var="compOptionGroupTitleValue">${(param.changeStatus == 'change') ? 'optionGroup ${compIndex}' : xml.component[compOptionGroupTitleName]}</c:set>
                                <div class="gen-grid">
                                    <ul class="c-attr">
                                        <li>
                                            <div class="gen-wid1"><strong>그룹명</strong></div>
                                            <div class="gen-wid2">
                                                <input type="text" name="compOptionGroupTitle_${compIndex}" value="optionGroup ${compIndex}" maxlength="10" size="5" data-role="none" class="gen-sele"/>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
 		                        </c:if>
 		                        
		                        <div class="c-grouping">
		                        	<ul class="c-groList" id="options_${compIndex}">
		                        		<li>
		                        			<div class="c-wid1"><strong>옵션명</strong></div>
		                        			<div class="c-wid2"><strong>활성화</strong></div>
		                        		</li>
		                        		<c:if test='${param.changeStatus == "change" || fn:length(xml.component) == 0}'>
		                        		<li>
		                        		    <div class="c-wid3">
		                        		    	<input type="text" name="compArrayOptionName_${compIndex}" value="option${compIndex}-1"  size="5" data-role="none" class="gen-sele1"/>
		                        		    </div>
		                        		    <div class="c-wid4">
		                        		    	<select name="compArrayOptionActive_${compIndex}" data-role="none" class="gen-sele">
											        <option value="">활성화</option>
											        <option value="attr:disabled=disabled">비활성화</option>
											    </select>
		                        		    </div>
										</li>
										</c:if>
                                        
                                        <c:if test='${param.changeStatus != "change" && fn:length(xml.component) != 0}'>
                                        <c:set var="compArrayOptionName">compArrayOptionName_${compIndex}</c:set>
                                        <c:set var="compArrayOptionActiveName">compArrayOptionActive_${compIndex}</c:set>
                                        <c:forEach var="compOptionIndex" begin="1" end='${fn:length(xml.components[compArrayOptionName])}'>
                                        <li>
                                        	<div class="c-wid3">
                                        		<input type="text" name="compArrayOptionName_${compIndex}" value="${xml.components[compArrayOptionName][compOptionIndex-1]}"  size="5" data-role="none" class="gen-sele1"/>
                                        	</div>
                                        	<div class="c-wid4">
                                        		<select name="compArrayOptionActive_${compIndex}" data-role="none" class="gen-sele">
                                                    <option value="">활성화</option>
                                                    <option value="attr:disabled=disabled" ${(xml.components[compArrayOptionActiveName][compOptionIndex-1] == 'attr:disabled=disabled') ? 'selected="selected"' : ''}>비활성화</option>
                                                </select>
                                        	</div>        
		                        		</li>
		                        		</c:forEach>
		                        		</c:if>
		                        	</ul>
		                        	<div class="c-groupBtn">
		                        		<a href="javascript:addOptions('${compIndex}');"><span class="btAdd">+ 추가</span></a>
		                        		<a href="javascript:removeOptions('${compIndex}');"><span class="btDel">x 삭제</span></a>
		                        	</div>
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
					
					<p class="anno">※ 해당 컴포넌트는 iOS4에서 일부 동작이 정상작동되지 않으므로 iOS5에서 확인하도록 권장합니다.</p>   
			    
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