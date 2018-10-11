//
//  OTPVerificationPresenter.swift
//  Vhortext
//
//  Created by LNSEL on 12/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import Foundation

protocol OTPVerificationView: NSObjectProtocol{
    
    func startLoading()
    
    func otpVerificationSuccess(profileData: ProfileData)
    func otpVerificationFailed(message: String)
    
    func resendOTPSuccess(status: String, message: String)
    func resendOTPFailed(message: String)
    
}


class OTPVerificationPresenter{
    
    private let otpVerificationService:OTPVerificationService
    weak private var otpVerificationView: OTPVerificationView?
    
    init(otpVerificationService:OTPVerificationService){
        self.otpVerificationService = otpVerificationService
    }
    
    func attachView(view:OTPVerificationView){
        otpVerificationView = view
    }
    
    func detachView() {
        otpVerificationView = nil
    }
    
    
    func getOTPVerification(url: String, usrCountryCode: String, usrMobileNo: String, usrUserName: String, usrDeviceId: String, usrTokenId: String, usrOTP: String, usrAppType: String, usrAppVersion: String){
        self.otpVerificationView?.startLoading()
        
        Log.i("callAPIOTPVerification() called")
        otpVerificationService.callAPIOTPVerification(url: url, usrCountryCode: usrCountryCode, usrMobileNo: usrMobileNo, usrUserName: usrUserName, usrDeviceId: usrDeviceId, usrTokenId: usrTokenId, usrOTP: usrOTP, usrAppType: usrAppType, usrAppVersion: usrAppVersion,
        onSuccess: { (profileData) in
            self.otpVerificationView?.otpVerificationSuccess(profileData: profileData)
        }, onFailure: { (errorMessage) in
            self.otpVerificationView?.otpVerificationFailed(message: errorMessage)
        })
        
    }
    
    func getResendOTP(url: String, usrCountryCode: String, usrMobileNo: String, usrAppType: String, usrAppVersion: String){
        self.otpVerificationView?.startLoading()
        
        Log.i("callAPIResendOTP() called")
        otpVerificationService.callAPIResendOTP(url: url, usrCountryCode:usrCountryCode, usrMobileNo: usrMobileNo, usrAppType: usrAppType, usrAppVersion: usrAppVersion,
        onSuccess: { (status, message) in
            self.otpVerificationView?.resendOTPSuccess(status: status, message: message)
        }, onFailure: { (errorMessage) in
            self.otpVerificationView?.resendOTPFailed(message: errorMessage)
        })
    }
    
    
    
    
    
}
