//
//  RegistrationPresenter.swift
//  Vhortext
//
//  Created by LNSEL on 12/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import Foundation

//MARK:- -----------------------Interface to call RegistratonVC function in Presenter----------------
protocol RegistrationView: NSObjectProtocol {
    
    func startLoading()
    func registrationSuccess(registrationReturnData: RegistrationReturnData)
    func registrationFailed(message: String)
    
}



class RegistrationPresenter {
    
    private let registrationService:RegistrationService
    weak private var registrationView: RegistrationView?
    
    init(registrationService:RegistrationService){
        self.registrationService = registrationService
    }
    
    func attachView(view:RegistrationView){
        registrationView = view
    }
    
    func detachView() {
        registrationView = nil
    }
    
    func getRegistration(url: String, usrUserName: String, usrMobileNo: String, usrDeviceId: String, usrTokenId: String, usrCountryCode: String, usrAppType: String, usrAppVersion: String, usrCountryName: String, usrCountryShortName: String){
        
        self.registrationView?.startLoading()
        
        Log.i("callAPIRegistration() called")
        registrationService.callAPIRegistration(url: url, usrUserName: usrUserName, usrMobileNo: usrMobileNo, usrDeviceId: usrDeviceId, usrTokenId: usrTokenId, usrCountryCode: usrCountryCode, usrAppType: usrAppType, usrAppVersion: usrAppVersion, usrCountryName: usrCountryName, usrCountryShortName: usrCountryShortName,
                                                onSuccess: { (registration) in
                                                    self.registrationView?.registrationSuccess(registrationReturnData: registration)},
                                                onFailure: { (errorMessage) in
                                                    self.registrationView?.registrationFailed(message: errorMessage)
        })
    }
    

    
    
}
