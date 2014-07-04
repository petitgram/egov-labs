<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Class Name : configure.jsp
  Description :  API configure
  Modification Information

      수정일         수정자           수정내용
    -------------    --------    ---------------------
     2011.07.14    윤병욱          최초 생성
 
    author   : 모바일 실행환경 개발팀 윤병욱
    since    : 2011.07.06
--%>
<!DOCTYPE html> 
<html> 
    <head>
        <title>API - configure</title> 
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
            <div data-role="header" data-position="inline" data-theme="z" class="egovBar">
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
                        <h1>Configuring Defaults</h1>
                        <p>전자정부 모바일 표준프레임워크는 모바일 어플리케이션이 시작 될때 각종 초기화 작업을 수행 할 수 있게 mobileinit 이벤트를 통하여 
						기본 환경 설정을 정의 할수 있도록 한다.</p>
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>The Mobileinit Event</h2>
                        <p>mobileinit 이벤트는 Page가 시작되자마자 발생하는 이벤트로서 첫 초기화 작업 시 실행되며 함수 내부에 여러 이벤트를 적용하여 사용 할 수 있다.</p>
                        <div class="egov-deth2">
                            <ul class="link">
                                <li>$(document).bind("mobileinit", function(){</li>
                                <li class="egov-txtIn1">//apply overrides here</li>
                                <li>});</li>
                            </ul>
                        </div>
                        <p> 이 이벤트는 실행 즉시 발생 하므로 jquerymoible.js가 로드 되기 전에 바이딩 되어야 한다.
						다시 말해 mobileinit 이벤트의 위치는 jquery 라이브러리와 jquerymobile 라이브러리 사이에 위치 해야한다.</p>
                        <div class="egov-deth2">
                            <ul class="link">
                                <li>&lt;script src="jquery.js"&gt;&lt;/script&gt;</li>
                                <li><strong>&lt;script src="custom-scripting.js"&gt;&lt;/script&gt;</strong></li>
                                <li>&lt;script src="jquery-mobile.js"&gt;&lt;/script&gt;</li>
                            </ul>
                        </div>
                        
                        <p>기본 환경설정을 변경하는 방법에는
                         $.extend 메소드를 이용하여 여러 속성을 한 번에 변경하거나
                        </p>
                        <div class="egov-deth2">
                            <ul class="link">
                                <li>$(document).bind("mobileinit", function(){   $.extend(</li>
                                <li class="egov-txtIn1">$.mobile , {</li>
                                <li class="egov-txtIn2"><strong>foo: bar</strong></li>
                                <li class="egov-txtIn1">});</li>
                                <li>});</li>
                            </ul>
                        </div>
                        
                        <p> .mobile 객체를 사용하여 개별적으로 변경할 수도 있다.  </p>
                        <div class="egov-deth2">
                            <ul class="link">
                                <li>$(document).bind("mobileinit", function(){ </li>
                                <li class="egov-txtIn1"><strong>$.mobile.foo = bar;</strong></li>
                                <li>});</li>
                            </ul>
                        </div>
                        
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>Configurable Options</h2>
                        <p>다음의 기본 환경설정들은 $.mobile 객체를 통해 재설정이 가능하다 : </p>
                        
                       	<dl class="egov-deth3">
                            <dt>ns (string, default: ""):</dt>
                            <dd>namespace는 data-role과 같은 ‘data-*‘ 형식의 속성에 사용된다. 
                            namespace는 default인 빈 문자열(blank string) 부터 사용자 지정의 어떤 값으로도 지정이 가능하다. 
                            namespace를 명확하게 사용하려면 중간에 ‘-‘(trailing dash)를 추가하는 것이 좋다.
                           	<br><br>
                          	<strong>NOTE:</strong> ‘data-*‘ 형식의 namespace를 사용할 때는 테마 CSS 파일의 선택자(selector)를 
                           	아래와 같이 개별적으로 Update/Override 해야 한다</dd>
                            <div class="egov-deth2">
                                <ul class="link">
                                    <li>.ui-mobile [data-
                                        <strong>mynamespace-</strong>
                                        role=page], .ui-mobile [data-
                                        <strong>mynamespace-</strong>
                                        role=dialog], .ui-page { ... </li>
                                </ul>
                            </div>
                           </dl>
     
                       	<dl class="egov-deth3">
                            <dt>autoInitializePage (boolean, default: true):</dt>
                            <dd>DOM이 실행될 때 $.mobile.initializePage를 호출하여 자동 초기화를 진행하는데 
                            	     autoInitializePage를 false로 선언 할 경우 는  자동 페이지 초기화를 하지 않는다.
                            </dd>
                           </dl>
                                                   
                        <dl class="egov-deth3">
                            <dt>subPageUrlKey (string, default: "ui-page"):</dt>
                            <dd>URL parameter는 Nested List 처럼 위젯에 의해서 생성되는 하위 페이지(subpage) 참조를 위해 사용되며 
                            ‘example.html&ui-page=subpageIdentifier’ 형식으로 변경된다. 
                            ’&ui-page=’ 앞의 hash segment 는 프레임워크에서 하위 페이지가 존재하는 URL에 대한 Ajax 요청을 만들기 위해 사용된다.</dd>
                            
                            
                            <dt>activePageClass (string, default: "ui-page-active"):</dt>
                            <dd>현재 보여지고 있거나 트랜지션(transition) 중인 페이지에 할당되는 클래스이다.</dd>
                            
                            <dt>activeBtnClass (string, default: "ui-page-active"):</dt>
                            <dd>현재 활성화 되어있는 버튼에 할당되는 클래스이다.</dd>
							
                            <dt>ajaxEnabled (boolean, default: true):</dt>
                            <dd>모든 링크 이동이나 폼 전송은 기본적으로 Ajax를 기반으로 하고 있다 Ajax가 아니라 일반 방식으로 페이지 이동을 처리하고 싶다면 이 값을 false로 지정한다.</dd>							
                            
                            <dt>hashListeningEnabled (boolean, default: true):</dt>
                            <dd>history의 변경을 자동적으로 처리 한다. 
                            hashListeningEnabled 옵션을 ‘disabled’ 로 설정하면 history의 변경을 자동으로 처리하지 않게 된다.</dd>
                            
                            <dt>defaultPageTransition (string, default: 'slide'):</dt>
                            <dd>Ajax 방식을 사용하는 페이지 전환에 관여하는 기본 환경설정을 변경한다. 
                            defaultPageTransition 옵션을 ‘none’으로 설정하면 화면전환 효과가 적용되지 않는다.</dd>

                            <dt>touchOverflowEnabled (boolean, default: false):</dt>
                            <dd>디바이스의 스크롤 및 fixed toolbar 기능을 사용하기 위하여  overflow-scrolling: touch 지원하는 여부를 설정한다.</dd> 
                             
                            <dt>defaultDialogTransition (string, default: 'pop'):</dt>
                            <dd>다이얼로그에서 Ajax 방식을 통한 페이지 전환에 관여하는 기본 환경설정을 변경한다. 
                            defaultDialogTransition 옵션을 ‘none’으로 설정하면 화면전환 효과가 적용되지 않는다.</dd>
                            
                            <dt>minScrollBack (string, default: 150):</dt>
                            <dd>스크롤을 시작하는 최소거리를 설정한다.</dd>
                            
                            <dt>loadingMessage (string, default: "loading"):</dt>
                            <dd>로딩시 보여지는 로딩 메시지를 변경한다.‘false’로 설정하면 로딩 메시지가 나타나지 않는다.</dd>
                            
                            <dt>pageLoadErrorMessage (string, default: "Error Loading Page"):</dt>
                            <dd>Ajax 방식의 페이지이동에서 페이지 로드를 실패 했을 경우 나타나는 메시지를 변경한다.</dd>
                        </dl>

                    </div>
                    
                 </div> 
	            
	             <div class="content-secondary"> 
					<jsp:include page="../introMenu.jsp"></jsp:include>
				</div>
			</div>	             
            
			<!-- footer start -->
			<div data-role="footer" data-theme="z" class="egovBar">
				<h4 class="main">Copyright(c)2011 Ministry of Public Administration and Security.</h4>
			</div>
			<!-- footer end --> 
      
         </div> 
     </body>
 </html>