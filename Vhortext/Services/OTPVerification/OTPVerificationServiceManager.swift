//
//  OTPVerificationServiceManager.swift
//  Vhortext
//
//  Created by LNSEL on 12/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class OTPVerificationServiceManager {
    
    static let instance = OTPVerificationServiceManager()
    
    /*---------------------OTP Verification API Calling(start)-----------------------*/
    func callAPIOTPVerification(url: String, usrCountryCode: String, usrMobileNo: String, usrUserName: String, usrDeviceId: String, usrTokenId: String, usrOTP: String, usrAppType: String, usrAppVersion: String, onSuccess successCallback: ((_ profileData: ProfileData) -> Void)?, onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        
        let otpParams = [ "API_KEY": UrlConstants.apiKey, "usrCountryCode" : usrCountryCode, "usrMobileNo":usrMobileNo, "usrUserName":usrUserName, "usrDeviceId": usrDeviceId, "usrTokenId": usrTokenId, "usrOTP": usrOTP, "usrAppType": usrAppType, "usrAppVersion": usrAppVersion]
        
        Log.i("callAPIOTPVerification() called with Params==> \(otpParams)")

        self.createRequest(
            url, method: .post, parameters: otpParams,
            onSuccess: {(response: JSON) -> Void in
                
                Log.i("callAPIOTPVerification() Response==> \(response)")
                
                if let otpResponse = response.dictionaryObject {
                    
                    let statusCode = otpResponse["statusCode"] as! String
                    
                    if statusCode == "200" {
                        
                        let profileData = ProfileData()
                        
                        profileData.usrId = otpResponse["usrId"] as! String
                        profileData.usrCountryCode = otpResponse["usrCountryCode"] as! String
                        profileData.usrMobileNo = otpResponse["usrMobileNo"] as! String
                        profileData.usrUserName = otpResponse["usrUserName"] as! String
                        profileData.usrTokenId = otpResponse["usrTokenId"] as! String
                        profileData.usrDeviceId = otpResponse["usrDeviceId"] as! String
                        profileData.usrProfileImage = otpResponse["usrProfileImage"] as! String
                        profileData.usrProfileStatus = otpResponse["usrProfileStatus"] as! String
                        profileData.usrLanguageId = otpResponse["usrLanguageId"] as! String
                        profileData.usrLanguageName = otpResponse["usrLanguageName"] as! String
                        profileData.usrLanguageSName = otpResponse["usrLanguageSName"] as! String
                        profileData.usrGender = otpResponse["usrGender"] as! String
                        profileData.usrLocationPermission = otpResponse["usrLocationPermission"] as! String
                        profileData.usrTranslationPermission = otpResponse["usrTranslationPermission"] as! String
                        profileData.usrPrivateNumberPermission = otpResponse["usrNumberPrivatePermission"] as! String
                        profileData.usrOnlinePermission = otpResponse["usrOnlinePermission"] as! String
                        profileData.usrNotificationPermission = otpResponse["usrNotificationPermission"] as! String
                        profileData.usrFcmTokenId = otpResponse["usrTokenId"] as! String
                        profileData.usrAppVersion = otpResponse["usrAppVersion"] as! String
                        profileData.usrAppType = otpResponse["usrAppType"] as! String
                        
                        
                        
                        
                        successCallback?(profileData)
                    }
                    
                } else {
                    failureCallback?("An error has occured.")
                    Log.e("callAPIOTPVerification() Response==> An error has occured")
                }
                
        },
            onFailure: {(errorMessage: String) -> Void in
                failureCallback?(errorMessage)
                Log.e(errorMessage)
        }
        )
        
    }
    /*---------------------OTP Verification API Calling(end)-----------------------*/
    
    /*---------------------Resend API Calling(start)-----------------------*/
    func callAPIResendOTP(url: String, usrCountryCode: String, usrMobileNo: String, usrAppType: String, usrAppVersion: String, onSuccess successCallback: ((_ status: String, _ message: String) -> Void)?, onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        
        let resendParams = ["API_KEY": UrlConstants.apiKey, "usrCountryCode": usrCountryCode, "usrMobileNo": usrMobileNo, "usrAppType": usrAppType, "usrAppVersion": usrAppVersion]
        
        Log.i("callAPIResendOTP() called with Params==> \(resendParams)")
        
        self.createRequest(
            url, method: .post, parameters: resendParams,
            onSuccess: {(response: JSON) -> Void in
                
                Log.i("callAPIResendOTP() Response==> \(response)")
                
                if let otpResponse = response.dictionaryObject {
                    
                    let statusCode = otpResponse["statusCode"] as! String
                    
                    if statusCode == "200" {
                        
                        
                        let status = otpResponse["status"] as! String
                        let message = otpResponse["message"] as! String
                        
                        successCallback?(status, message)
                    }
                    
                } else {
                    failureCallback?("An error has occured.")
                    Log.e("callAPIResendOTP() Response==> An error has occured")
                }
                
        },
            onFailure: {(errorMessage: String) -> Void in
                failureCallback?(errorMessage)
                Log.e(errorMessage)
        }
        )
        
    }
    /*---------------------Resend API Calling(end)-----------------------*/
    

    func createRequest(
        _ url: String,
        method: HTTPMethod,
        parameters: [String: Any]?,
        onSuccess successCallback: ((JSON) -> Void)?,
        onFailure failureCallback: ((String) -> Void)?) {
        
        Alamofire.request(url, method: method, parameters: parameters).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                successCallback?(json)
            case .failure(let error):
                if let callback = failureCallback {
                    // Return
                    callback(error.localizedDescription)
                }
            }
        }
    }
    
}



