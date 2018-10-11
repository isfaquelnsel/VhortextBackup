//
//  OTPVerificationService.swift
//  Vhortext
//
//  Created by LNSEL on 12/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import Foundation


class OTPVerificationService {
    
    
    func callAPIOTPVerification(url: String, usrCountryCode: String, usrMobileNo: String, usrUserName: String, usrDeviceId: String, usrTokenId: String, usrOTP: String, usrAppType: String, usrAppVersion: String, onSuccess successCallback: ((_ profileData: ProfileData) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?){
            Log.i("callAPIOTPVerification() called")
            OTPVerificationServiceManager.instance.callAPIOTPVerification(url: url, usrCountryCode: usrCountryCode, usrMobileNo: usrMobileNo, usrUserName: usrUserName, usrDeviceId: usrDeviceId, usrTokenId: usrTokenId, usrOTP: usrOTP, usrAppType: usrAppType, usrAppVersion: usrAppVersion,
                                                                          onSuccess: { (profileData) in
                                                                            successCallback?(profileData)},
                                                                          onFailure: { (errorMessage) in
                                                                            failureCallback?(errorMessage)
            })
    }
    
    func callAPIResendOTP(url: String, usrCountryCode: String, usrMobileNo: String, usrAppType: String, usrAppVersion: String, onSuccess successCallback: ((_ status: String, _ message: String) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?){
        Log.i("callAPIResendOTP() called")
        OTPVerificationServiceManager.instance.callAPIResendOTP(url: url, usrCountryCode: usrCountryCode, usrMobileNo: usrMobileNo, usrAppType: usrAppType, usrAppVersion: usrAppVersion,
                                                          onSuccess: { (status, message) in
                                                            successCallback?(status, message)},
                                                          onFailure: { (errorMessage) in
                                                            failureCallback?(errorMessage)
                                                            
        })
    }
    
    
    
    
    
    
    
}
