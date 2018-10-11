//
//  UserDefaults.swift
//  Vhortext
//
//  Created by MacBook Pro on 14/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import Foundation

extension UserDefaults{
    
    enum UserDefaultsKeys: String {
        case isLogin
        case usrId
        case usrCountryCode
        case usrMobileNo
        case usrUserName
        case usrTokenId
        case usrDeviceId
        case usrProfileImage
        case usrProfileStatus
        case usrLanguageId
        case usrLanguageName
        case usrLanguageSName
        case usrGender
        case usrLocationPermission
        case usrTranslationPermission
        case usrPrivateNumberPermission
        case usrOnlinePermission
        case usrNotificationPermission
        case usrFcmTokenId
        case usrAppVersion
        case usrAppType
    }
    
    func createLoginSession(
        isLogin: Bool,
        usrId: String,
        usrCountryCode: String,
        usrMobileNo: String,
        usrUserName: String,
        usrTokenId: String,
        usrDeviceId: String,
        usrProfileImage: String,
        usrProfileStatus: String,
        usrLanguageId: String,
        usrLanguageName: String,
        usrLanguageSName: String,
        usrGender: String,
        usrLocationPermission: String,
        usrTranslationPermission: String,
        usrPrivateNumberPermission: String,
        usrOnlinePermission: String,
        usrNotificationPermission: String,
        usrFcmTokenId: String,
        usrAppVersion: String,
        usrAppType: String){
        
        set(isLogin, forKey: UserDefaultsKeys.isLogin.rawValue)
        set(usrId, forKey: UserDefaultsKeys.usrId.rawValue)
        set(usrCountryCode, forKey: UserDefaultsKeys.usrCountryCode.rawValue)
        set(usrMobileNo, forKey: UserDefaultsKeys.usrMobileNo.rawValue)
        set(usrUserName, forKey: UserDefaultsKeys.usrUserName.rawValue)
        set(usrTokenId, forKey: UserDefaultsKeys.usrTokenId.rawValue)
        set(usrDeviceId, forKey: UserDefaultsKeys.usrDeviceId.rawValue)
        set(usrProfileImage, forKey: UserDefaultsKeys.usrProfileImage.rawValue)
        set(usrProfileStatus, forKey: UserDefaultsKeys.usrProfileStatus.rawValue)
        set(usrLanguageId, forKey: UserDefaultsKeys.usrLanguageId.rawValue)
        set(usrLanguageName, forKey: UserDefaultsKeys.usrLanguageName.rawValue)
        set(usrLanguageSName, forKey: UserDefaultsKeys.usrLanguageSName.rawValue)
        set(usrGender, forKey: UserDefaultsKeys.usrGender.rawValue)
        set(usrLocationPermission, forKey: UserDefaultsKeys.usrLocationPermission.rawValue)
        set(usrTranslationPermission, forKey: UserDefaultsKeys.usrTranslationPermission.rawValue)
        set(usrPrivateNumberPermission, forKey: UserDefaultsKeys.usrPrivateNumberPermission.rawValue)
        set(usrOnlinePermission, forKey: UserDefaultsKeys.usrOnlinePermission.rawValue)
        set(usrNotificationPermission, forKey: UserDefaultsKeys.usrNotificationPermission.rawValue)
        set(usrFcmTokenId, forKey: UserDefaultsKeys.usrFcmTokenId.rawValue)
        set(usrAppVersion, forKey: UserDefaultsKeys.usrAppVersion.rawValue)
        set(usrAppType, forKey: UserDefaultsKeys.usrAppType.rawValue)
        
        synchronize()
        
    }
    
