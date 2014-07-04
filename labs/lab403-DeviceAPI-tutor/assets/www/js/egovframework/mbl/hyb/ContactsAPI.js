/** 
 * @fileoverview 모바일 전자정부 하이브리드 앱 Contacts API 가이드 프로그램 JavaScript
 * JavaScript. 
 *
 * @author 나신일
 * @version 1.0 
 */

/**
 * iScroll 객체 생성
 * @type iScroll
 */
var myScroll = null;

/**
 * 모바일 디바이스의 조회된 연락처 객체
 * @type Contact
 */
var contactsList;

/**
 * 연락처 목록 페이지
 * @type Integer
 */
var nPageCount;

/**
 * 연락처 한 페이지의 최대 갯수 
 * @type Integer
 */
var nPageShow = 10;


$(function() 
{
    $("#btnMore").click(fn_egov_showListAdd);
    $("#btnDelete").click(fn_egov_contactLocalDelete);	
    $("#btnBackup").click(fn_egov_contactBackup);
    $("#btnRecovery").click(fn_egov_contactRecovery);
    
    $(document).on("pageshow", "#main", function(event, ui){
        
        if(myScroll != null) {
            
            myScroll.destroy();
        }
        loaded('mainWrapper');
    });
    
    $(document).on("pageshow", "#contactList", function(event, ui){
        
        if(myScroll != null) {
            
            myScroll.destroy();
        }
        loaded('subWrapper');
    });
});

/**
 * iScroll 적용
 * @returns 
 * @type 
 */
function loaded(scrollTarget) {
    
    // Use this for high compatibility (iDevice + Android)
    setTimeout(function () {
        myScroll = new iScroll(scrollTarget, {
            onBeforeScrollStart : function(e) {
                var target = e.target;
                while (target.nodeType != 1)
                    target = target.parentNode;
    
                if (target.tagName != 'SELECT' && target.tagName != 'INPUT'
                        && target.tagName != 'TEXTAREA')
                    e.preventDefault();
            }
        });
    });

    document.addEventListener('touchmove', function(e) {
        e.preventDefault();
    }, false);
}

/**
 * A tag의 링크 변경
 * @returns 
 * @type 
 */
function fn_egov_init_hrefLink(){
    loaded('mainWrapper');	
    document.addEventListener("backbutton", backKeyDown, false);     
    $("#btnMoveLocalConatact").attr("href","javascript:fn_egov_move_localContactList();");
    $("#btnMoveContactBackup").attr("href","javascript:fn_egov_move_contactBackup();");
    $("#btnMoveContactRecovery").attr("href","javascript:fn_egov_move_contactRecovery();");
    
    
}

/**
 * Android Back 버튼 클릭 이벤트 function.
 * @returns intro or importanceList 화면에서 종료하고 나머지 화면에선 back 처리
 * @type
*/
function backKeyDown(e) { 
    if($.mobile.activePage.is('#intro') || $.mobile.activePage.is('#main')){
    	
        e.preventDefault();
        navigator.app.exitApp();

    }else{
    	navigator.app.backHistory();
    }
}

/**
 * 공통 fail Callback Function
 * @returns 
 * @type 
 */
function fn_egov_fail(error) {
    console.log('DeviceAPIGuide fn_egov_fail Fail by ' + error);
    $.mobile.hidePageLoadingMsg('a');
}
    
/**
 * 연락처 조회 화면 이동 함수
 * 
 * @returns 
 * @type 
 */
function fn_egov_move_localContactList(){
    $.mobile.showPageLoadingMsg('a');
    var options = new ContactFindOptions();
    options.filter = "";
    options.multiple = true;
    
    var fields = ["id", "displayName", "name", "phoneNumbers", "emails"];
    navigator.contacts.find(fields, fn_egov_contactListSuccess, fn_egov_fail, options);
}

/**
 * 연락처 목록 조회 성공 callback
 * @returns 연락처 목록 화면으로 이동
 * @type
*/
function fn_egov_contactListSuccess(contacts) {
    console.log('DeviceAPIGuide fn_egov_contactListSuccess Success');
    contactsList = contacts;	
    
    nPageCount = 0;
    fn_egov_showList(true);
    
    $.mobile.hidePageLoadingMsg('a');
    $.mobile.changePage("#contactList", "slide", false, false);
    
    theList.listview("refresh");
}

/**
 * 연락처 목록 페이지 더보기 기능
 * @returns 연락처 목록에 연락처 추가
 * @type
*/
function fn_egov_showListAdd() {
    fn_egov_showList(false);
    myScroll.refresh();
    myScroll.scrollToElement('li:nth-child(' + String((nPageCount-1)*nPageShow-2) + ')', 1000);
}

