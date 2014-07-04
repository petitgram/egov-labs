<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Class Name : platform.jsp
  Description :  지원 플랫폼
  Modification Information

      수정일         수정자           수정내용
    -------------    --------    ---------------------
     2011.07.19    윤병욱          최초 생성
 
    author   : 모바일 실행환경 개발팀 윤병욱
    since    : 2011.07.19
--%>
<!DOCTYPE html> 
<html> 
    <head>
        <title>eGovFrame</title> 
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
        
	</head>
	
    <body>
    
        <!-- page start -->
		<div data-role="page" class="type-index">
		
            <!-- header start -->
            <div data-role="header" data-position="inline" data-theme="z" class="egovBarHeader">
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
						<h1>지원 플랫폼</h1>
					</div>
                    
                    <table class="egov-table-platform">
                    <colgroup><col width="25%"><col width="15%"><col width="15%"><col width="15%"><col width="15%"><col width="15%"></colgroup>
                    <thead>
                    <tr>
                        <th>컴포넌트</th>
                        <th><img src="<c:url value="/images/egovframework/mbl/rte/guide/ic_safari.png"  />"></th>
                        <th><img src="<c:url value="/images/egovframework/mbl/rte/guide/ic_chrome.png"  />"></th>
                        <th><img src="<c:url value="/images/egovframework/mbl/rte/guide/ic_fafox.png"  />"></th>
                        <th><img src="<c:url value="/images/egovframework/mbl/rte/guide/ic_opera.png"  />"></th>
                        <th><img src="<c:url value="/images/egovframework/mbl/rte/guide/ic_ie.png"  />"></th>
                    </tr>
                    </thead>
                  	<tbody>
                        <tr>
                            <td><strong>Button</strong></td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td><strong>Panel</strong></td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td><strong>Internal/External Link</strong></td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td><strong>Label/Text</strong></td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td><strong>Tabs</strong></td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td><strong>Form</strong></td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td><strong>Menu</strong></td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td><strong>Processing Dialog / Bar</strong></td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td><strong>Dialog</strong></td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td><strong>Grid View</strong></td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td><strong>Table / List View</strong></td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td><strong>Date / Time Picker</strong></td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td><strong>Check/ Radio</strong></td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td><strong>Icon</strong></td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td><strong>Selector / Switch</strong></td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td><strong>Collapsible Block</strong></td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>O</td>
                            <td>X</td>
                        </tr>                        
                   	</tbody>                     
                    </table>

					<ul class="egov-txt">
						<li>행정안전부 고시 "제 2010-40호" 「전자정부서비스 호환성 준수지침」의 모바일 웹 방식 서비스 개발을 위한 기술 표준 지침 에 따라 최소 3종 이상의 웹 브라우저에서 동등한 서비스 제공 기능을 지원 합니다.</li>
						<li>Opera Mobile 의 경우 gradient 효과가 적용되어 있지 않아 일부 컴포넌트의 모양이 다를 수 있음</li>
					</ul>
	             </div> 
	            
	             <div class="content-secondary"> 
					<jsp:include page="../introMenu.jsp"></jsp:include>
				</div>
			</div>	             
            
			<!-- footer start -->
			<div data-role="footer" data-theme="z" class="egovBar">
				<h4>Copyright(c)2011 Ministry of Public Administration and Security.</h4>
			</div>
			<!-- footer end --> 
      
         </div> 
     </body>
 </html>