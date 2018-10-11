//
//  RegistrationServiceManager.swift
//  Vhortext
//
//  Created by LNSEL on 12/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RegistrationServiceManager {
    
    
    static let instance = RegistrationServiceManager()
    
    /*---------------------Registration API Calling(start)-----------------------*/
    func callAPIRegistration(url: String, usrUserName: String, usrMobileNo: String, usrDeviceId: String, usrTokenId: String, usrCountryCode: String, usrAppType: String, usrAppVersion: String, usrCountryName: String, usrCountryShortName: String, onSuccess successCallback: ((_ registration: RegistrationReturnData) -> Void)?, onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        
        let params = ["API_KEY" : UrlConstants.apiKey, "usrUserName": usrUserName, "usrMobileNo": usrMobileNo, "usrDeviceId" : usrDeviceId, "usrTokenId" : usrTokenId, "usrCountryCode" : usrCountryCode, "usrAppType" : usrAppType, "usrAppVersion": usrAppVersion, "usrCountryName": usrCountryName, "usrCountryShortName": usrCountryShortName]
        
        

        Log.i("createRequest() called with Params==> \(params)")
        self.createRequest(
            url, method: .post, parameters: params,
            onSuccess: {(response: JSON) -> Void in

                Log.i("createRequest() Response==> \(response)")
                if let regResponse = response.dictionaryObject {
                    
                     let statusCode = regResponse["statusCode"] as! String
                        
                        if statusCode == "200" {
                    
                            let usrCountryCode = regResponse["usrCountryCode"] as! String
                            let usrMobileNo = regResponse["usrMobileNo"] as! String
                            let message = regResponse["message"] as! String
                            let usrUserName = regResponse["usrUserName"] as! String
                            
                            let data = RegistrationReturnData()
                            
                            data.usrCountryCode = usrCountryCode
                            data.usrMobileNo = usrMobileNo
                            data.message = message
                            data.usrUserName = usrUserName
                            
                            
                            successCallback?(data)
                            
                            
                    }
                   
                    
                    
                
                } else {
                    failureCallback?("An error has occured.")
                    Log.e("An error has occured")
                }
                
        },
            onFailure: {(errorMessage: String) -> Void in
                failureCallback?(errorMessage)
        }
        )
        
    }
    /*---------------------Registration API Calling(end)-----------------------*/
    

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
