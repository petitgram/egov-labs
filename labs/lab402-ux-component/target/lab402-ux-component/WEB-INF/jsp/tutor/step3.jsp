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
            <div data-role="header" data-theme="e" id="main">
                <a href="/tutor/step2.do" data-ajax="false" data-icon="arrow-l">Back</a>
                <h1>Step3</h1>
				<a href="/tutor/step4.do" data-ajax="false" data-icon="arrow-r" class="ui-btn-right">Next</a>
            </div>
            <!-- header end -->

            <!-- content start -->
            <div data-role="content">
            	<ul data-role="listview" data-inset="true">
					<li data-role="list-divider">List Divider</li>
					<li><a href="/start.do">Link</a></li>
					<li>Count Bubble<span class="ui-li-count">1800</span></li>
					<li data-role="list-divider">Beer</li>
					<li>
						<img src="/images/egovframework/mbl/beer.png" alt="coffee" class="ui-li-icon">
						Icon
					</li>
					<li>
						<img src="/images/egovframework/mbl/thumbnail.jpg">
        				<h2>Thumbnail</h2>
        				<p>Beer</p>
					</li>
					<li>
						<h2>주요내용</h2>
        				<p><strong>세부내용강조</strong></p>
        				<p>세부내용</p>
        				<p class="ui-li-aside"><strong>추가요소설명</strong></p>
					</li>
				</ul>
			</div>
            <!-- content end -->

            <!-- footer start -->
            <div data-role="footer" data-theme="e" data-position="fixed" id="fixedFooter">
				<a href="/practice/step3.do" data-ajax="false" data-icon="info" class="ui-btn-left">Practice</a>
				<h1>m.egovframe.go.kr</h1>
				<a href="/start.do" data-ajax="false" data-icon="home" class="ui-btn-right">Home</a>
            </div>
            <!-- footer end -->
        </div>
        <!-- page end -->
    </body>
</html>