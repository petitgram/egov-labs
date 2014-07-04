<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
  Class Name : form.jsp
  Description :  UX Form Generate code
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
        <title>Generate code - Form</title> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        
        <!-- eGovFrame Common import -->
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/cmm/jquery.mobile-1.0b3.min.css" />" />
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/cmm/EgovMobile.css" />" />
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery-1.6.2.min.js"/>"></script>
		<!-- History.js -->
		<script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery.history.js"/>"></script> 
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery.mobile-1.0b3.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/EgovMobile.js" />"></script>
    
        <!-- guide import -->
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/rte/guide/guide.css" />">
        <script type="text/javascript"  src="<c:url value="/js/egovframework/mbl/rte/guide/guide.js"/>"></script>
        <script language='JavaScript' type='text/javascript'> /* 스크립트를 헤드에 두지만 바디에 두어도 가능한 것확인. 바디 width=100%를 크기 조절하면 됨 */

        function validation(){
            var f = document.forms[0];
            if(! f.inputText.checked  && !f.inputNumber.checked && !f.inputMail.checked &&  !f.inputUrl.checked &&!f.inputTel.checked &&
				!f.inputSearch.checked && !f.inputSlider.checked && !f.inputPassword.checked){
            	jAlert('하나이상을 \n선택해주세요', '가이드프로그램', 'g');
                return false;
            } else {
                return true;
            }
                  
        }
        
        function generate(status) {
             var f = document.forms[0];

             if (status != 'deleteXml') {
            	 if(!validation()) {
                	 return false;
            	 }
             }
             
             f.action="<c:url value="/generate/form/formGen.do"/>";
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
						<h1>Form</h1>
					</div>
					
					<form method="post">		
					<input type="hidden" name="xmlStatus">			

					<div class="gen-Group">
                        <div class="gen-grid">
                            <ul class="c-attr">
                                <li>
                                	<div class="gen-wid1"><strong>Text</strong></div>
			                     	<div class="gen-wid2">
			                     		<input type="checkbox" name="inputText" value="text" ${(xml.component["inputText"] == 'text') ? 'checked="checked"' : ''} data-role="none" /><label for="">선택</label>           
			                     	</div>
                                </li>
                                <li>
                                	<div class="gen-wid1"><strong>Number</strong></div>
			                     	<div class="gen-wid2">
			                     		<input type="checkbox" name="inputNumber" value="number" ${(xml.component["inputNumber"] == 'number') ? 'checked="checked"' : ''}data-role="none"/><label for="">선택</label>  
			                     	</div>
                                </li>
                                <li>
                                	<div class="gen-wid1"><strong>Email</strong></div>
			                     	<div class="gen-wid2">
			                     		<input type="checkbox" name="inputMail" value="email" ${(xml.component["inputMail"] == 'email') ? 'checked="checked"' : ''} data-role="none"/><label for="">선택</label>  
			                     	</div>
                                </li>
                                <li>
                                	<div class="gen-wid1"><strong>Url</strong></div>
			                     	<div class="gen-wid2">
			                     		<input type="checkbox" name="inputUrl" value="url" ${(xml.component["inputUrl"] == 'url') ? 'checked="checked"' : ''} data-role="none"/><label for="">선택</label>
			                     	</div>
                                </li>
                                <li>
                                	<div class="gen-wid1"><strong>Tel</strong></div>
			                     	<div class="gen-wid2">
			                     		<input type="checkbox" name="inputTel"  value="tel" ${(xml.component["inputTel"] == 'tel') ? 'checked="checked"' : ''} data-role="none"/><label for="">선택</label>
			                     	</div>
                                </li>
                                <li>
                                	<div class="gen-wid1"><strong>Search</strong></div>
			                     	<div class="gen-wid2">
			                     		<input type="checkbox" name="inputSearch" value="search" ${(xml.component["inputSearch"] == 'search') ? 'checked="checked"' : ''} data-role="none"/><label for="">선택</label>
			                     	</div>
                                </li>
                                <li>
                                	<div class="gen-wid1"><strong>Slider</strong></div>
			                     	<div class="gen-wid2">
			                     		<input type="checkbox" name="inputSlider" value="range" ${(xml.component["inputSlider"] == 'range') ? 'checked="checked"' : ''} data-role="none"/><label for="">선택</label>  
			                     	</div>
                                </li>
                                <li>
                                	<div class="gen-wid1"><strong>Password</strong></div>
			                     	<div class="gen-wid2">
			                     		<input type="checkbox" name="inputPassword" value="password" ${(xml.component["inputPassword"] == 'password') ? 'checked="checked"' : ''} data-role="none"/><label for="">선택</label> 
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