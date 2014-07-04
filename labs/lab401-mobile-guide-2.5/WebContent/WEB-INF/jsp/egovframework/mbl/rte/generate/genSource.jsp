<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                   <div class="gen-source">
                       <div class="gen-secondary">
                        	<h3>가이드 소스</h3>
                            <div class="sourseCode">
                                <textarea name="generateCode" id="generateCode" cols="100" class="" style="width:95%;height:402px;" data-role="none"></textarea>
                            </div>
                       </div>
                       <div class="gen-primary">
                            <h3>UX Component</h3>
                            <div class="sourseCode" style="max-height:420px;overflow-x:auto;overflow-y:hidden;-webkit-overflow-scrolling:touch;">
                                <iframe name="generateUI" id="generateUI" src="<c:url value="/generate/generateSample.do"/>" class="" style="width:100%;height:405px;border:0;overflow:hidden;border-spacing:0" ></iframe>
                            </div>
                       </div>
                   </div>