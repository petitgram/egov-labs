<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
    <head>
        <title>eGovFrame</title> 
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- eGovFrame Common import -->
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/cmm/jquery.mobile-1.0b3.min.css" />" />
        <link rel="stylesheet" href="<c:url value="/css/egovframework/mbl/cmm/EgovMobile.css" />" />
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery-1.6.2.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/jquery.mobile-1.0b3.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/EgovMobile.js" />"></script>
    
        <!-- guide import -->
        <link rel="stylesheet"  href="<c:url value="/css/egovframework/mbl/rte/guide/guide.css" />">
        <script type="text/javascript"  src="<c:url value="/js/egovframework/mbl/rte/guide/guide.js"/>"></script>
        
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
            <div data-role="content" >
                <h1>시스템 에러</h1>
                <p>관리자에게 문의하세요</p>
                <br>
                <a href="#"  data-role="button" data-rel="back">돌아가기</a>
            </div>
            <!-- content end -->
            
            <!-- footer start -->
            <div data-role="footer" data-theme="z" data-position="fixed">
                 <h4 class="main">Copyright(c)2011 Ministry of Public Administration and Security.</h4>
            </div>
            <!-- footer end --> 
            
        </div>
        <!-- page end -->               
    </body>
</html>             