//
//  Urls.swift
//  Vhortext
//
//  Created by LNSEL on 11/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import Foundation

class UrlConstants {

    static let mainURL = "http://103.14.96.144/~lnselco/vhortextdev/vhortexttest/Api/"
    static let imageBaseURL = "http://103.14.96.144/~lnselco/vhortextdev/vhortexttest/"
    static let apiKey = "VHORTEXTAPIKEY123456"
    
    static let apiRegistration = mainURL+"user_signup" //post
    static let apiOTPVerification = mainURL+"user_otp_verification" //post
    static let apiResendOTP = mainURL+"resend_user_otp" //post
    static let apiGetUsers = mainURL+"get_all_users" //get
    static let apiUpdateFavorite = mainURL+"update_user_favorite" //post
    static let apiUpdateUserBlock = mainURL+"update_user_block" //post
    static let apiGetFavoriteUsers = mainURL+"get_favorite_users" //get
    static let apiGetBlockUser = mainURL+"get_block_users" //get
    static let apiUpdateProfileStatus = mainURL+"update_user_profile_status" //post
    static let apiGetlanguages = mainURL+"get_all_languages" // get
    static let apiUpdateStatus = mainURL+"update_user_profile_status" // post
    static let apiEditProfile = mainURL+"update_user_profile_info" // post
    static let apiYahooNews = mainURL+"get_yahoo_news" //get
    static let apiChatMessage = mainURL+"add_message" //Post
    static let updateMessageStatusApi = mainURL+"update_message_status"
    static let apiGetAllLanguages = mainURL + "get_all_languages?API_KEY=VHORTEXTAPIKEY123456"
    static let apiImageFileUpload = mainURL + "file_upload"
    
}
