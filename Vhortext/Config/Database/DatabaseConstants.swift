//
//  DatabaseConstants.swift
//  Vhortext
//
//  Created by MacBook Pro on 14/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import Foundation

class DatabaseConstants{
    
    // Database Name
    static let DATABASE_NAME = "vhortext.sqlite"
    
    
    struct tableName{
        /*MARK:-----------Table Names----------*/
        static let TABLE_CONTACT_USER = "contact_user"
        static let TABLE_PROFILE_STATUS = "profile_status";
    }
    
    struct columnName{
        
        /*MARK:-------------Cloumn Names of TABLE_CONTACT_USER----------------*/
        static let CONTACT_USER_TABLE_ID = "usrTableId"
        static let CONTACT_USER_ID = "usrId"
        static let CONTACT_USER_NAME = "usrUserName"
        static let CONTACT_USER_MOBILE = "usrMobile"
        static let CONTACT_USER_APP_VERSION = "usrAppVersion"
        static let CONTACT_USER_APP_TYPE = "usrAppType"
        static let CONTACT_USER_COUNTRY_NAME="usrCountryName"
        static let CONTACT_USER_COUNTRY_CODE="usrCountryCode"
        static let CONTACT_USER_PROFILE_PHOTO = "usrProfileImage"
        static let CONTACT_USER_PROFILE_STATUS = "usrProfileStatus"
        static let CONTACT_USER_BLOCK_STATUS = "usrBlockStatus"
        static let CONTACT_USER_FAVORITE_STATUS = "usrFavoriteStatus"
        static let CONTACT_USER_RELATION_STATUS = "usrRelationStatus"
        static let CONTACT_USER_GENDER_NAME = "usrGenderName"
        static let CONTACT_USER_LANGUAGE_ID = "usrLanguageId"
        static let CONTACT_USER_LANGUAGE_NAME = "usrLanguageName"
        static let CONTACT_USER_KNOWN_STATUS = "usrKnownStatus"
        static let CONTACT_USER_NUMBER_PRIVATE_PERMISSION = "usrNumberPrivatePermission"
        static let CONTACT_USER_ONLINE_PERMISSION = "usrOnlinePermission"
        static let CONTACT_USER_MY_BLOCK_STATUS = "usrMyBlockStatus"
        
        /*MARK:-------------Cloumn Names of TABLE_PROFILE_STATUS----------------*/
        static let PROFILE_STATUS_TABLE_ID = "table_id";
        static let PROFILE_STATUS_ID="statusId";
        static let PROFILE_STATUS_NAME="statusName";
        static let PROFILE_STATUS_SELECTED="statusSelected";
        static let PROFILE_STATUS_APP_VERSION = "statusAppVersion";
        static let PROFILE_STATUS_APP_TYPE = "statusAppType";
        
    }
    
    
    


    
}