/**
 * 연락처 목록 페이지 생성
 * @returns 연락처 목록에 연락처 추가
 * @type
*/
function fn_egov_showList(bFirst) {
    var linkVal;
    var displayName;
    var phoneNumber;
    var list_html = "";
    
    var nLen = contactsList.length;
    var nCntS = nPageCount*nPageShow;
    var nCntE = (++nPageCount)*nPageShow;
    
    if(nCntS>nLen) {
        nPageCount--;
        alert("마지막입니다.");
        return;
    }
    nCntE = nCntE>nLen?nLen:nCntE;
    for (var i=nCntS; i<nCntE; i++) {
        linkVal = "javascript:fn_egov_move_localContactDetail('" + i + "');";	
        displayName = contactsList[i].displayName;
        displayName = (displayName==null)?'이름없음':displayName;
        phoneNumber = "";
        if(contactsList[i].phoneNumbers != null) {
            for(var j=0; j<contactsList[i].phoneNumbers.length; j++) {
                if(contactsList[i].phoneNumbers[j].type == "mobile"){
                    phoneNumber = contactsList[i].phoneNumbers[j].value;
                    break;
                }
            }
        }    	
        
        list_html += '<li><a href="'
            + linkVal
            + '"><h3>'
            + displayName + '</h3><p><strong>' 
            + phoneNumber
            + '</strong></p></a></li>';
        
    }
    
    var theList = $('#listView');
    $(list_html).appendTo(theList);    
    if(!bFirst) {
        theList.listview("refresh");
    }   
    
}

/**
 * 연락처 상세정보 화면 이동 함수
 * 
 * @returns 연락처 상세정보 화면으로 이동
 * @type 
 */
function fn_egov_move_localContactDetail(index){
    var displayName = "";
    var phoneNumber = "";
    var email = "";
    
    displayName = contactsList[index].displayName;
    
    if(contactsList[index].phoneNumbers != null) {
        for(var j=0; j<contactsList[index].phoneNumbers.length; j++) {
            if(contactsList[index].phoneNumbers[j].type == "mobile"){
                phoneNumber = contactsList[index].phoneNumbers[j].value;
                break;
            }
        }
    }
    if(contactsList[index].emails != null) {
        for(var j=0; j<contactsList[index].emails.length; j++) {
            email = contactsList[index].emails[j].value;
            break;
        }
    }

    document.getElementById('detailIndex').value = index;
    document.getElementById('detailName').value = (displayName==null)?'이름없음':displayName;
    document.getElementById('detailPhone').value = phoneNumber;
    document.getElementById('detailEmail').value = email;

    $.mobile.changePage("#contactDetail", "slide", false, false);
}

/**
 * 연락처 삭제
 * @returns
 * @type
*/
function fn_egov_contactLocalDelete()
{
    var index = $("#detailIndex").val();
    contactsList[index].remove(fn_egov_removeSuccess,fn_egov_fail);
}

/**
 * 연락처 삭제 성공 callback
 * @returns
 * @type
*/
function fn_egov_removeSuccess(contact) {
    console.log('DeviceAPIGuide fn_egov_removeSuccess Success');
    alert('삭제 되었습니다.');	
    window.history.go(-2);
}

/**
 * 연락처 백업 화면으로 이동
 * @returns 연락처 리스트 갯수 조회
 * @type
*/
function fn_egov_move_contactBackup() {
    //3G 사용시 과금이 발생 할 수 있다는 경고 메시지 표시
    if(!fn_egov_network_check(false)) {
    	return;
    }
    
    $.mobile.showPageLoadingMsg('a');
    var options = new ContactFindOptions();
    options.filter = "";
    options.multiple = true;
    
    var fields = ["id", "displayName", "name", "phoneNumbers", "emails"];
    navigator.contacts.find(fields, fn_egov_contactBackupCountSuccess, fn_egov_fail, options);
}

/**
 * 연락처 리스트 조회 성공 callback
 * 서버에 백업된 연락처 갯수를 조회한다.
 * @returns
 * @type
*/
function fn_egov_contactBackupCountSuccess(contacts) {	
	
    console.log('DeviceAPIGuide fn_egov_contactBackupCountSuccess Success');
    contactsList = contacts;
    
    var url = "/ctt/xml/selectBackupCount.do";
    var acceptType = "xml";
    var params = {uuid :  device.uuid};
    
    
    // get the data from server
    window.plugins.EgovInterface.post(url, acceptType, params, function(xmldata) {		
        console.log('DeviceAPIGuide fn_egov_contactBackupCountSuccess request Completed');
        $.mobile.hidePageLoadingMsg('a');
        if($(xmldata).find("resultState").text() == "OK"){
            
            var html = '<div class="ui-block-a"><label align="center"><h3>' + String(contactsList.length) + '</h3></label></div>';
            html += '<div class="ui-block-b"><label align="center"><h3>' + $(xmldata).find("totCount").text() +'</h3></label></div>';
            
            var theList = $('#deviceBackupCount');
            theList.html(html);
            
            $.mobile.changePage("#contactBackup", "slide", false, false);
        }else{
            jAlert($(xmldata).find("resultMessage").text(), '오류', 'c');
        }
    });	
}

