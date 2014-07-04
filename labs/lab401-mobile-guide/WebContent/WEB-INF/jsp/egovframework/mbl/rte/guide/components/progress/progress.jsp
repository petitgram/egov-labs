<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String progress = (request.getParameter("progress") == null) ? "dialog" : request.getParameter("progress");
    String dataTheme = (request.getParameter("dataTheme") == null) ? "a" : request.getParameter("dataTheme");
%>
<%--
  Class Name : progress.jsp
  Description :  UX progress/dialog bar component
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
        <title>UX Component - Processing Dialog / Bar</title> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />    
        
        <!-- eGovFrame Common import -->
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/cmm/jquery.mobile-1.0b3.min.css" />" />
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/cmm/EgovMobile.css" />" />
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery-1.6.2.min.js"/>"></script>
		<!-- History.js -->
		<script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery.history.js"/>"></script> 
        
        <script type="text/javascript" >    
            $(document).bind("mobileinit", function(){
            	<% if (progress.equals("Bar")) { %>
                $.mobile.progressBar = true;
                <% } %>
                $.mobile.progressTheme = '<%= dataTheme %>';
            });
        </script>
        
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery.mobile-1.0b3.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/EgovMobile.js"/>"></script>
        <!-- guide import -->
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/rte/guide/guide.css" />">
        <script type="text/javascript"  src="<c:url value="/js/egovframework/mbl/rte/guide/guide.js"/>"></script>

    </head>
    
    <body>
          
        <!-- page start -->
        <div data-role="page" class="type-index">
        
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
                        <h1>Progress Dialog / Bar</h1>           
                        <p>
                            Progress Dialog 와 Bar 는 모바일 Page 전환 시 진행 상태를 표시해 주는 역할을 한다.
                        </p>
                    </div>
                    
                    <div class="egov-deth1">
                        
                        <form>
                            <div data-role="fieldcontain">
                                <label for="dataTheme" class="select">Progress Type : </label>
                                <select name="progress" id="progress" onchange="javascript:document.forms[0].submit();">
                                    <option value="Dialog" <%= (progress.equals("Dialog")) ? "selected" : "" %>>Progress Dialog</option>
                                    <option value="Bar" <%= (progress.equals("Bar")) ? "selected" : "" %>>Progress Bar</option>
                                </select>
                            </div>
                            <div data-role="fieldcontain">
                                <label for="dataTheme" class="select">Theme : </label>
                                <select name="dataTheme" id="dataTheme" onchange="javascript:document.forms[0].submit();">
	                                <option value="a" <%= (dataTheme.equals("a")) ? "selected" : "" %>>data-theme="a"</option>
	                                <option value="b" <%= (dataTheme.equals("b")) ? "selected" : "" %>>data-theme="b"</option>
	                                <option value="c" <%= (dataTheme.equals("c")) ? "selected" : "" %>>data-theme="c"</option>
	                                <option value="d" <%= (dataTheme.equals("d")) ? "selected" : "" %>>data-theme="d"</option>
	                                <option value="e" <%= (dataTheme.equals("e")) ? "selected" : "" %>>data-theme="e"</option>
	                                <option value="f" <%= (dataTheme.equals("f")) ? "selected" : "" %>>data-theme="f"</option>
	                                <option value="g" <%= (dataTheme.equals("g")) ? "selected" : "" %>>data-theme="g"</option>
                                </select>
                            </div>                            
                        </form>
                                                    
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>Progress <%= progress %></h2>
                        <p>
                            <% if (progress.equals("Dialog")) { %>
                            Progress Dialog 는 Ajax 통신을 이용할 경우 Default 로 나타나며 자바스크립트를 통해
							수동으로 호출 하는 방법은 아래 샘플과 같다.
                            <% } else { %>
                            Progress Bar 는 Ajax 통신을 이용할 경우 표출 되고 설정을 통해 Default 로 사용 가능하며, 수동으로 호출 하는 방법은 아래의 샘플과 같다.<br>
                            <% } %>
                        </p>

                        <div class="egov-deth2">  
                        
                            <a href="<c:url value="/guide/guide.do"/>" data-role="button">페이지 이동 시 : Progress <%= progress %></a>

                            <div class="ui-grid-a">
                                <div class="ui-block-a"><a href="javascript:$.mobile.showPageLoadingMsg('<%= dataTheme %>');" data-role="button">Loading</a></div>
                                <div class="ui-block-b"><a href="javascript:$.mobile.hidePageLoadingMsg('<%= dataTheme %>');" data-role="button">Stop</a></div>
                            </div>
                                                        
                            <ul class="link">
                                <li>&lt;a href="/guide/guide.do" data-role="button"&gt;페이지 이동 시 : Progress <%= progress %>&lt;/a&gt;</li>

                                <li>&lt;a href="javascript:$.mobile.showPageLoadingMsg('<%= dataTheme %>');" data-role="button"&gt;Loading&lt;/a&gt;</li>
                                <li>&lt;a href="javascript:$.mobile.hidePageLoadingMsg('<%= dataTheme %>');" data-role="button"&gt;Stop&lt;/a&gt;</li>                                
                            </ul>
                                                        
                        </div>

                        <% if (progress.equals("Bar")) { %>
                        <p>
                            * Progress Bar를 사용하기 위해서는 아래와 같은 설정이 필요하다. 
                        </p>
                                                                                                
                        <div class="egov-deth2">                            
                            <ul class="link">
						        <li>&lt;script type="text/javascript" &gt;</li>    
						        <li class="egov-txtIn1">$(document).bind("mobileinit", function(){</li>
						        <li class="egov-txtIn2">$.mobile.progressBar = true;</li>
						        <li class="egov-txtIn1">});</li>
						        <li>&lt;/script&gt;</li><br>        
						        <li>&lt;script type="text/javascript" src="/js/egovframework/mbl/cmm/jquery.mobile-1.0b3.min.js"&gt;&lt;/script&gt;</li>
                            </ul>
                        </div>
                        <% } %>

                        <p>
                            * Progress Dialog / Bar 의 메시지를 변경 하기 위해서는 아래와 같은 설정이 필요하다.
                        </p>
                                                                                                
                        <div class="egov-deth2">                            
                            <ul class="link">
                                <li>&lt;script type="text/javascript" &gt;</li>    
                                <li class="egov-txtIn1">$(document).bind("mobileinit", function(){</li>
                                <li class="egov-txtIn2">$.mobile.loadingMessage('진행중..');</li>
                                <li class="egov-txtIn1">});</li>
                                <li>&lt;/script&gt;</li><br>        
                                <li>&lt;script type="text/javascript" src="/js/egovframework/mbl/cmm/jquery.mobile-1.0b3.min.js"&gt;&lt;/script&gt;</li>
                            </ul>
                        </div>
                                                                 
                        <p>
                            * 페이지 이동시 Progress Dialog / Bar 의 테마를 변경 하기 위해서는 아래와 같은 설정이 필요하다.
                        </p>
                                                                                                
                        <div class="egov-deth2">                            
                            <ul class="link">
                                <li>&lt;script type="text/javascript" &gt;</li>    
                                <li class="egov-txtIn1">$(document).bind("mobileinit", function(){</li>
                                <li class="egov-txtIn2">$.mobile.progressTheme = 'a~g';</li>
                                <li class="egov-txtIn1">});</li>
                                <li>&lt;/script&gt;</li><br>        
                                <li>&lt;script type="text/javascript" src="/js/egovframework/mbl/cmm/jquery.mobile-1.0b3.min.js"&gt;&lt;/script&gt;</li>
                            </ul>
                        </div>
                                                                        
                    </div>
                                 

                </div>
                <!-- content-primary end -->

                <!-- content-secondary start -->
                <div class="content-secondary"> 
                    <jsp:include page="../../componentMenu.jsp"></jsp:include>
                </div>          
                <!-- content-secondary start -->
                
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