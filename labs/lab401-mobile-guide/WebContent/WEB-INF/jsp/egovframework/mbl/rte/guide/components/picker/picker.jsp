<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Class Name : picker.jsp
  Description :  UX picker component
  Modification Information

      수정일         수정자           수정내용
    -------------    --------    ---------------------
     2011.07.14    황민희          최초 생성
 
    author   : 모바일 실행환경 개발팀 황민희
    since    : 2011.07.06
--%>
<!DOCTYPE html> 
<html> 
    <head>
        <title>UX Component - Date / Time Picker</title> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />    
        
        <!-- eGovFrame Common import -->        
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/cmm/jquery.mobile-1.0b3.min.css" />" />
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/cmm/EgovMobile.css" />" />
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery-1.6.2.min.js"/>"></script>
		<!-- History.js -->
		<script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery.history.js"/>"></script> 
        <script type="text/javascript">
            $( document ).bind( "mobileinit", function(){
                $.mobile.page.prototype.options.degradeInputs.date = 'text';
            }); 
        </script>
        
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery.mobile-1.0b3.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/EgovMobile.js"/>"></script>
        
        <!-- datebox  import-->        
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/datepicker/jquery.mobile.datebox.js"/>"></script> 
    
        <!-- guide import -->
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/rte/guide/guide.css" />">
        <script type="text/javascript"  src="<c:url value="/js/egovframework/mbl/rte/guide/guide.js"/>"></script>

		<script type="text/javascript"> 
			$(function(){
				$('#example').hide();
				$('#exampleView').bind('vclick',function(e)
				{
					$('#example').toggle();
				})	
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
                <h1><img src="<c:url value="/images/egovframework/mbl/rte/guide/h1_logo.png"/>" /></h1>
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
						<p>Date Picker를 사용 하기 위해서는 아래의 자바 스크립트 적용 순서를 아래와 같이 지정해 줘야한다.</p><br>
						<p>jquery.mobile-1.0b3.min.js 위에 적용</p>
						<div class="egov-deth2">
					 		<ul class="link">
									<li>&lt;script type="text/javascript"&gt;</li>
									<li class="egov-txtIn1">$( document ).bind( "mobileinit", function(){</li>
									<li class="egov-txtIn2">$.mobile.page.prototype.options.degradeInputs.date = 'text';</li>
									<li class="egov-txtIn1">});</li>
									<li>&lt;/script&gt;</li> 
					 		</ul>
						</div>
                        <p>스크립트 가장 아래에 적용</p>
                        <div class="egov-deth2">
                            <ul class="link">
                                    <li>&lt;!-- datebox  javascript--&gt;</li>
                                    <li>&lt;script type="text/javascript" src="/js/egovframework/mbl/cmm/datepicker/jquery.mobile.datebox.js"&gt;&lt;/script&gt;</li> 
                            </ul>
                        </div>						
					</div>
					
	        		<div class="egov-deth1">
						<h2>안드로이드형태</h2>
						<p>안드로이드 형태는 상/하 버튼을 눌러 날짜를 선택 할 수 있다.</p>
						<div class="egov-deth2">
								<div data-role="fieldcontain">
									<label for="defandroid">Some Date</label>
									<input name="defandroid" type="date" data-role="datebox" id="defandroid" />
						</div>
							<ul class="link">
									 <li>&lt;div data-role=&quot;fieldcontain&quot;&gt;</li>
									 <li class="egov-txtIn1"> &lt;label for=&quot;defandroid&quot;&gt;Some Date&lt;/label&gt;</li>
									 <li class="egov-txtIn1">&lt;input name=&quot;defandroid&quot; type=&quot;date&quot; data-role=&quot;datebox&quot; id=&quot;defandroid&quot;/&gt;</li>
									 <li>&lt;/div&gt;</li>
					 		</ul>
						</div>
					</div>
	               
	               	<div class="egov-deth1">
						<h2>달력 형태</h2>
						<p>안드로이드 형태에 &lt;input name=&quot;mydate&gt; Tag에 <strong> data-options='{"mode": "calbox"}'</strong>를 추가한다.</p>
						<div class="egov-deth2">
									<div data-role="fieldcontain">
									<label for="defandroid">Some Date</label>
									<input name="mydate" id="defandroid" type="date" data-role="datebox" data-options='{"mode": "calbox" }' >
								    </div>		
							<ul class="link">
									 <li>&lt;div data-role=&quot;fieldcontain&quot;&gt;</li>
									 <li class="egov-txtIn1">&lt;label for=&quot;defandroid&quot;&gt;Some Date&lt;/label&gt;</li>
									 <li class="egov-txtIn1">&lt;input name=&quot;mydate&quot; id=&quot;defandroid&quot; type=&quot;date&quot; data-role=&quot;datebox&quot; data-options='{&quot;mode&quot;: &quot;calbox&quot;}' &gt;</li>
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
						<p>안드로이드 형태에 &lt;input name=&quot;mydate&gt; Tag에 <strong>data-options='{"mode": "timebox"}'</strong>를 추가한다.</p>
						<div class="egov-deth2">
									 <div data-role="fieldcontain">
									 <label for="mydate">Some Time (24hour)</label>
									<input name="mydate" id="mydate" type="date" data-role="datebox"   data-options='{"mode": "timebox"}'>
									</div>
			                <ul class="link">
									<li>&lt;div data-role="fieldcontain"></li>
									 <li class="egov-txtIn1">&lt;label for="mydate">Some Time (24hour)&lt;/label></li>
									 <li class="egov-txtIn1">&lt;input name="mydate" id="mydate" type="date" data-role="datebox"  data-options='{"mode": "timebox"}'></li>
									<li>&lt;/div></li>
							</ul>
						</div>
					</div>

					<div class="egov-deth1">
						<h2>12 시간 단위</h2>
						<p>안드로이드 형태에 &lt;input name=&quot;mydate&gt; Tag에 <strong>data-options='{"mode": "timebox", "timeFormat": 12}'</strong>를 추가한다.</p>
						<div class="egov-deth2">
									 <div data-role="fieldcontain">
									 <label for="mydate">Some Time (12hour)</label>
									<input name="mydate" id="mydate" type="date" data-role="datebox"  data-options='{"mode": "timebox", "timeFormat": 12}'>
									</div>
			                <ul class="link">
									<li>&lt;div data-role="fieldcontain"></li>
									 <li class="egov-txtIn1">&lt;label for="mydate">Some Time (24hour)&lt;/label></li>
									 <li class="egov-txtIn1">&lt;input name="mydate" id="mydate" type="date" data-role="datebox"  data-options='{"mode": "timebox", "timeFormat": 12}'></li>
									<li>&lt;/div></li>
							</ul>
						</div>
					</div>						
				
                    <div class="egov-deth1">
                        <h2>색상 변경</h2>
                        <p>Date/Time picker 테그 내부에 <strong>data-options='{"page": "[a~g]", "button": "[a~g]"}'</strong>을 추가 한다.
                              data-options 내부에 정의된 page는 picker의 전체 페이지 색상 및 확인버튼의 색상을 나타내며 button은 변경버튼(+, -)버튼의 색상을 의미한다.
                              또한 달력 형식의 Date picker는 <strong>data-options='{"button": "[a~g]"}'</strong>만 정의해도 무방하다.
                              색상 변경은 <a href ="<c:url value="/guide/components/pageStructure/theme.do"/>" data-ajax="false">theme type</a> 페이지을 참조 한다.</p>
                        <div class="egov-deth2">
                                    <div data-role="fieldcontain">
                                    <label for="defandroid">Some Date</label>
                                    <input name="mydate" id="mydate" type="date" data-role="datebox"  data-options='{"page": "a", "button": "f"}'>
                                    </div>
                            <ul class="link">
                                    <li>&lt;div data-role="fieldcontain"></li>
                                     <li class="egov-txtIn1">&lt;label for="mydate">Some Time (24hour)&lt;/label></li>
                                     <li class="egov-txtIn1">&lt;input name="mydate" id="mydate" type="date" data-role="datebox"  data-options='{"page": "a", "button": "f"}'></li>
                                    <li>&lt;/div></li>
                            </ul>
                        </div>
                        <div class="egov-deth2">
                                    <div data-role="fieldcontain">
                                    <label for="defandroid">Some Date</label>
                                    <input name="mydate" id="defandroid" type="date" data-role="datebox" data-options='{"mode": "calbox" , "button": "e"}' >
                                    </div>  
                            <ul class="link">
                                    <li>&lt;div data-role="fieldcontain"></li>
                                    <li class="egov-txtIn1">&lt;label for="mydate">Some Time (24hour)&lt;/label></li>
                                    <li class="egov-txtIn1">&lt;input name="mydate" id="mydate" type="date" data-role="datebox"  data-options='{"mode": "calbox", "button": "e"}'></li>
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
				 <h4 class="main">Copyright(c)2011 Ministry of Public Administration and Security.</h4>
			</div>
			<!-- footer end --> 
			
		</div>
		<!-- page end -->
	
    </body>
</html>