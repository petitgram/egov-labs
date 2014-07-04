<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Class Name : methodsUtilities.jsp
  Description :  API methodsUtilities
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
        <title>API - Methods & Utilities</title> 
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
                        <h1>Method & Utilities</h1>
                        <p>
						전자정부 모바일 표준프레임워크는 $.mobile 객체에 대한 메소드와 속성들을(properties) 제공한다.
                        </p>
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>$.mobile.changePage (method)</h2>
                        <p>프로그램 코드 상에서 페이지를 이동할 수 있도록 지원하는 메소드이다. 
                        	주로 화면전환, 페이지 로딩 등의 기능이 가능한 환경에서 링크 클릭이나 폼 전송을 할 때 내부적으로 사용된다.</p>
                        
                        <dl class="egov-deth3">
                            <dt>Arguments</dt>
                            <dd class="egovBul">to (string or object, required)</dd>
   							<dd class="egovArr2">String: 절대 또는 상대 URL(“about/us.html”)</dd>
   							<dd class="egovArr2">Object: jQuery collection object. ($("#about"))</dd>
                            <dd class="egovBul">options (object, optional)</dd>
                            <dd class="egovArr2">Properties:</dd>
                            <dd>
                            	<ul class="egov-deth4">
   									<li><code>transition</code> (string,   default: $.mobile.defaultPageTransition)   
                   			 			페이지를 나타내기 위한 화면전환(transition)이다.</li>
   									<li><code>reverse</code> (boolean, default:    false) 페이지를 나타날 때 화면전환(transition)이 일어나는 방향을 결정한다</li>
   									<li><code>changeHash</code> (boolean,  default:    true) 주소창의 hash가 업데이트될 필요가 있는 지 결정한다.</li>
   									<li><code>role</code> (string, default:    undefined)   페이지를 화면에 출력할 때 사용되는 data-role 값이다. 
                           			각 요소에 정의된 @data-role 속성 값에 의존적이며 default 값은 ‘undefined’ 이다.</li>
                           			<li><code>pageContainer</code> (jQuery collection, default: $.mobile.pageContainer) 페이지를 포함하고 있어야 할 요소들을 식별한다.</li>
                           			<li><code>type</code> (string, default: "get") 페이지의 요청을 만들 때 method가 ‘get’ 또는 ‘post’ 방식인 지 식별한다.
                            		(changePage()의 to 인자(argument) 값이 URL일 때 사용된다.)</li>
                            		<li><code>data</code> (object or   string, default: undefined) Ajax 페이지 요청과 함께 전달될 데이터이다.
                            		(changePage()의 to 인자(argument) 값이 URL일 때 사용된다.)</li>
                            		<li><code>reloadPage</code> (boolean, default: false) 페이지를 리로드(reload)하며 이미 페이지 컨테이너(page container)의 DOM에 속해있는 페이지라도 리로드를 수행한다.
                            		(changePage()의 to 인자(argument) 값이 URL일 때 사용된다.)</li>
   								</ul>
                            </dd>
                            <dt>Examples</dt>
                        </dl>
                        <div class="egov-deth2">
                     		<ul class="link">
                             <li>//transition to the "about us" page with a slideup transition</li>   
                             <li>$.mobile.changePage( "about/us.html", { transition: "slideup"} );</li>
                             <li><br></li>
                             <li>//transition to the "search results" page, using data from a form with an ID of "search""</li>      
                             <li>$.mobile.changePage( "searchresults.php", {</li>
                             <li class="egov-txtIn1">type: "post",</li>
                             <li class="egov-txtIn1">data: $("form#search").serialize()</li>
                             <li>});</li>   
                             <li></li>
                             <li>//transition to the "confirm" page with a "pop" transition without tracking it in history</li>           
                             <li>$.mobile.changePage( "../alerts/confirm.html", {</li>
                             <li class="egov-txtIn1">transition: "pop",</li>
                             <li class="egov-txtIn1">reverse: false,</li>
                             <li class="egov-txtIn1">changeHash: false</li>
                             <li>});</li>
                           </ul>
                       </div>
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>$.mobile.loadPage (method)</h2>
                        <p>외부 페이지를 로드하고,DOM에 추가한다. 이 method는 첫번째 인수로 URL이 올 때 changePage() 함수를 통해 
				                        내부적으로 호출된다. 이 함수는 현재 활성화된 페이지에는 영향을 주지 않고, 백그라운드에서 페이지를 로드 할 때 사용된다.
				                        이 함수는 페이지가 로딩되고, 문서에 추가 된 후에 미리 정의된 객체를 리턴 한다.</p>
                        <dl class="egov-deth3">
                            <dt>Arguments</dt>
                            <dd class="egovBul">url (string, required)상대 또는 절대 URL</dd>
                            <dd class="egovBul">options (object, optional)</dd>
                            <dd class="egovArr2">Properties:</dd>
                            <dd>
                            	<ul class="egov-deth4">
   									<li><code>role</code> (string, default: undefined) 페이지를 화면에 출력할 때 사용되는 data-role 값이다. 
										 각 요소에 정의된 @data-role 속성 값에 의존적이며 default 값은 ‘undefined’ 이다.</li>
   									<li><code>pageContainer</code> (jQuery collection, default: $.mobile.pageContainer) 
									페이지가 로드된 후 페이지를 포함하고 있어야 할 요소들을 식별한다.</li>
   									<li><code>type</code> (string, default: "get") 페이지의 요청을 만들 때 method가 ‘get’ 또는 ‘post’ 방식인 지 식별한다.</li>
   									<li><code>data</code> (object or   string, default: undefined) 
									Ajax 페이지 요청과 함께 전달될 데이터이다</li>
                           			<li><code>reloadPage</code> (boolean, default: false) 페이지를 리로드(reload)하며 이미 페이지 컨테이너(page container)의 DOM에 속해있는 페이지라도 리로드를 수행한다.</li>
   								</ul>
                            </dd>
                            <dt>Examples</dt>
                        </dl>
                        <div class="egov-deth2">
                      		<ul class="link">
	                           <li>//load the "about us" page into the DOM</li>         
	                           <li>$.mobile.loadPage( "about/us.html" );</li>  
	                           <li><br></li>
	                           <li>//load a "search results" page, using data from a form with an ID of "search""</li>  
	                           <li>$.mobile.loadPage( "searchresults.php", {</li>
	                           <li class="egov-txtIn1">type: "post",</li>
	                           <li class="egov-txtIn1">data: $("form#search").serialize()</li>
	                           <li>});</li>
                       		</ul>
                       </div>
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>jqmData(), jqmRemoveData(), and jqmHasData() (method)</h2>
                        
                        <dl class="egov-deth3">
                            <dt>Arguments</dt>
                            <dd>
                                jqmData(), jqmRemoveData()는 jquery core의 data와 removeData이다. Data 속성의 setting와 getting를 자동으로
                                만들어 준다.
                            </dd>
                             <dt>Examples</dt>
                            <dd>
                                $("div[data-role='page']") 대신 $("div:jqmData(role='page')") 또는
                                $("div[data-"+ $.mobile.ns +"role='page']")를 사용 가능 하다.
                            </dd>
                        </dl>
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>$.mobile.showPageLoadingMsg ()</h2>
                        <p>페이지 로딩 메시지를 보여준다.</p>
                        
                        <dl class="egov-deth3">
                            <dt>Examples</dt>	    
                        </dl>
                        <div class="egov-deth2">
                       		<ul class="link">
                         	<li>//cue the page loader</li>           
                         	<li>$.mobile.showPageLoadingMsg();</li>
                         	</ul>  
                        </div>
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>$.mobile.hidePageLoadingMsg ()</h2>
                        <p>페이지 로딩 메시지를 숨긴다.</p>
                        
                        <dl class="egov-deth3">
                            <dt>Examples</dt>
                        </dl>
                        <div class="egov-deth2">
                      		<ul class="link">
                            <li>//cue the page loader</li>         
                            <li>$.mobile.hidePageLoadingMsg();</li>
                        	</ul>
                       	</div>
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>$.mobile.path.parseUrl (method)</h2>
                        <p> URL을 파싱하는 함수이다. URL의 각 요소(data)에 접근을 용이하게 하며 파싱할 때 해당 값이 없으면 항목에 빈 String 값으로 채워진다.
                          (예 protocol, host 등)
                          또한 권한이 없는 URL을 파싱 할 때는 protocol/scheme 콜론 뒤에 데이터가 포함된다. 
                        </p>
                        
                        <dl class="egov-deth3">
                            <dt>Arguments</dt>
                            <dd class="egovBul">url (string, required)상대 또는 절대 URL</dd>
                            <dd class="egovBul">Return Value</dd>
                            <dd>문자열 형식의 다양한 URL 컴포넌트를 포함한 객체를 반환한다. 
								객체의 속성은 브라우저의 location 객체를 따른다.</dd>
                        </dl>
                        <dl class="egov-deth5">
                       		<dt>hash</dt>
                       		<dd>‘#’ 문자(character)를 포함하는 URL 컴포넌트의 fragment 이다.</dd>
                       		<dt>host</dt>
                       		<dd>URL의 host와 포트 번호이다.</dd>
                       		<dt>hostname</dt>
                       		<dd>URL에 포함된 host 이름이다.</dd>
                       		<dt>href</dt>
                       		<dd>분석된 URL 원본이다.</dd>
                       		<dt>pathname</dt>
                       		<dd>URL에 의해 참조되는 디렉터리 또는 파일의 경로이다.</dd>
                       		<dt>port</dt>
                       		<dd>URL 내부에서 식별된 포트이다. 사용되는 프로토콜에 의해 default 포트를 사용할 수 있으므로 
								대부분의 빈 문자열로 표시된다.</dd>
                       		<dt>protocol</dt>
                       		<dd>‘:’ 문자(character)를 포함하는 URL을 지원하는 프로토콜이다.</dd>
                       		<dt>search</dt>
                       		<dd>‘?’ 문자(character)를 포함한 URL의 query 컴포넌트이다.$.mobile.path.parseUrl() 메소드는 개발자가 접근 가능한 주요 형식의 URL 뿐만 아니라 
                 				기타 컴포넌트에 대한 접근을 지원하는 속성도 제공한다 </dd>
                       		<dt>authority</dt>
                       		<dd>URL의 username, password, host component 이다.</dd>
                       		<dt>directory</dt>
                       		<dd>파일명을 제외한 pathname 의 디렉터리 컴포넌트이다.</dd>
                       		<dt>domain</dt>
                       		<dd>URL의 프로토콜, 권한(authority)에 관련된 컴포넌트이다.</dd>
                       		<dt>filename</dt>
                       		<dd>디렉터리를 제외한 pathname 내부의 파일명이다.</dd>
                       		<dt>hrefNoHash</dt>
                       		<dd>fragment(hash) 컴포넌트를 제외한 URL의 원본이다.</dd>
                       		<dt>hrefNoSearch</dt>
                       		<dd>query(search) 와 fragment(hash)를 제외한 URL의 원본이다.</dd>
                       		<dt>password</dt>
                       		<dd>권한(authority) 컴포넌트 내부에 포함된 password 이다.</dd>
                       		<dt>username</dt>
                       		<dd>권한(authority) 컴포넌트 내부에 포함된 username 이다.</dd>
                        </dl> 
   						<dl class="egov-deth3">
                            <dt>Examples</dt>
	                    </dl>
	                    <div class="egov-deth2">
               	    		<ul class="link">
	                           <li>// Parsing the Url below results an object that is returned with the</li>
	                           <li>// following properties:</li>
	                           <li>//</li>
	                           <li>//  obj.href:         http://jblas:password@mycompany.com:8080/mail/inbox?msg=1234&type=unread#msg-content</li>
	                           <li>//  obj.hrefNoHash:   http://jblas:password@mycompany.com:8080/mail/inbox?msg=1234&type=unread</li>
	                           <li>//  obj.hrefNoSearch: http://jblas:password@mycompany.com:8080/mail/inbox</li>
	                           <li>//  obj.domain:       http://jblas:password@mycompany.com:8080</li>
	                           <li>//  obj.protocol:     http:</li>
	                           <li>//  obj.authority:    jblas:password@mycompany.com:8080</li>
	                           <li>//  obj.username:     jblas</li>
	                           <li>//  obj.password:     password</li>
	                           <li>//  obj.host:         mycompany.com:8080</li>
	                           <li> //  obj.hostname:     mycompany.com</li>
	                           <li> //  obj.port:         8080</li>
	                           <li> //  obj.pathname:     /mail/inbox</li>
	                           <li> //  obj.directory:    /mail/</li>
	                           <li> //  obj.filename:     inbox</li>
	                           <li>//  obj.search:       ?msg=1234&type=unread</li>
	                           <li> //  obj.hash:         #msg-content</li>
	                           <li><br></li>
	                           <li><strong>var obj = $.mobile.path.parseUrl("http://jblas:password@mycompany.com:8080/mail/inbox?msg=1234");</strong></li>
                          </ul>
                       </div>
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>$.mobile.path.makePathAbsolute (method)</h2>
                        <p>상대경로를 절대 경로로 바꿔주는 메소드 유틸리티 함수이다.</p>
                        
                        <dl class="egov-deth3">
                            <dt>Arguments</dt>
                            <dd>
                                relPath (string, required) 파일 또는 디렉터리의 상대경로<br>
                                absPath (string, required) An absolute file or relative path to resolve against.
                            </dd>
                            
                            <dt>Return Value</dt>
                            <dd>
								 상대경로에 대한 절대경로를 문자열로 반환한다.
                            </dd>
                            
                            <dt>Examples</dt>
                        </dl>
                        <div class="egov-deth2">
                        	<ul class="link">
                            <li>// Returns: /a/b/c/file.html</li>
                            <li>var absPath = $.mobile.path.makePathAbsolute("file.html", "/a/b/c/bar.html");</li>
                            <li><br></li>
                            <li>// Returns: /a/foo/file.html</li>
                            <li>var absPath = $.mobile.path.makePathAbsolute("../../foo/file.html", "/a/b/c/bar.html");</li>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>$.mobile.path.makeUrlAbsolute (method)</h2>
                        <p>상대 경로 URL을 절대경로 URL로 변경하는 유틸리티 메소드 이다.</p>
                        
                        <dl class="egov-deth3">
                            <dt>Arguments</dt>
                            <dd>
                                relUrl (string, required) 상대 URL<br>
                                absUrl (string, required) An absolute URL to resolve against.
                            </dd>
                            
                            <dt>Return Value</dt>
                            <dd>상대 URL에 대한 절대 URL을 문자열로 반환한다.</dd>
                            
                            <dt>Examples</dt>
                        </dl>
                        <div class="egov-deth2">
                          	<ul class="link">
                               <li>// Returns: http://foo.com/a/b/c/file.html</li>
                               <li>var absUrl = $.mobile.path.makeUrlAbsolute("file.html", "http://foo.com/a/b/c/test.html");</li>
                               <li><br></li>
                               <li>// Returns: http://foo.com/a/foo/file.html</li>
                               <li>var absUrl = $.mobile.path.makeUrlAbsolute("../../foo/file.html", "http://foo.com/a/b/c/test.html");</li>
                               <li><br></li>
                               <li>// Returns: http://foo.com/bar/file.html</li>
                               <li>var absUrl = $.mobile.path.makeUrlAbsolute("//foo.com/bar/file.html", "http://foo.com/a/b/c/test.html");</li>
                               <li><br></li>
                               <li>// Returns: http://foo.com/a/b/c/test.html?a=1&b=2</li>
                               <li>var absUrl = $.mobile.path.makeUrlAbsolute("?a=1&b=2", "http://foo.com/a/b/c/test.html");</li>
                               <li><br></li>
                               <li>// Returns: http://foo.com/a/b/c/test.html#bar</li>
                               <li>var absUrl = $.mobile.path.makeUrlAbsolute("#bar", "http://foo.com/a/b/c/test.html");</li>
                              </ul>
                         </div>
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>$.mobile.path.isSameDomain (method)</h2>
                        <p>두가지 URL을 비교해서 같은 도메인인지 판단하여 Boolean 값을 리턴한다..</p>
                        
                        <dl class="egov-deth3">
                            <dt>Arguments</dt>
                            <dd>
                                url1 (string, required) 상대 URL<br>
                                url2 (string, required) 절대 URL (An absolute URL to resolve against.)
                            </dd>
                            
                            <dt>Return Value</dt>
                            <dd>
								도메인이 같으면 true를 반환하고 같지 않으면 false를 반환한다.
                            </dd>
                            
                            <dt>Examples</dt>
                            <div class="egov-deth2">
                            	<ul class="link">
	                                <li>// Returns: true</li>
	                                <li>var same = $.mobile.path.isSameDomain("http://foo.com/a/file.html", "http://foo.com/a/b/c/test.html");</li>
	                                <li><br></li>
	                                <li>// Returns: false</li>
	                                <li>var same = $.mobile.path.isSameDomain("file://foo.com/a/file.html", "http://foo.com/a/b/c/test.html");</li>
	                                <li><br></li>
	                                <li>// Returns: false</li>
	                                <li>var same = $.mobile.path.isSameDomain("https://foo.com/a/file.html", "http://foo.com/a/b/c/test.html");</li>
	                                <li><br></li>
	                                <li>// Returns: false</li>
	                                <li>var same = $.mobile.path.isSameDomain("http://foo.com/a/file.html", "http://bar.com/a/b/c/test.html");</li>    
                                </ul>                          
                           </div>
                        </dl>
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>$.mobile.path.isRelativeUrl (method)</h2>
                        <p>URL이 상대 경로인지 판단하여 Boolean 값을 리턴한다.</p>
                        
                        <dl class="egov-deth3">
                            <dt>Arguments</dt>
                            <dd>
                                url (string, required) 상대 또는 절대 URL
                            </dd>
                            
                            <dt>Return Value</dt>
                            <dd>
								 상대 URL이면 true를 반환하고 절대 URL이면 false를 반환한다.
                            </dd>
                            
                            <dt>Examples</dt>
                        </dl>
                        <div class="egov-deth2">
                          	<ul class="link">
                               <li>// Returns: false</li>
                               <li>var isRel = $.mobile.path.isRelativeUrl("http://foo.com/a/file.html");</li>
                               <li><br></li>
                               <li>// Returns: true</li>
                               <li>var isRel = $.mobile.path.isRelativeUrl("//foo.com/a/file.html");</li>
                               <li><br></li>
                               <li>// Returns: true</li>
                               <li>var isRel = $.mobile.path.isRelativeUrl("/a/file.html");</li>
                               <li><br></li>
                               <li>// Returns: true</li>
                               <li>var isRel = $.mobile.path.isRelativeUrl("file.html");</li>
                               <li><br></li>
                               <li>// Returns: true</li>
                               <li>var isRel = $.mobile.path.isRelativeUrl("?a=1&b=2");</li>
                               <li><br></li>
                               <li>// Returns: true</li>
                              	<li>var isRel = $.mobile.path.isRelativeUrl("#foo");</li>        
                              </ul>                        
						</div>
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>$.mobile.path.isAbsoluteUrl (method)</h2>
                        <p>URL이 절대 경로인지 판단하여 Boolean 값을 리턴한다..</p>
                        
                        <dl class="egov-deth3">
                            <dt>Arguments</dt>
                            <dd>
                                url (string, required) 상대 또는 절대 URL
                            </dd>
                            
                            <dt>Return Value</dt>
                            <dd>
								 절대 URL이면 true를 반환하고 상대 URL이면 false를 반환한다.
                            </dd>
                            
                            <dt>Examples</dt>
                        </dl>
                        <div class="egov-deth2">
                         	<ul class="link">
                              <li>// Returns: true</li>
                              <li>var isAbs = $.mobile.path.isAbsoluteUrl("http://foo.com/a/file.html");</li>
                              <li><br></li>
                              <li>// Returns: false</li>
                              <li>var isAbs = $.mobile.path.isAbsoluteUrl("//foo.com/a/file.html");</li>
                              <li><br></li>
                              <li>// Returns: false</li>
                              <li>var isAbs = $.mobile.path.isAbsoluteUrl("/a/file.html");</li>
                              <li></li>
                              <li>// Returns: false</li>
                              <li>var isAbs = $.mobile.path.isAbsoluteUrl("file.html");</li>
                              <li><br></li>
                              <li>// Returns: false</li>
                              <li>var isAbs = $.mobile.path.isAbsoluteUrl(s"?a=1&b=2");</li>
                              <li><br></li>
                              <li>// Returns: false</li>
                              <li>var isAbs = $.mobile.path.isAbsoluteUrl("#foo");</li>            
                             </ul>                
                         </div>
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>$.mobile.base (methods, properties)</h2>
                        <p>일반화된 base element로 동작 하도록 한다.</p>
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>$.mobile.silentScroll (method)</h2>
                        <p>스크롤 이벤트 리스너를 실행시키지 않고 인수로 지정한  Y 좌표로 스크롤한다.</p>
                        
                        <dl class="egov-deth3">
                            <dt>Arguments</dt>
                            <dd>
                                yPos (number, defaults to 0). 스크롤 할 Y 좌표 값
                            </dd>
                            
                            <dt>Examples</dt>
                        </dl>
                        <div class="egov-deth2">
                        	<ul class="link">
                             <li>//scroll to Y 100px</li>        
                             <li>$.mobile.silentScroll(100);</li>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>$.mobile.addResolutionBreakpoints (method)</h2>
                        <p>HTML 요소에 추가될 클래스의 최소 최대 너비에 대한 범위를 지정한다. 
                               추가된 min/max width classes에 breakpoint를 추가한다.
                        </p>
                        
                        <dl class="egov-deth3">
                            <dt>Arguments</dt>
                            <dd>
                                values (숫자 또는 배열 값). resolution 클래스에 추가될 숫자 또는 배열을 전달한다. 
								자세한 내용은 Orientation & resolution targeting 을 참조한다. 
                            </dd>
                            
                            <dt>Examples</dt>
                        </dl>
                        <div class="egov-deth2">
                        	<ul class="link">
                             <li>//add a 400px breakpoint</li>          
                             <li>$.mobile.addResolutionBreakpoints(400);</li>
                             <li>//add 2 more breakpoints</li>          
                             <li>$.mobile.addResolutionBreakpoints([600,800]);</li>
                            </ul>
                        </div>
                    </div>

                    <div class="egov-deth1">
                        <h2>$.mobile.activePage (property)</h2>
                        <p>화면에 보여지고 있는 현재 페이지의 참조를 리턴한다.</p>
                    </div>
                    
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