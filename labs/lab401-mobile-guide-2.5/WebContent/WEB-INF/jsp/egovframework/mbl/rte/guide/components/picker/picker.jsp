<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Class Name : picker.jsp
  Description :  UX picker component
  Modification Information

      수정일         수정자           수정내용
    -------------    --------    ---------------------
     2011.07.14    황민희          최초 생성
     2012.08.02    박지민          1.1.1 버전 업그레이드 및 신규 컴포넌트 추가
 
    author   : 모바일 실행환경 개발팀 황민희
    since    : 2011.07.06
--%>
<!DOCTYPE html> 
<html lang="kr"> 
    <head>
        <title>UX Component - Date / Time Picker</title> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />    
        
        <!-- eGovFrame Common import -->        
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/cmm/jquery.mobile-1.1.1.css" />" />
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/cmm/EgovMobile-1.1.1.css" />" />
        
               
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery-1.7.1.min.js"/>"></script>
        
		 
<!--         <script type="text/javascript">
            $( document ).bind( "mobileinit", function(){
                $.mobile.page.prototype.options.degradeInputs.date = 'text';
            });
        </script>	 -->
        
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery.mobile-1.1.1.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/EgovMobile-1.1.1.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery.history.js" />"></script>
        
        <!-- 데이트 피커를 위한 임포트 파일 변경 시작 : 김연수 2012.07.27 박지민 2012.08.01 -->
        <!-- datebox  import-->        
        
        <link type="text/css" rel="stylesheet" href="<c:url value="/css/egovframework/mbl/cmm/datepicker/jqm-datebox.css" />" />
             
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/datepicker/jqm-datebox.core.js"/>"></script>                
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/datepicker/jqm-datebox.mode.calbox.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/datepicker/jqm-datebox.mode.datebox.js"/>"></script>
    	<script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/datepicker/jqm-datebox.mode.flipbox.js"/>"></script>    	
    	<script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/datepicker/jquery.mobile.datebox.i18n.ko.utf8.js"/>"></script>
    	
        <!-- 데이트 피커를 위한 임포트 파일 변경 끝 : 김연수 2012.07.27 박지민 2012.08.01 -->
        
        <!-- guide import -->
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/rte/guide/guide.css" />"> <!-- 스크롤 형태 위치가 바뀜.. 확인 필요 - guide.css의 body 초기화 부분 삭제 (2012-08-01)-->
        <script type="text/javascript"  src="<c:url value="/js/egovframework/mbl/rte/guide/guide.js"/>"></script>

		<script type="text/javascript"> 
			$(function(){
				$('#example').hide();
				$('#exampleView').bind('vclick',function(e)
				{
					$('#example').toggle();
				});
			});
		</script>
	</head>
	
    <body>
    
		<!-- page start -->
		<div data-role="page" class="type-index">
		
            <!-- header start -->
            <div data-role="header" data-position="inline" data-theme="z" class="egovBarHeader">
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
						<h1>Date picker</h1>
						<p>Date picker는 팝업 형태로 나타나며 날짜를 선택할 수 있도록 기능을 제공한다.</p>
					</div>
				
					<div class="egov-Dsclaimer">
						<h2>유의사항</h2>
						<p>Ajax로 도메인 내부링크를 연결 후 팝업형태의 picker를 출력시 picker가 닫히지 않는다.(width가 480일 경우 자동적으로 팝업형태로 출력)
						이를 방지 하기 위해 첫 도메인 내부링크는 data-ajax="false" 또는 rel="external"를 선언하여 페이지를 호출하거나 팝업형태의 picker가 출력되지 않도록 한다.</p>
						<div class="btnDsc"><a href="#" data-role="none"><span class="btnViewSample" id="exampleView">예시보기</span></a></div>
						<div id = "example">
							<div class="egov-Example">
								<p>A.jsp</p>
								<ul class="link">
									<li>&lt;a href="B.jsp" data-role="button" <strong>data-ajax="false"</strong>&gt;Go To 2nd Page&lt;/a&gt;</li>
									<li>&lt;a href="B.jsp" data-role="button" <strong>rel="external"</strong>&gt;Go To 2nd Page&lt;/a&gt;</li>
								</ul>
							</div>
							<div class="egov-Example">
								<p>B.jsp</p>
								<ul class="link">
									<li>&lt;--main page start--&gt;</li>
									<li>&lt;div data-role="page" id=main&gt;</li>
									<li class="egov-txtIn1">&lt;div data-role="header" data-theme="b"&gt;</li>
									<li class="egov-txtIn1">...</li>
									<li class="egov-txtIn1">&lt;/div&gt;</li>
									<li class="egov-txtIn1">&lt;div data-role="content"&gt;</li>
									
									<li class="egov-txtIn2">&lt;div data-role="fieldcontain"&gt;</li>
									<li class="egov-txtIn2">&lt;label for="defandroid"&gt;Some Date&lt;/label&gt;</li>
									<li class="egov-txtIn2">&lt;input name="defandroid" type="date" data-role="datebox" id="defandroid" <strong>data-options='{"useDialogForceFalse": true}'</strong>/&gt;</li>
									<li class="egov-txtIn2">&lt;/div&gt;</li>
									
									<li class="egov-txtIn1">&lt;/div&gt;</li>
									<li class="egov-txtIn1">...</li>
									<li>&lt;/div&gt;</li>
									<li>&lt;--sub page start--&gt;</li>
									<li>&lt;div data-role="page" id="sub"&gt;</li>
									<li class="egov-txtIn1">...</li>
									<li>&lt;/div&gt;</li>
								</ul>
							</div>
						</div>								
					</div>
				
					<div class="egov-deth1">
						<h2>기본코드</h2>
						<p>Date Picker를 사용 하기 위해서는 아래의 CSS 및 자바 스크립트 적용 순서를 아래와 같이 지정하여야 한다.</p><br>
