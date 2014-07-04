package kr.go.egovframework.hyb.contactsapi;

import org.apache.cordova.*;

import android.os.Bundle;

/**  
 * @Class Name : ContactsAPIGuide_AndroidActivity.java
 * @Description : ContactsAPIGuide_AndroidActivity Class
 * @Modification Information  
 * 
 * @  수정일                 수정자                 수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2012.08.17    나신일                  최초생성
 * 
 * @author 모바일 디바이스 API 팀
 * @since 2012. 08. 17
 * @version 1.0
 * @see
 * 
 *  Copyright (C) by MOPAS All right reserved.
 */
public class ContactsAPIGuide_AndroidActivity extends DroidGap
{
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        // Clear cache if you want
        super.clearCache();
        //super.appView.getSettings().setCacheMode(WebSettings.LOAD_NO_CACHE);
        super.loadUrl("file:///android_asset/www/intro.html");
    }
}