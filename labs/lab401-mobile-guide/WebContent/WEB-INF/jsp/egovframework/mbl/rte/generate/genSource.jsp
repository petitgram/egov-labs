<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                   <div class="gen-source">
                       <div class="gen-secondary">
                        	<h3>가이드 소스</h3>
                            <div class="sourseCode">
                                <textarea name="generateCode" id="generateCode" cols="100" class="" style="width:95%;height:300px;" data-role="none"></textarea>
                            </div>
                       </div>
                       <div class="gen-primary">
                            <h3>UX Component</h3>
                            <div class="sourseCode">
                                <iframe name="generateUI" id="generateUI" src="<c:url value="/generate/generateSample.do"/>" class="" style="width:100%;height:307px;" frameborder="0" framespacing="0" scrolling="yes"></iframe>
                            </div>
                       </div>
                   </div>