    func removeLoginSession(){
        
        removeObject(forKey: UserDefaultsKeys.isLogin.rawValue)
        removeObject(forKey: UserDefaultsKeys.usrId.rawValue)
        removeObject(forKey: UserDefaultsKeys.usrCountryCode.rawValue)
        removeObject(forKey: UserDefaultsKeys.usrMobileNo.rawValue)
        removeObject(forKey: UserDefaultsKeys.usrUserName.rawValue)
        removeObject(forKey: UserDefaultsKeys.usrTokenId.rawValue)
        removeObject(forKey: UserDefaultsKeys.usrDeviceId.rawValue)
        removeObject(forKey: UserDefaultsKeys.usrProfileImage.rawValue)
        removeObject(forKey: UserDefaultsKeys.usrProfileStatus.rawValue)
        removeObject(forKey: UserDefaultsKeys.usrLanguageId.rawValue)
        removeObject(forKey: UserDefaultsKeys.usrLanguageName.rawValue)
        removeObject(forKey: UserDefaultsKeys.usrLanguageSName.rawValue)
        removeObject(forKey: UserDefaultsKeys.usrGender.rawValue)
        removeObject(forKey: UserDefaultsKeys.usrLocationPermission.rawValue)
        removeObject(forKey: UserDefaultsKeys.usrTranslationPermission.rawValue)
        removeObject(forKey: UserDefaultsKeys.usrPrivateNumberPermission.rawValue)
        removeObject(forKey: UserDefaultsKeys.usrOnlinePermission.rawValue)
        removeObject(forKey: UserDefaultsKeys.usrNotificationPermission.rawValue)
        removeObject(forKey: UserDefaultsKeys.usrFcmTokenId.rawValue)
        removeObject(forKey: UserDefaultsKeys.usrAppVersion.rawValue)
        removeObject(forKey: UserDefaultsKeys.usrAppType.rawValue)
        
        synchronize()
        
    }
    
    func isLoggedIn() -> Bool {
        return bool(forKey: UserDefaultsKeys.isLogin.rawValue)
    }
    
    func getUsrId() -> String {
        return object(forKey: UserDefaultsKeys.usrId.rawValue) as! String
    }
    
    func getUsrCountryCode() -> String {
        return object(forKey: UserDefaultsKeys.usrCountryCode.rawValue) as! String
    }
    
    func getUsrMobileNo() -> String {
        return object(forKey: UserDefaultsKeys.usrMobileNo.rawValue) as! String
    }
    
    func getUsrUserName() -> String {
        return object(forKey: UserDefaultsKeys.usrUserName.rawValue) as! String
    }
    
    func getUsrTokenId() -> String {
        return object(forKey: UserDefaultsKeys.usrTokenId.rawValue) as! String
    }
    
    func getUsrDeviceId() -> String {
        return object(forKey: UserDefaultsKeys.usrDeviceId.rawValue) as! String
    }
    
    func getUsrProfileImage() -> String {
        return object(forKey: UserDefaultsKeys.usrProfileImage.rawValue) as! String
    }
    
    func getUsrProfileStatus() -> String {
        return object(forKey: UserDefaultsKeys.usrProfileStatus.rawValue) as! String
    }
    
    func getUsrLanguageId() -> String {
        return object(forKey: UserDefaultsKeys.usrLanguageId.rawValue) as! String
    }
    
    func getUsrLanguageName() -> String {
        return object(forKey: UserDefaultsKeys.usrLanguageName.rawValue) as! String
    }
    
    func getUsrLanguageSName() -> String {
        return object(forKey: UserDefaultsKeys.usrLanguageSName.rawValue) as! String
    }
    
    func getUsrGender() -> String {
        return object(forKey: UserDefaultsKeys.usrGender.rawValue) as! String
    }
    
    func getUsrLocationPermission() -> String {
        return object(forKey: UserDefaultsKeys.usrLocationPermission.rawValue) as! String
    }
    
    func getUsrTranslationPermission() -> String {
        return object(forKey: UserDefaultsKeys.usrTranslationPermission.rawValue) as! String
    }
    
    func getUsrPrivateNumberPermission() -> String {
        return object(forKey: UserDefaultsKeys.usrPrivateNumberPermission.rawValue) as! String
    }
    
    func getUsrOnlinePermission() -> String {
        return object(forKey: UserDefaultsKeys.usrOnlinePermission.rawValue) as! String
    }
    
    func getUsrNotificationPermission() -> String {
        return object(forKey: UserDefaultsKeys.usrNotificationPermission.rawValue) as! String
    }
    
    func getUsrFcmTokenId() -> String {
        return object(forKey: UserDefaultsKeys.usrFcmTokenId.rawValue) as! String
    }
    
    func getUsrAppVersion() -> String {
        return object(forKey: UserDefaultsKeys.usrAppVersion.rawValue) as! String
    }
    
    func getUsrAppType() -> String {
        return object(forKey: UserDefaultsKeys.usrAppType.rawValue) as! String
    }

    
    
    
    
    
}
