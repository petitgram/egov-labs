<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
    <head>
        <title>UX Component</title>
        <!--
			** TODO [Step 1-01] Viewport 설정
		-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        
        <!--
			** TODO [Step 1-02] Library Import
		-->
        <!-- eGovFrame Common import -->
		<link rel="stylesheet" href="<c:url value='/css/egovframework/mbl/cmm/jquery.mobile-1.3.2.css' />" />
		<link rel="stylesheet" href="<c:url value='/css/egovframework/mbl/cmm/EgovMobile-1.3.2.css' />" />
		<script type="text/javascript" src="<c:url value='/js/egovframework/mbl/cmm/jquery-1.9.1.js' />"></script>
		<script type="text/javascript" src="<c:url value='/js/egovframework/mbl/cmm/jquery.mobile-1.3.2.js' />"></script>
		<script type="text/javascript" src="<c:url value='/js/egovframework/mbl/cmm/EgovMobile-1.3.2.js' />"></script>

		 <!--
			** TODO [Step 6-01]
				Date Picker를 위한 js, css 파일 Import   
				Date/Time Picker를 사용하기 위해 스크립트 가장 아래에 다음의 태그를 적용한다.
		 -->
		<link type="text/css" rel="stylesheet" href="<c:url value="/css/egovframework/mbl/cmm/datepicker/jqm-datebox.css" />" />
		<script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/datepicker/jqm-datebox.core.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/datepicker/jqm-datebox.mode.calbox.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/datepicker/jqm-datebox.mode.datebox.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/datepicker/jqm-datebox.mode.flipbox.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/js/egovframework/mbl/cmm/datepicker/jquery.mobile.datebox.i18n.ko.utf8.js"/>"></script>
		
	</head>

    <body>

        <!-- page start -->
        <div data-role="page" data-theme="d" id="main">

            <!-- header start -->
            <div data-role="header" data-theme="b">
                <h1>UX Component 실습</h1>
            </div>
            <!-- header end -->

            <!-- content start -->
            <div data-role="content" id="main">
                <!-- 
                ** TODO [Step 2]
                	기본버튼 추가 : <a href="#" data-role="button">Button</a>
                	버튼 색상 변경 : data-theme="f"
                	버튼 형태 변경 : data-corners="false"
                	버튼 아이콘 추가 : data-icon="star"
                ** TODO [Step 3-01]	
                	모바일 실행환경 가이드 url 추가 : http://m.egovframe.go.kr/mguide/guide/guide.do												
					새창에서 열기 : target="home"
                --> 
                
                
                <!--
                ** TODO [Step 3-02]
                	도메인 내부 링크 url 추가 : /internalLinkPage.jsp
                	AJAX 통신 해제 : data-ajax="false"
                -->
                <a href="" data-role="button" data-theme="e">도메인 내부 링크</a>
                
                <!--
                ** TODO [Step 3-03]
                	페이지 내부 링크 url 추가 : #sub
                	다이얼로그 속성 추가 : data-rel="dialog"
                	다이얼로그 효과 변경 : data-transition="pop"
                -->
                <a href="" data-role="button" data-theme="g">페이지 내부 링크</a>
                
				<form id="form-1" action="#" method="get">
					<!--
					** TODO [Step 4-01]
						레이블과 인풋이 짝으로 이룰 수 있도록
						<label> Tag의 for 속성과 <input> Tag의 id 속성을 일치시켜 사용한다.
						lebel Tag에 추가 : for="text" 
					-->
					<div data-role="fieldcontain">
						<label >아이디 :</label>
						<input type="text" id="text"/>
					</div>
					<!--
					** TODO [Step 4-02]
						Input 박스 내부 부가설명 추가 : placeholder="Password"
					-->
					<div data-role="fieldcontain">
						<label for="password">비밀번호 :</label>
						<input type="password" id="password"/>
					</div>
					<!--
					** TODO [Step 4-03]
						색상변경 : data-theme="e"
						배경색 변경 : data-track-theme="g"
						이동표시 : data-highlight="true"
					-->
					<div data-role="fieldcontain">
						<button id="submit" type="submit" data-theme="a">로그인</button>
					</div>
					<div data-role="fieldcontain">
						<label for="slider7">Slider:</label>
						<input type="range" id="slider7" value="0" min="0" max="100"/>
					</div>

					<!--
					** TODO [Step 5-01]
						팝업형태로 변경 : data-native-menu="false"
					** TODO [Step 5-02]
						기본선택 지정 : <option></option>
					** TODO [Step 5-03]
						특정옵션 비활성화 : disabled="disabled"
					** TODO [Step 5-04]
						다중선택 : multiple="multiple"
					-->
					<div data-role="fieldcontain">
						<label for="select-choice-1" class="select"></label>
						<select name="select-choice-1" id="select-choice-1">
							<option value="apple">Apple</option>
							<option value="orange">Orange</option>
							<option value="banana">Banana</option>
							<option value="mango">Mango</option>
						</select>
					</div>
					
				</form>

				<!--
				** TODO [Step 6-02]
					달력형태로 변경 : data-options='{"mode": "calbox"}'
					색상 변경 : data-options='{"mode": "datebox", "themeHeader": "b", "themeButton": "e"}'
				-->
				<div data-role="fieldcontain">
					<label for="mydate1">Date Picker</label>
					<input name="mydate" id="mydate1" type="date" data-role="datebox" data-options='{"mode": "datebox"}'/>
				</div>
				<!--
				** TODO [Step 6-03]
					12시간단위 형태로 변경 : data-options='{"mode": "timebox", "overrideTimeOutput": "%l:%M %p"}'
					색상 변경 : data-options='{"mode": "timebox", "overrideTimeOutput": "%l:%M %p", "themeHeader": "b", "themeButton": "e"}'
				-->
				<div data-role="fieldcontain">
					<label for="mydate2">Time Picker</label>
					<input name="mydate" id="mydate2" type="date" data-role="datebox" data-options='{"mode": "timebox", "overrideTimeFormat": 24 }'/>
				</div>
				
            </div>
            <!-- content end -->

            <!-- footer start -->
            <div data-role="footer" data-theme="b">
                <h4>m.egovframe.go.kr</h4>
            </div>
            <!-- footer end -->

		</div>
		<!-- page end -->
            
		<!-- 페이지 내부 이동을 위한 sub page start -->
		<div data-role="page" data-theme="d" id="sub">

			<!-- header start -->
			<div data-role="header" data-theme="g">
			<h1>Sub Page</h1>
			</div>
			<!-- header end -->
			
			<!-- content start -->
			<div data-role="content">
			<a href="#" data-rel="back">Go Main Page</a>
			</div>
			<!-- content end -->

		</div>
		<!-- sub page end -->            

    </body>
    
</html>