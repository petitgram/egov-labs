<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
    <head>
        <title>UX-Component 2.7</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <!-- eGovFrame Common import -->
		<link rel="stylesheet" href="<c:url value='/css/egovframework/mbl/cmm/jquery.mobile-1.3.2.css' />" />
		<link rel="stylesheet" href="<c:url value='/css/egovframework/mbl/cmm/EgovMobile-1.3.2.css' />" />
		<script type="text/javascript" src="<c:url value='/js/egovframework/mbl/cmm/jquery-1.9.1.js' />"></script>
		<script type="text/javascript" src="<c:url value='/js/egovframework/mbl/cmm/jquery.mobile-1.3.2.js' />"></script>
		<script type="text/javascript" src="<c:url value='/js/egovframework/mbl/cmm/EgovMobile-1.3.2.js' />"></script>
    </head>

    <body>
        <!-- page start -->
        <div data-role="page" data-theme="c">

            <!-- header start -->
            <div data-role="header" data-theme="g" id="main">
                <a href="/practice/step2.do" data-ajax="false" data-icon="arrow-l">Back</a>
                <h1>Step3</h1>
				<a href="/practice/step4.do" data-ajax="false" data-icon="arrow-r" class="ui-btn-right">Next</a>
            </div>
            <!-- header end -->

            <!-- content start -->
            <div data-role="content">
            	<ul>
					<li>List Divider</li>
					<li>Linked</a></li>
					<li>Count Bubble</li>
					<li>List Divider</li>
					<li>Icon</li>
					<li>Thumbnail</li>
					<li>Formatted content</li>
				</ul>
			</div>
            <!-- content end -->

            <!-- footer start -->
            <div data-role="footer" data-theme="g" data-position="fixed" id="fixedFooter">
				<a href="/tutor/step3.do" data-ajax="false" data-icon="info" class="ui-btn-left">Tutor</a>
				<h1>m.egovframe.go.kr</h1>
				<a href="/start.do" data-ajax="false" data-icon="home" class="ui-btn-right">Home</a>
            </div>
            <!-- footer end -->
        </div>
        <!-- page end -->
    </body>
</html>