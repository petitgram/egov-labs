<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Class Name : events.jsp
  Description :  API event
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
        <title>API - Events</title> 
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
                        <h1>Events</h1>
                        <p>전자정부 모바일 표준프레임워크는 스마트기반 모바일 환경에 적합한  
						 이벤트를 제공한다. Touch, Mouse, Window 영역의 다양한 이벤트를 
						지원가능 여부에 따라 선택적으로 이용하기 때문에 모바일 환경과 데스크톱(Desktop) 환경 모두에서 사용 가능하다. 
						live() 또는 bind() 메소드를 이용하여 여러 이벤트를 함께 사용 할 수 있다.<br>
						<strong>아래 이벤트는 pageCreate()에 live() 또는 bind() 해야 사용 할 수 있다.</strong></p>
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>Touch Events</h2>
                        <dl class="egov-deth3">
                            <dt>tap</dt>
                            <dd>Touch 이벤트가 끝나는 즉시 발생하는 이벤트이다.</dd>
                            
                            <dt>taphold</dt>
                            <dd>tap을 일정 시간 이상 지속했을 때 발생하는 이벤트이다.</dd>
                            
                            <dt>swipe</dt>
                            <dd>1초 이내에 30px이상의 수평 방향이나 20px 이상의 수직 방향으로 드래그(drag)되면 발생하는 이벤트이다.</dd>
		                        <div class="egov-deth2">
		                            <ul class="link">
		                               <li>scrollSupressionThreshold (default: 10px) – default 값 이상 으로 수평방향으로 이벤트가 발생하면 스크롤이 발생되지 않도록 한다.</li>
		                               <li>durationThreshold (default: 1000ms) – default 값 이상 swipe이 지속되면 기능이 작동하지 않는다.</li>
		                               <li>horizontalDistanceThreshold (default: 30px) – default 값 이상 수평방향으로 이벤트가 발생해야한다.</li>
		                               <li>verticalDistanceThreshold (default: 75px) – default 값 이하로 수직방향으로 이벤트가 발생해야한다</li> 
		                            </ul>
		                        </div>                            
                            
                            <dt>swipeleft</dt>
                            <dd>swipe 이벤트가 왼쪽으로 일어났을 때 발생하는 이벤트이다.</dd>
                            
                            <dt>swiperight</dt>
                            <dd>swipe 이벤트가 오른쪽으로 일어났을 때 발생하는 이벤트이다.</dd>
                        </dl>
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>Orientation change event</h2>
                        <dl class="egov-deth3">
                            <dt>orientationchange</dt>
                            <dd>기기의 방향이 수평 또는 수직으로 바뀌었을 때 발생하는 이벤트이다. 
							orientationChange 이벤트가 지원되지 않을 경우에는 resize 이벤트가 자동으로 bind 된다.</dd>
                        </dl>
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>Scroll events</h2>
                        <dl class="egov-deth3">
                            <dt>scrollstart</dt>
                            <dd>스크롤(scroll)이 시작되면 발생하는 이벤트이다. 
                            (iOS 기기는 스크롤 중에는 DOM 을 변경하지 않고 queue 에 저장해두었다가 스크롤이 끝난 후에 변경한다.) 
							</dd>
                            
                            <dt>scrollstop</dt>
                            <dd>스크롤이 끝나면 발생하는 이벤트이다.</dd>
                        </dl>
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>Page Events</h2>
                        <p>페이지가 나타나기 이전(pagebeforeshow)과 나타난 순간(pageshow), 
                              가려지기 이전(pagebeforehide)과 가려진 순간(pagehide) 페이지 이벤트가 발생한다.</p>
                        
                        <dl class="egov-deth3">
                            <dt>pagebeforeshow</dt>
                            <dd>화면전환이 일어나기 전, 또는 페이지가 보여지기 전에 매번  발생하는 이벤트이다.</dd>
                            
                            <dt>pagebeforehide</dt>
                            <dd>화면전환이 일어나기 전, 또는 페이지가 숨겨지기 전에 매번 발생하는 이벤트이다.</dd>
                            
                            <dt>pageshow</dt>
                            <dd>화면전환이 완료되었거나 페이지가 보여진 후에 매번 발생하는 이벤트이다..</dd>
                            
                            <dt>pagehide</dt>
                            <dd>화면전환이 완료되었거나 페이지가 가려진 후에 매번 발생하는 이벤트이다.</dd>
                            
                            <dd>페이지 이벤트는 이전 페이지와 다음 페이지의 존재 유무와 이벤트 종류에 따라 이전 페이지(prevPage)와 
							다음페이지(nextPage)에 대한 정보를 갖는다.
							(첫 번째 페이지는 이전 페이지에 대한 정보가 없기 때문에 null 객체를 참조한다.) 
							</dd>
							<div class="egov-deth2">
	                        	<ul class="link">
		                            <li>$('div').live('pageshow', function(event, ui) {</li>
		                            <li class="egov-txtIn1">alert('This page was just hidden: '+ ui.prevPage);</li>
		                            <li>});</li>
		                            <li><br></li>
		                            <li>$('div').live('pagehide', function(event, ui) {</li>
		                            <li class="egov-txtIn1">alert('This page was just shown: '+ ui.nextPage);</li>
		                            <li>});</li>
	                            </ul>
                       		</div>
                        </dl>
                        
                        <br>
					 	<dl class="egov-deth3">
					 		<dd>		
							최초 페이지가 로드될 때 페이지 이벤트에 관련된 핸들러를 사용하기 위해서는 참조된 Javascript 가 실행되기 전에
							bind 시켜야 한다. Global Configuration 에서 설명한 것처럼
							mobileinit 핸들러를 이용하면 이와 같은 설정을 할 수 있다.
                        	</dd>
                        </dl>
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>Virtual mouse events</h2>
                        <p>마우스와 터치 이벤트을 둘다 인식 할 수 있는 virtual click을 제공한다.이는 기존 웹브라우저 환경에서 발생하는 기본 마우스 이벤트(
                        mousedown, mousemove, mouseup, click)가 모바일 환경에서도 지원이 되며 동일 자원에 다중 이벤트가 발생할 시 각각 다른 이벤트로 인식한다. 
						</p>
                        <dl class="egov-deth3">
                            <dt>vmouseover</dt>
                            <dd>터치 이벤트 또는 mouseover가 발생할 때 나타나는 이벤트이다.</dd>
                            
                            <dt>vmousedown</dt>
                            <dd>터치 이벤트 또는 mousedown이 발생할 때 나타나는 이벤트이다.</dd>
                            
                            <dt>vmousemove</dt>
                            <dd>터치 이벤트 또는 mousemove가  발생할 때 나타나는 이벤트이다.</dd>
                            
                            <dt>vmouseup</dt>
                            <dd>터치 이벤트 또는 mouseup이  발생할 때 나타나는 이벤트이다.</dd>                            
   
                            <dt>vclick</dt>
                            <dd>터치 이벤트 또는 click이  발생할 때 나타나는 이벤트이다.</dd>
                            
                            <dt>vmousecancel</dt>
                            <dd>터치 이벤트 또는 mousecancel가  발생할 때 나타나는 이벤트이다.</dd>
                        </dl>
                    </div>                    
                    
                    <div class="egov-deth1">
                        <h2>Animation Events</h2>
                        <p> CSS 전환에 적용되는 class를 추가하거나 삭제하는 
                        animationComplete 플러그인을 지원한다.</p>
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