//
//  RegistrationService.swift
//  Vhortext
//
//  Created by LNSEL on 12/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import Foundation


class RegistrationService {
    
    
    func callAPIRegistration(url: String, usrUserName: String, usrMobileNo: String, usrDeviceId: String, usrTokenId: String, usrCountryCode: String, usrAppType: String, usrAppVersion: String, usrCountryName: String, usrCountryShortName: String, onSuccess successCallback: ((_ registration: RegistrationReturnData) -> Void)?,onFailure failureCallback: ((_ errorMessage: String) -> Void)?){
        
            Log.i("callAPIRegistration() called")
            RegistrationServiceManager.instance.callAPIRegistration(
                url: url, usrUserName: usrUserName, usrMobileNo: usrMobileNo, usrDeviceId: usrDeviceId, usrTokenId: usrTokenId, usrCountryCode: usrCountryCode, usrAppType: usrAppType, usrAppVersion: usrAppVersion, usrCountryName: usrCountryName, usrCountryShortName: usrCountryShortName,
                onSuccess: { (registration) in
                    successCallback?(registration)},
                onFailure: { (errorMessage) in
                    failureCallback?(errorMessage)
            })
        }
    
    
    
}