/**
 * 연락처를 백업 한다.
 * 
 * @returns
 * @type
*/
function fn_egov_contactBackup() {
    //3G 사용시 과금이 발생 할 수 있다는 경고 메시지 표시
    if(!fn_egov_network_check(false)) {
        return;
    }
    
    if(contactsList.length == 0) {
        return;
    }   
    
    $.mobile.showPageLoadingMsg('a');
    
    var param = [];	
    for(var index = 0; index < contactsList.length ; index++) {
        var displayName = '';
        var phoneNumber = '';
        var email = '';
        
        if(contactsList[index].displayName != null) {
            displayName = contactsList[index].displayName;
        }
        
        if(contactsList[index].phoneNumbers != null) {
            for(var j=0; j<contactsList[index].phoneNumbers.length; j++) {
                if(contactsList[index].phoneNumbers[j].type == "mobile"){
                    phoneNumber = contactsList[index].phoneNumbers[j].value;
                    break;
                }
            }
        }
        if(contactsList[index].emails != null) {
            for(var j=0; j<contactsList[index].emails.length; j++) {
                email = contactsList[index].emails[j].value;
                break;
            }
        }
        param.push({uuid:device.uuid, contactId:contactsList[index].id, name:displayName, telNo:phoneNumber, emails:email, useYn:'Y'});
    }


    var url = "/ctt/xml/addContactsInfo.do";
    var acceptType = "xml";
    var params = {contactsList : {contactsList : param}};
    
    window.plugins.EgovInterface.post(url, acceptType, params, function(xmldata) {		
        console.log('DeviceAPIGuide fn_egov_contactBackupCountSuccess request Completed');
        $.mobile.hidePageLoadingMsg('a');
        if($(xmldata).find("resultState").text() == "OK"){
            jAlert($(xmldata).find("resultMessage").text(), '정보', 'c');
            
            var html = '<div class="ui-block-a"><label align="center"><h3>' + String(contactsList.length) + '</h3></label></div>';
            html += '<div class="ui-block-b"><label align="center"><h3>' + $(xmldata).find("totCount").text() +'</h3></label></div>';
            
            var theList = $('#deviceBackupCount');
            theList.html(html);
        }else{
            jAlert($(xmldata).find("resultMessage").text(), '오류', 'c');
        }
    });	
	
}

/**
 * 연락처 복원 화면으로 이동
 * @returns 연락처 리스트 갯수 조회
 * @type
*/
function fn_egov_move_contactRecovery() {
    //3G 사용시 과금이 발생 할 수 있다는 경고 메시지 표시
    if(!fn_egov_network_check(false)) {
    	return;
    }
    
    $.mobile.showPageLoadingMsg('a');
    var options = new ContactFindOptions();
    options.filter = "";
    options.multiple = true;
    
    var fields = ["id", "displayName", "name", "phoneNumbers", "emails"];
    navigator.contacts.find(fields, fn_egov_contactRecoveryCountSuccess, fn_egov_fail, options);
}

/**
 * 연락처 리스트 조회 성공 callback
 * 서버에 백업된 연락처 갯수를 조회한다.
 * @returns
 * @type
*/
function fn_egov_contactRecoveryCountSuccess(contacts) {
    console.log('DeviceAPIGuide fn_egov_contactRecoveryCountSuccess Success');
    contactsList = contacts;
    
    var url = "/ctt/xml/selectBackupCount.do";
    var acceptType = "xml";

    var params = {uuid :  device.uuid};
    
    
    // get the data from server
    window.plugins.EgovInterface.post(url, acceptType, params, function(xmldata) {
        console.log('DeviceAPIGuide fn_egov_contactBackupCountSuccess request Completed');
        $.mobile.hidePageLoadingMsg('a');
        if($(xmldata).find("resultState").text() == "OK"){
            var html = '<div class="ui-block-a"><label align="center"><h3>' + String(contactsList.length) + '</h3></label></div>';
            html += '<div class="ui-block-b"><label align="center"><h3>' + $(xmldata).find("totCount").text() +'</h3></label></div>';
            
            var theList = $('#deviceRecoveryCount');
            theList.html(html);
            
            $.mobile.changePage("#contactRecovery", "slide", false, false);
        } else {
            jAlert($(xmldata).find("resultMessage").text(), '오류', 'c');
        }
    });	
}

