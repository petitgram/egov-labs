<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Class Name : divider.jsp
  Description :  UX list component
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.07.14    권자영          최초 생성
 
    author   : 모바일 실행환경 개발팀 권자영
    since    : 2011.07.06
--%>
<!DOCTYPE html> 
<html> 
    <head>
        <title>UX Component - List </title> 
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
                <a href="<c:url value="/guide/components/list/list.do"/>" data-icon="back" class="ui-btn-right" data-ajax="false">Back</a>
                <h1><img src="<c:url value="/images/egovframework/mbl/rte/guide/h1_logo.png"/>" /></h1>
            </div>  
            <!-- header end -->
			
			<!-- content start -->		
			<div data-role="content" data-theme="d">
			
				<!-- content-primary start -->
				<div class="content-primary">
					<div class="egov-deth1">
						<h2>List Divider</h2>
						<p><strong>data-role=”list-divider”</strong> 속성을 &lt;li&gt; Tag에 추가하면 하나의 리스트를 카테고리별로 구분할 수 있다. 
						기본적으로 리스트 구분에는 'b 테마'가 적용되며 <strong>data-dividertheme</strong> 속성을 통해서 색상을 변경할 수 있다.</p>
					
						<div class="egov-deth2">
							<ul data-role="listview" data-inset="true">
								<li data-role="list-divider">Coffee</li>
								<li><a href="#">Americano</a></li>
								<li><a href="#">Caffe Latte</a></li>
								<li><a href="#">Caffe Mocha</a></li>
								<li><a href="#">Caramel Macchiato</a></li>
								<li><a href="#">Affogato</a></li>
								<li data-role="list-divider">Icecream</li>
								<li><a href="#">vanilla</a></li>
								<li><a href="#">Yogurt</a></li>
								<li><a href="#">Strawberry</a></li>
								<li><a href="#">Fashion fruit</a></li>
								<li><a href="#">Chocolate</a></li>
							</ul>
							
							<ul class="link">
								<li>&lt;ul data-role="listview" data-inset="true"&gt;</li>
								<li class="egov-txtIn1">&lt;li data-role="list-divider"&gt;Coffee&lt;/li&gt;</li>
								<li class="egov-txtIn1">&lt;li&gt;&lt;a href="#"&gt;Americano&lt;/a&gt;&lt;/li&gt;</li>
								<li class="egov-txtIn1">&lt;li&gt;&lt;a href="#"&gt;Caffee Latte&lt;/a&gt;&lt;/li&gt;</li>
								<li class="egov-txtIn1">&lt;li&gt;&lt;a href="#"&gt;Caffee Mocha&lt;/a&gt;&lt;/li&gt;</li>
								<li class="egov-txtIn1">&lt;li&gt;&lt;a href="#"&gt;Caramel Macchiato&lt;/a&gt;&lt;/li&gt;</li>
								<li class="egov-txtIn1">&lt;li&gt;&lt;a href="#"&gt;Affogato&lt;/a&gt;&lt;/li&gt;</li>
								<li class="egov-txtIn1">&lt;li data-role="list-divider"&gt;Icecream&lt;/li&gt;</li>
								<li class="egov-txtIn1">&lt;li&gt;&lt;a href="#"&gt;vanilla&lt;/a&gt;&lt;/li&gt;</li>
								<li class="egov-txtIn1">&lt;li&gt;&lt;a href="#"&gt;Yogurt&lt;/a&gt;&lt;/li&gt;</li>
								<li class="egov-txtIn1">&lt;li&gt;&lt;a href="#"&gt;Strawberry&lt;/a&gt;&lt;/li&gt;</li>
								<li class="egov-txtIn1">&lt;li&gt;&lt;a href="#"&gt;Fashion fruit&lt;/a&gt;&lt;/li&gt;</li>
								<li class="egov-txtIn1">&lt;li&gt;&lt;a href="#"&gt;Chocolate&lt;/a&gt;&lt;/li&gt;</li>
								<li>&lt;/ul&gt;</li>
							</ul>
						</div>
					</div>

				</div>
				<!-- content-primary end -->
				
				<!-- content-secondary start -->
				<div class="content-secondary"> 
					<jsp:include page="listIndex.jsp"></jsp:include>
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