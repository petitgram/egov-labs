<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Class Name : form.jsp
  Description :  UX form component
  Modification Information

      수정일         수정자           수정내용
    -------------    --------    ---------------------
     2011.07.14    권자영          최초 생성
 
    author   : 모바일 실행환경 개발팀 권자영
    since    : 2011.07.06
--%>
<!DOCTYPE html> 
<html> 
    <head>
        <title>UX Component - Form</title> 
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
        
        <script type="text/javascript">
        function btnSubmit()
        {
            document.form8.submit();
        }

		</script>

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
                    <h1>Form</h1>
                        <p>HTML의 모든 폼 요소를 모바일 환경에 최적화된 UI로 제공한다.
                       	 폼을 사용할 때는 여러 페이지가 하나의 DOM 에 속할 수 있으므로 
                        id 속성을 사이트 범위에서 유일한 값으로 지정해야 한다.</p>
                    </div>
                                        
                    <div class="egov-deth1">
                        <h2>기본코드</h2> 
                        <p>전자정부 모바일 표준프레임워크를 이용하여 폼을 생성하면 레이블 및 폼 구성요소가 화면의 너비에 맞게 자동으로 배열된다.
               		         폼 요소 배열의 구성을 향상시키려면 <strong>&lt;div data-role="fieldcontain"&gt;</strong> Tag 내부에 레이블 및 폼 요소를 포함시킨다.</p>
                        
                        <div class="egov-deth2">
                            <form id="form-1" action="#" method="get">
                            <div data-role="fieldcontain">
                                <label for="text">Text : </label>
                                <input type="text" id="text"/>
                            </div>  
                            <div data-role="fieldcontain">
                                <label for="password">Password : </label>
                                <input type="password" id="password"/>
                            </div>
                            <div data-role="fieldcontain">  
                                <button id="submit" type="submit">Submit</button>
                            </div>
                            </form>     
                    
                            <ul class="link">
                                <li>&lt;form id="form-1" action="#" method="get"&gt;</li>
                                <li class="egov-txtIn1">&lt;div data-role="fieldcontain"&gt;</li>
                                <li class="egov-txtIn2">&lt;label for="text"&gt;Text :&lt;/label&gt;</li>
                                <li class="egov-txtIn2">&lt;input type="text" id="text"/&gt;</li>
                                <li class="egov-txtIn1">&lt;/div&gt;</li>
                                <li class="egov-txtIn1">&lt;div data-role="fieldcontain"&gt;</li>
                                <li class="egov-txtIn2">&lt;label for="password"&gt;Password :&lt;/label&gt;</li>
                                <li class="egov-txtIn2">&lt;input type="password" id="password"/&gt;</li>
                                <li class="egov-txtIn1">&lt;/div&gt;</li>
                                <li class="egov-txtIn1">&lt;div data-role="fieldcontain"&gt;</li>
                                <li class="egov-txtIn2">&lt;button id="submit" type="submit"&gt;Submit&lt;/button&gt;</li>
                                <li class="egov-txtIn1">&lt;/div&gt;</li>
                                <li>&lt;/form&gt;</li>                      
                            </ul>               
                        </div>                        
                    </div>

                    <div class="egov-deth1">
                        <h2>레이블과 폼 구성요소</h2>
                        <p>화면의 너비가 좁을 경우 레이블이 폼 구성요소의 상단에 위치하게 되고 
                        	화면의 너비가 넓을 경우에는 레이블과 폼 구성요소가 한 줄에 나타나게 된다.
                    	    이때 레이블과 폼 요소가 짝을 이룰 수 있도록 폼 구성요소의 <strong>id 속성과 &lt;label&gt; Tag의 for 속성 값</strong>을 일치시켜야 한다.</p>
                        
                        <div class="egov-deth2">
                            <form id="form-2" action="#" method="get">
                                <label for="text1">Text : </label>
                                <input type="text" id="text1"/>
                                
                                <label for="password1">Password : </label>
                                <input type="password" id="password1"/>
                                <label for="text2">Text : </label>
                                <input type="text" id="text2"/>
                                    
                                <label for="password2">Password : </label>
                                <input type="password" id="password2"/>
                                <button data-theme="b" id="submit" type="submit">Submit</button>
                            </form>
            
                            <ul class="link">
                                <li>&lt;form id="form-2" action="#" method="get"&gt;</li>
                                <li class="egov-txtIn1">&lt;label for="text1"&gt;Text : &lt;/label&gt;</li>
                                <li class="egov-txtIn1">&lt;input type="text" id="text1"/&gt;</li>
                                <li class="egov-txtIn1">&lt;label for="password1"&gt;Password :&lt;/label&gt;</li>
                                <li class="egov-txtIn1">&lt;input type="password" id="password1"/&gt;</li>
                                <li class="egov-txtIn1">&lt;label for="text2"&gt;Text : &lt;/label&gt;</li>
                                <li class="egov-txtIn1">&lt;input type="text" id="text2"/&gt;</li>
                                <li class="egov-txtIn1">&lt;label for="password2"&gt;Password :&lt;/label&gt;</li>
                                <li class="egov-txtIn1">&lt;input type="password" id="password2"/&gt;</li>
                                <li class="egov-txtIn1">&lt;button data-theme="b" id="submit" type="submit"&gt;Submit&lt;/button&gt;</li>
                                <li>&lt;/form&gt;</li>
                            </ul>                 
                        </div>                  
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>리스트 형태의 폼</h2>
                        <p>&lt;form&gt; Tag 내부에 리스트 태그(ul, ol)를 두고 <strong>&lt;li&gt; Tag에 폼 요소를 배치</strong>하여 
            	           리스트 형태로 구분된 폼을 생성할 수 있다.</p>
                        
                        <div class="egov-deth2">
                            <form id="form-4" action="#" method="get">
                                <ul data-role="listview" data-inset="true">
                                    <li data-role="fieldcontain">
                                        <label for="text">Text : </label>
                                        <input type="text" id="text"/>
                                    </li>
                                    <li data-role="fieldcontain">    
                                        <label for="password">Password : </label>
                                        <input type="password" id="password"/>
                                    </li>
                                    <li data-role="fieldcontain">                
                                        <label for="slider">Slider:</label>
                                        <input type="range" id="slider" value="0" min="0" max="100"  />
                                    </li>
                                    <li data-role="fieldcontain">
                                        <button data-theme="b" id="submit" type="submit">Submit</button>
                                    </li>
                                </ul>
                            </form>     
               
                            <ul class="link">
                                <li>&lt;form id="form-4" action="#" method="get"&gt;</li>
                                <li class="egov-txtIn1">&lt;ul data-role="listview" data-inset="true"&gt;</li>
                                <li class="egov-txtIn2">&lt;li data-role="fieldcontain"&gt;</li>
                                <li class="egov-txtIn3">&lt;label for="text"&gt;Text :&lt;/label&gt;</li>
                                <li class="egov-txtIn3">&lt;input type="text" id="text"/&gt;</li>
                                <li class="egov-txtIn2">&lt;/li&gt;</li>
                                <li class="egov-txtIn2">&lt;li data-role="fieldcontain"&gt;</li>
                                <li class="egov-txtIn3">&lt;label for="password"&gt;Password :&lt;/label&gt;</li>
                                <li class="egov-txtIn3">&lt;input type="password" id="password"/&gt;</li>
                                <li class="egov-txtIn2">&lt;/li&gt;</li>
                                <li class="egov-txtIn2">&lt;li data-role="fieldcontain"&gt;</li>
                                <li class="egov-txtIn3">&lt;label for="slider"&gt;Slider:&lt;/label&gt;</li>
                                <li class="egov-txtIn3">&lt;input type="range" id="slider" value="0" min="0" max="100" /&gt;</li>
                                <li class="egov-txtIn2">&lt;/li&gt;</li>
                                <li class="egov-txtIn2">&lt;li data-role="fieldcontain"&gt;</li>
                                <li class="egov-txtIn3">&lt;button data-theme="b" id="submit" type="submit"&gt;Submit&lt;/button&gt;&lt;</li>
                                <li class="egov-txtIn2">&lt;/li&gt;</li>
                                <li class="egov-txtIn1">&lt;/ul&gt;</li>
                                <li>&lt;/form&gt;</li>
                            </ul>
                        </div>                
                    </div>
                    
                    <div class="egov-deth1">
                    	<h2>향상된 Input Type</h2>
                    	<p>HTML5 의 다양한 Input Type 을 사용하면 
                    	모바일 기기에서 자동으로 해당 Input Type 에 맞는  입력 도구를 제공한다. </p>
                    	<div class="egov-deth2">
                    		<div data-role="fieldcontain">
	                    		<label for="number">Number Input : </label>
	                    		<input type="number" name="number" id="number" value="" />
	                    	</div>
                    		<div data-role="fieldcontain">
	                    		<label for="email">Email Input : </label>
	                    		<input type="email" name="email" id="email" value="" />
	                    	</div>
                    		<div data-role="fieldcontain">
	                    		<label for="url">URL Input : </label>
	                    		<input type="url" name="url" id="url" value="" />
	                    	</div>
                    		<div data-role="fieldcontain">
	                    		<label for="tel">TEL Input : </label>
	                    		<input type="tel" name="tel" id="tel" value="" />
                    		</div>
                    	</div>
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>폼 구성요소 </h2>
                        <p>폼 형식으로 주어진 레이아웃에  Tag를 추가하여 폼 구성요소를 추가한다. 
                     	   폼 구성요소의 종류는 Text inputs, Search inputs, Sliders, Switches,
                        Radio buttons, Check boxes, Selectors 가 있다.</p>   
                        
                        <div class="egov-deth2">
                            <form id="form-5" action="#" method="get">
                                <div data-role="fieldcontain">
                                    <label for="name">Text :</label>
                                    <input type="text" id="name"/>
                                </div>
                                <div data-role="fieldcontain">
                                    <label for="password">Password :</label>
                                    <input type="password" id="password" />
                                </div>   
                                <div data-role="fieldcontain">                      
                                    <label for="textarea">Textarea:</label>
                                    <textarea cols="40" rows="8"id="textarea"></textarea>
                                </div>
                                <div data-role="fieldcontain">  
                                    <label for="search">Search Input:</label>
                                    <input type="search" id="search"/>
                                </div>
                                <div data-role="fieldcontain">
                                    <label for="switch">Switch :</label>
                                    <select id="switch" data-role="slider">
                                        <option value="off">Off</option>
                                        <option value="on">On</option>
                                    </select> 
                                </div>
                                <div data-role="fieldcontain">              
                                    <label for="slider">Slider:</label>
                                    <input type="range" id="slider" value="0" min="0" max="100"  />
                                </div>
                                <div data-role="fieldcontain">
                                    <fieldset data-role="controlgroup">
                                        <legend>Radio Button:</legend>
                                            <input type="radio" name="radio-choice-1" id="radio-choice-1" value="choice-1" checked="checked" />
                                            <label for="radio-choice-1">선택 1</label>
                                
                                            <input type="radio" name="radio-choice-1" id="radio-choice-2" value="choice-2"  />
                                            <label for="radio-choice-2">선택 2</label>
                                
                                            <input type="radio" name="radio-choice-1" id="radio-choice-3" value="choice-3"  />
                                            <label for="radio-choice-3">선택 3</label>
                                
                                            <input type="radio" name="radio-choice-1" id="radio-choice-4" value="choice-4"  />
                                            <label for="radio-choice-4">선택 4</label>
                                    </fieldset>
                                </div>
                                <div data-role="fieldcontain">   
                                    <fieldset data-role="controlgroup">
                                        <legend>Check Box :</legend>
                                        <input type="checkbox" name="checkbox-1" id="checkbox-1" class="custom" />
                                        <label for="checkbox-1">동의합니다.</label>
                                    </fieldset>
                                </div>    
                                <div data-role="fieldcontain"> 
                                <fieldset data-role="controlgroup"> 
                                    <legend>Check Box :</legend> 
                                    <input type="checkbox" name="checkbox-1a" id="checkbox-1a" class="custom" /> 
                                    <label for="checkbox-1a">다중선택 1</label> 
                     
                                    <input type="checkbox" name="checkbox-2a" id="checkbox-2a" class="custom" /> 
                                    <label for="checkbox-2a">다중선택 2</label> 
                     
                                    <input type="checkbox" name="checkbox-3a" id="checkbox-3a" class="custom" /> 
                                    <label for="checkbox-3a">다중선택 3</label> 
                     
                                    <input type="checkbox" name="checkbox-4a" id="checkbox-4a" class="custom" /> 
                                    <label for="checkbox-4a">다중선택 4</label> 
                                </fieldset> 
                                        </div> 
                                <div data-role="fieldcontain"> 
                                <fieldset data-role="controlgroup" data-type="horizontal"> 
                                    <legend>Check Box :</legend> 
                                    <input type="checkbox" name="checkbox-6" id="checkbox-6" class="custom" /> 
                                    <label for="checkbox-6">아침</label> 
                     
                                    <input type="checkbox" name="checkbox-7" id="checkbox-7" class="custom" /> 
                                    <label for="checkbox-7">점심</label> 
                     
                                    <input type="checkbox" name="checkbox-8" id="checkbox-8" class="custom" /> 
                                    <label for="checkbox-8">저녁</label> 
                                </fieldset> 
                                </div>
                                <div data-role="fieldcontain"> 
                                    <fieldset data-role="controlgroup" data-type="horizontal"> 
                                        <legend>Radio Button:</legend> 
                                            <input type="radio" name="radio-choice-b" id="radio-choice-c" value="on" checked="checked" /> 
                                            <label for="radio-choice-c">시작</label> 
                                            <input type="radio" name="radio-choice-b" id="radio-choice-d" value="off" /> 
                                            <label for="radio-choice-d">끝</label> 
                                            <input type="radio" name="radio-choice-b" id="radio-choice-e" value="other" /> 
                                            <label for="radio-choice-e">기타</label> 
                                    </fieldset> 
                                </div> 
                                <div data-role="fieldcontain"> 
                                    <label for="select-choice-1" class="select">Select Menu:</label> 
                                    <select id="select-choice-1"> 
                                        <option value="choice1">메뉴 선택 1</option> 
                                        <option value="choice2">메뉴 선택 2</option> 
                                        <option value="choice3">메뉴 선택 3</option> 
                                        <option value="choice4">메뉴 선택 4</option> 
                                    </select> 
                                </div>         
								<button type="submit" data-theme="a">Submit</button> 
                            </form>
                        </div>
                    </div>
                    
                    <div class="egov-deth1">
                    	<h2>폼 버튼 </h2>
                        <p> <strong>&lt;button&gt; Tag</strong> 를 사용하거나  <strong>&lt;input&gt; Tag 에
					     "button", "submit", "image" 속성을 추가</strong>하여 폼 버튼을 생성할 수 있으며 button의 경우  onclick으로 submit 이벤트를 걸어준다.
					     button의 summit이벤트는 Ajax가 false인 방법으로 전송된다.
					          또한 이들은  Anchor 태그 형식의 버튼과 마찬가지로   data-inline, data-icon 등의 버튼 속성을 적용할 수 있다.
                        </p>
                        <div class="egov-deth2">
                        	 <form id="form-8" name="form8" action="#" method="get">
                        		<div data-role="fieldcontain">
                        			<button>Button Tag</button>
                        		</div>
                        		<div data-role="fieldcontain">	
                        			<input type="submit" value="Submit Input" />
                        		</div>
                        		<div data-role="fieldcontain">	
                        			<input type="image" value="Image Input" />
                        		</div>
								<div data-role="fieldcontain">	
                        			<input type="button" value="Button Input" onClick="javascript:btnSubmit();"/>
                        		</div> 
                        	</form>
                        	
                        	<ul class="link">
						    	<li>&lt;button&gt;Button Tag&lt;/button&gt;</li>
						    	<li>&lt;input type="submit" value="Submit Input" /&gt;</li>
						    	<li>&lt;input type="image" value="Image Input" /&gt;</li>
						    	<li>&lt;input type="button" value="Button Input" onClick="javascript:btnSubmit();"/&gt;</li>
					   		</ul>
					    </div>   
                    </div>
                    
                    <div class="egov-deth1">
                        <h2>HTML 스타일의 폼 </h2>
                        <p>폼의 각 요소에 <strong>data-role="none"</strong>으로 속성 값을 지정하면
					 	기존 HTML 에서 제공하는 고전적인 형태의 폼을 생성할 수 있다.</p>   
                        
                        <div class="egov-deth2">
                            <form id="form-12" action="#" method="get">
                                <div data-role="fieldcontain">
                                    <label for="name">Text :</label>
                                    <input type="text" id="name" data-role="none" />
                                </div>
                                <div data-role="fieldcontain">
                                    <label for="switch">Switch :</label>
                                    <select id="switch" data-role="none">
                                        <option value="off">Off</option>
                                        <option value="on">On</option>
                                    </select> 
                                </div>
                                <div data-role="fieldcontain">
                                    <fieldset data-role="controlgroup">
                                        <legend>Radio Button:</legend>
                                            <input type="radio" name="radio-choice-1" id="radio-choice-1" value="choice-1" checked="checked"  data-role="none" />
                                            <label for="radio-choice-1">선택 1</label>
                                
                                            <input type="radio" name="radio-choice-1" id="radio-choice-2" value="choice-2"  data-role="none"  />
                                            <label for="radio-choice-2">선택 2</label>
                                
                                            <input type="radio" name="radio-choice-1" id="radio-choice-3" value="choice-3"  data-role="none"  />
                                            <label for="radio-choice-3">선택 3</label>
                                    </fieldset>
                                </div>
                                <div data-role="fieldcontain">   
                                    <fieldset data-role="controlgroup">
                                        <legend>Check Box :</legend>
                                        <input type="checkbox" name="checkbox-1" id="checkbox-1" class="custom" data-role="none"  />
                                        <label for="checkbox-1">EMail</label>
                                        <input type="checkbox" name="checkbox-2" id="checkbox-2" class="custom" data-role="none"  />
                                        <label for="checkbox-1">SMS</label>
                                    </fieldset>
                                </div>    
                       			<div data-role="fieldcontain">       
	                               <button type="submit" data-theme="d" data-role="none" >Cancel</button>
	                               <button type="submit" data-theme="a" data-role="none" >Submit</button> 
                                </div>
                                
                            </form>
                            
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
                 <h4>Copyright(c)2011 Ministry of Public Administration and Security.</h4>
            </div>
            <!-- footer end -->   
         
         </div>
         <!-- page end -->
          
     </body>
 </html>