/**
 * 연락처를 복원한다.
 * 
 * @returns
 * @type
*/
function fn_egov_contactRecovery() {
    if(!confirm('경고 : 디바이스의 주소록이 삭제되고 서버에 저장된 주소록으로 대체됩니다.\n계속 하시겠습니까?')) {
        return;
    }
    
    //3G 사용시 과금이 발생 할 수 있다는 경고 메시지 표시
    if(!fn_egov_network_check(false)) {
        return;
    }
    
    var url = "/ctt/xml/contactsInfoList.do";
    var acceptType = "xml";
    
    var params = {uuid :  device.uuid};
    var param = [];
    var listCount;
    var loopCount = 0;
    $.mobile.showPageLoadingMsg('a');
    // get the data from server
    window.plugins.EgovInterface.post(url, acceptType, params, function(xmldata) {	
        console.log('DeviceAPIGuide fn_egov_contactBackupCountSuccess request Completed');
        listCount = $(xmldata).find("contactsInfoList").length;
        
        $(xmldata).find("contactsInfoList").each(function(){
            
            var id = $(this).find("contactId").text();
            var name = $(this).find("name").text();
            var telNo = $(this).find("telNo").text();
            var email = $(this).find("emails").text();

            var options = new ContactFindOptions();
            options.multiple = true;
            options.filter=id; 
            var fields = ["id", "displayName", "name", "phoneNumbers", "emails"];
            navigator.contacts.find(fields, function(contacts){
                if(contacts.length != 0) {
                    contacts[0].remove(function(success){},function(error){});
                }
                var myContact = navigator.contacts.create({"displayName": name});
                
                if(telNo != '') {
                    var phoneNumbers = [];
                    phoneNumbers[0] = new ContactField('mobile', telNo, false);
                    myContact.phoneNumbers = phoneNumbers;
                }
                
                if(email != '') {
                    var emails = [];
                    emails[0] = new ContactField('work', email, false);
                    myContact.emails = emails;
                }
                
                myContact.save(function(contact){
                    param.push({uuid:device.uuid, contactId:id, newId:contact.id});
                    loopCount++;
                    if(listCount == loopCount) {
                        $.mobile.hidePageLoadingMsg('a');
                        alert(String(listCount) + '개의 연락처가 복원되었습니다. 저장된 연락처 정보를 서버와 동기화 합니다.');
                        $.mobile.showPageLoadingMsg('a');
                        fn_egov_contactIdUpdate(param,true);
                    }
                },function(error){
                    listCount--;
                    if(listCount == loopCount) {
                        $.mobile.hidePageLoadingMsg('a');
                        alert(String(listCount) + '개의 연락처가 복원되었습니다. 저장된 연락처 정보를 서버와 동기화 합니다.');
                        $.mobile.showPageLoadingMsg('a');
                        fn_egov_contactIdUpdate(param,false);
                    }
                });
                
            }, function(contactError){}, options);
        });		//each문 끝
    });
}

/**
 * 복원된 연락처의 id를 서버로 업데이트 한다.
 * 
 * @returns
 * @type
*/
function fn_egov_contactIdUpdate(param,isComplete) {
    var url = "/ctt/xml/updateContacts.do";
    var acceptType = "xml";
    var params = {contactsList : {contactsList : param}};
    
    window.plugins.EgovInterface.post(url, acceptType, params, function(xmldata) {		
        console.log('DeviceAPIGuide fn_egov_contactBackupCountSuccess request Completed');
        $.mobile.hidePageLoadingMsg('a');
        if($(xmldata).find("resultState").text() == "OK"){
            if(isComplete) {
                jAlert($(xmldata).find("resultMessage").text() +'개의 연락처가 동기화 되었습니다.', '정보', 'c');
            } else {
                jAlert('서버에 저장된 연락처 개수와 복원된 연락처 개수가 다릅니다.\n다시 복원 해주세요.', '정보', 'c');
            }
            var options = new ContactFindOptions();
            options.filter = "";
            options.multiple = true;
            
            var fields = ["id", "displayName", "name", "phoneNumbers", "emails"];
            navigator.contacts.find(fields, function(contacts){
                contactsList = contacts;
                var html = '<div class="ui-block-a"><label align="center"><h3>' + String(contactsList.length) + '</h3></label></div>';
                html += '<div class="ui-block-b"><label align="center"><h3>' + $(xmldata).find("totCount").text() +'</h3></label></div>';
                
                var theList = $('#deviceRecoveryCount');
                theList.html(html);
            }, fn_egov_fail, options);
            
        }else{
            jAlert($(xmldata).find("resultMessage").text(), '오류', 'c');
        }
    });	
    
}