<!-- 					<p>jquery.mobile-1.1.1.js 위에 적용</p>
						<div class="egov-deth2">
					 		<ul class="link">
									<li>&lt;script type="text/javascript"&gt;</li>
									<li class="egov-txtIn1">$( document ).bind( "mobileinit", function(){</li>
									<li class="egov-txtIn2">$.mobile.page.prototype.options.degradeInputs.date = 'text';</li>
									<li class="egov-txtIn1">});</li>
									<li>&lt;/script&gt;</li> 
					 		</ul>
						</div>
 -->
                        <p>스크립트 가장 아래에 적용</p>
                        <div class="egov-deth2">
                            <ul class="link">
                                    <li>&lt;!-- datebox  css--&gt;</li>
                                    <li>&lt;!-- jqm-datebox.css - datebox Component 디자인 css 파일 --&gt;</li>                                    
                                    <li>&lt;!-- datebox  javascript--&gt;</li>
                                    <li>&lt;!-- jqm-datebox.core.js - 각각의 모든 Date / Time Picker Component 들의 코어 부분 --&gt;</li>                                    
                                    <li>&lt;!-- jqm-datebox.mode.calbox.js - 일반 calendar 형태의 Component 지원 --&gt;</li>
                                    <li>&lt;!-- jqm-datebox.mode.datebox.js - Android 형태의 Component 지원 --&gt;</li>
                                    <li>&lt;!-- jqm-datebox.mode.flipbox.js - Filp 형태의 Component 지원 --&gt;</li>
                                    <li>&lt;!-- jquery.mobile.datebox.i18n.ko.utf8.js - Component 관련 언어 및 기타 옵션 설정 파일 --&gt;</li>
                              
									<li>&lt;link type="text/css" rel="stylesheet" href="&lt;c:url value="/css/egovframework/mbl/cmm/datepicker/jqm-datebox.css" /&gt;" /&gt;</li>                                    
                                    <li>&lt;script type="text/javascript" src="&lt;c:url value="/js/egovframework/mbl/cmm/datepicker/jqm-datebox.core.js"&gt;&lt;/script&gt;</li>                
                                    <li>&lt;script type="text/javascript" src="&lt;c:url value="/js/egovframework/mbl/cmm/datepicker/jqm-datebox.mode.calbox.js"&gt;&lt;/script&gt;</li>
                                    <li>&lt;script type="text/javascript" src="&lt;c:url value="/js/egovframework/mbl/cmm/datepicker/jqm-datebox.mode.datebox.js"&gt;&lt;/script&gt;</li>
                                    <li>&lt;script type="text/javascript" src="&lt;c:url value="/js/egovframework/mbl/cmm/datepicker/jqm-datebox.mode.flipbox.js"&gt;&lt;/script&gt;</li>
                                    <li>&lt;script type="text/javascript" src="&lt;c:url value="/js/egovframework/mbl/cmm/datepicker/jquery.mobile.datebox.i18n.ko.utf8.js"&gt;&lt;/script&gt;</li>
                            </ul>
                        </div>						
					</div>
					
	        		<div class="egov-deth1">
						<h2>안드로이드형태</h2>
						<p>안드로이드 형태는 상/하 버튼을 눌러 날짜를 선택 할 수 있다.</p>
						<div class="egov-deth2">
								<div data-role="fieldcontain">
									<label for="mydate1">Some Date</label>
									<input name="mydate" id="mydate1" type="date" data-role="datebox" data-options='{"mode": "datebox"}'>
							</div>
							<ul class="link">
									 <li>&lt;div data-role=&quot;fieldcontain&quot;&gt;</li>
									 <li class="egov-txtIn1"> &lt;label for=&quot;mydate1&quot;&gt;Some Date&lt;/label&gt;</li>
									 <li class="egov-txtIn1">&lt;input name="mydate" id="mydate1" type="date" data-role="datebox" data-options='{"mode": "datebox"}'>/&gt;</li>
									 <li>&lt;/div&gt;</li>
					 		</ul>
						</div>
					</div>
	               
	               	<div class="egov-deth1">
						<h2>달력 형태</h2>
						<p>안드로이드 형태에 &lt;input name="mydate1"&gt; Tag에 <strong> data-options='{"mode": "calbox"}'</strong>를 추가한다.</p>
						<div class="egov-deth2">
							<div data-role="fieldcontain">
								<label for="defandroid1">Some Date</label>
								<input name="mydate" id="defandroid1" type="date" data-role="datebox" data-options='{"mode": "calbox"}' >
						    </div>		
							<ul class="link">
								<li>&lt;div data-role=&quot;fieldcontain&quot;&gt;</li>
								<li class="egov-txtIn1">&lt;label for=&quot;defandroid1&quot;&gt;Some Date&lt;/label&gt;</li>
								<li class="egov-txtIn1">&lt;input name="mydate" id="defandroid1" type="date" data-role="datebox" data-options='{"mode": "calbox"}' &gt;</li>
								<li>&lt;/div&gt;</li>
					 		</ul>
						</div>
					</div>
					<br>
					<div class="egov-deth1">
						<h2>스크롤 형태</h2>
						<p>안드로이드 형태에 &lt;input name="mydate1"&gt; Tag에 <strong> data-options='{"mode": "flipbox"}'</strong>를 추가한다.</p>
						<div class="egov-deth2">
									<div data-role="fieldcontain">
									<label for="defandroid2">Some Date(scroll)</label>
									<input name="mydate" id="defandroid2" type="date" data-role="datebox" data-options='{"mode": "flipbox" }' >
								    </div>		
							<ul class="link">
									 <li>&lt;div data-role=&quot;fieldcontain&quot;&gt;</li>
									 <li class="egov-txtIn1">&lt;label for=&quot;defandroid2&quot;&gt;Some Date&lt;/label&gt;</li>
									 <li class="egov-txtIn1">&lt;input name="mydate" id="defandroid2" type="date" data-role="datebox" data-options='{"mode": "flipbox" }' &gt;</li>
									 <li>&lt;/div&gt;</li>
					 		</ul>
						</div>
					</div>
					<br>
					<div class="egov-tit">
						<h1>Time picker</h1>
						<p>Time picker는 팝업 형태로 나타나며 시간을 선택 할 수 있도록 한다.</p>
					</div>					
					<div class="egov-deth1">
						<h2>24 시간 단위</h2>
						<p>안드로이드 형태에 &lt;input name=&quot;mydate1&gt; Tag에 <strong>data-options='{"mode": "timebox", "overrideTimeFormat": 24}'</strong>를 추가한다.</p>
						<div class="egov-deth2">
							<div data-role="fieldcontain">
								<label for="mydate2">Some Time (24hour)</label>									
								<input name="mydate" id="mydate2" type="date" data-role="datebox" data-options='{"mode": "timebox", "overrideTimeFormat": 24}'>							
							</div>
			                <ul class="link">
									<li>&lt;div data-role="fieldcontain"></li>
									 <li class="egov-txtIn1">&lt;label for="mydate2">Some Time (24hour)&lt;/label></li>
									 <li class="egov-txtIn1">&lt;input name="mydate" id="mydate2" type="date" data-role="datebox" data-options='{"mode": "timebox", "overrideTimeFormat": 24}' &gt;</li>
									<li>&lt;/div></li>
							</ul>
						</div>
					</div>

					<div class="egov-deth1">
						<h2>12 시간 단위 </h2>
						<p>안드로이드 형태에 &lt;input name="mydate1"&gt; Tag에 <strong>data-options='{"mode": "timebox", "overrideTimeOutput": "%l:%M %p"}'</strong>를 추가한다.</p>
						<div class="egov-deth2">
									<div data-role="fieldcontain">
									<label for="mydate3">Some Time (12hour)</label>									
									<input name="mydate" id="mydate3" type="date" data-role="datebox" data-options='{"mode": "timebox", "overrideTimeOutput": "%l:%M %p"}'>
									</div>
			                <ul class="link">
									<li>&lt;div data-role="fieldcontain"></li>
									 <li class="egov-txtIn1">&lt;label for="mydate3">Some Time (24hour)&lt;/label></li>
									 <li class="egov-txtIn1">&lt;input name="mydate" id="mydate3" type="date" data-role="datebox" data-options='{"mode": "timebox", "overrideTimeOutput": "%l:%M %p"}'&gt;</li>
									<li>&lt;/div></li>
							</ul>
						</div>
					</div>						
					<div class="egov-deth1">
						<h2>스크롤 형태</h2>
						<p>안드로이드 형태에 &lt;input name="mydate1"&gt; Tag에 <strong>data-options='{"mode": "timeflipbox", "overrideTimeOutput": "%l:%M %p"}'</strong>를 추가한다.</p>
						<div class="egov-deth2">
									 <div data-role="fieldcontain">
									 <label for="mydate4">Some Time (scroll)</label>
									<input name="mydate" id="mydate4" type="date" data-role="datebox" data-options='{"mode": "timeflipbox", "overrideTimeOutput": "%l:%M %p"}'>
									</div>
			                <ul class="link">
									<li>&lt;div data-role="fieldcontain"></li>
									 <li class="egov-txtIn1">&lt;label for="mydate4">Some Time (24hour)&lt;/label></li>
									 <li class="egov-txtIn1">&lt;input name="mydate" id="mydate4" type="date" data-role="datebox" data-options='{"mode": "timeflipbox", "overrideTimeOutput": "%l:%M %p"}'&gt; </li>
									<li>&lt;/div></li>
							</ul>
						</div>
					</div>
                    <div class="egov-deth1">
                        <h2>색상 변경</h2>
                        <p>Date/Time Picker Tag 에 <br>Android 형태로는 
                        <strong>data-options='{"themeHeader": "[a~g]", "themeButton": "[a~g]"}'<br></strong>Calendar 형태로는  <strong>data-options='{"themeHeader": "[a~g]", "themeDate": "[a~g]"}'</strong>
                                                           을 추가 한다.<br>
                        data-options 내부에 정의된 themeHeader는 Picker의 상단 헤더 부분의 색상을 변경하는 것이고, <br>
                        themeButton(Android)은 변경버튼(+, -)버튼의 색상을 의미하며, <br>
                        themeDate(Calendar)는 달력 내부의 날짜 색상을 의미한다.
                                                            색상 변경은 <a href ="<c:url value="/guide/components/pageStructure/theme.do"/>" data-ajax="false">theme type</a> 페이지을 참조 한다.</p>
                        <div class="egov-deth2">
                                    <div data-role="fieldcontain">
                                    <label for="mydate5">Some Date</label>
                                    <input name="mydate" id="mydate5" type="date" data-role="datebox" data-options='{"mode": "datebox" ,"themeHeader": "g" ,"themeButton": "b"}'>
                                    </div>
                            <ul class="link">
                                    <li>&lt;div data-role="fieldcontain"></li>
                                     <li class="egov-txtIn1">&lt;label for="mydate5">Some Date&lt;/label></li>
                                     <li class="egov-txtIn1">&lt;input name="mydate" id="mydate5" type="date" data-role="datebox" data-options='{"mode": "datebox" ,"themeHeader": "g" ,"themeButton": "b"}'&gt;</li>
                                    <li>&lt;/div></li>
                            </ul>
                        </div>
                        <div class="egov-deth2">
                                    <div data-role="fieldcontain">
                                    <label for="mydate6">Some Date</label>
                                    <input name="mydate" id="mydate6" type="date" data-role="datebox" data-options='{"mode": "calbox" , "themeHeader": "g" ,"themeDate": "b"}'>                                    
                                    </div>  
                            <ul class="link">
                                    <li>&lt;div data-role="fieldcontain"></li>
                                    <li class="egov-txtIn1">&lt;label for="mydate6">Some Date&lt;/label></li>
                                    <li class="egov-txtIn1">&lt;input name="mydate" id="mydate6" type="date" data-role="datebox" data-options='{"mode": "calbox" , "themeHeader": "g" ,"themeDate": "b"}'&gt;</li>
                                    <li>&lt;/div></li>
                            </ul>
                        </div>                        
                    </div>
                    				
				</div>
				<!-- content-primary end -->
				
				<!-- content-secondary start -->
				<div class="content-secondary"> 
					<jsp:include page="../../componentMenu.jsp"></jsp:include>
				</div>			
				<!-- content-secondary end -->
				
			</div>
			<!-- content end -->
			
			<!-- footer start -->
			<div data-role="footer" data-theme="z"  class="egovBar">
				 <h4 class="main">Copyright(c)2012 Ministry of Public Administration and Security.</h4>
			</div>
			<!-- footer end --> 
			
		</div>
		<!-- page end -->
	
    </body>
</html>