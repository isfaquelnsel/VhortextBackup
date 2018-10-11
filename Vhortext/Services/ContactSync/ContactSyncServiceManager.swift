//
//  SyncedContactServiceManager.swift
//  Vhortext
//
//  Created by LNSEL on 12/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Contacts



class ContactSyncServiceManager {
    
    static let instance = ContactSyncServiceManager()
    
    func callAPIGetAllUsers(url: String, usrId: String, usrDeviceId: String, usrAppType: String, usrAppVersion: String, onSuccess successCallback: ((_ message: String) -> Void)?, onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        
        let getUsersParams = ["API_KEY": UrlConstants.apiKey, "usrId": usrId, "usrDeviceId": usrDeviceId, "usrAppType": usrAppType, "usrAppVersion": usrAppVersion]
        
        
        Log.i("createRequest() called with params ==> \(getUsersParams)")
        
        self.createRequest(
            url, method: .get, parameters: getUsersParams,
            onSuccess: {(response: JSON) -> Void in
                
                Log.i("createRequest() get response ==> \(response)")
                
                let statusCode = response["statusCode"].string
                
                if statusCode == "200" {
                    
                    if let contactsData = response["data"].arrayObject {
                        
                        let contacts = contactsData as! [[String: AnyObject]]
                        
                        for contact in contacts {
                            
                            let userData = UserData()
                            
                            userData.usrId = contact["usrId"] as! String
                            userData.usrUserName = contact["usrUserName"] as! String
                            userData.usrCountryName = contact["usrCountryName"] as! String
                            userData.usrCountryCode = contact["usrCountryCode"] as! String
                            userData.usrMobileNo = contact["usrMobileNo"] as! String
                            userData.usrProfileImage = contact["usrProfileImage"] as! String
                            userData.usrLanguageId = contact["usrLanguageId"] as! String
                            userData.usrGender = contact["usrGender"] as! String
                            userData.usrStatusName = contact["usrStatusName"] as! String
                            userData.usrProfileStatus = contact["usrProfileStatus"] as! String
                            userData.usrFavoriteStatus = contact["usrFavoriteStatus"] as! String
                            userData.usrBlockStatus = contact["usrBlockStatus"] as! String
                            userData.usrRelationStatus = contact["usrRelationStatus"] as! String
                            userData.usrLanguageName = contact["usrLanguageName"] as! String
                            userData.usrNumberPrivatePermission = contact["usrNumberPrivatePermission"] as! String
                            userData.usrOnlinePermission = contact["usrOnlinePermission"] as! String
                            userData.usrMyBlockStatus = contact["usrMyBlockStatus"] as! String
                            userData.usrAppVersion = contact["usrAppVersion"] as! String
                            userData.usrAppType = contact["usrAppType"] as! String
                            
                            let vhortextCountryCode = userData.usrCountryCode
                            let vhortextMobileNo = userData.usrMobileNo

                            let vhortextNumWithCountryCode = vhortextCountryCode + vhortextMobileNo
                            let vhortextNumWithoutPlus = String(vhortextNumWithCountryCode.filter { !"+".contains($0) })
                            
                            let store = CNContactStore()
                            
                            store.requestAccess(for: .contacts){ (granted, err) in
                                if let err = err {
                                    //print("Failed to request Access: ", err)
                                    Log.e("Failed to request Access: \(err)")
                                }
                                
                                if(granted){
                                    //print("Access granted")
                                    Log.i("Access granted")
                                    
                                    let keys = [CNContactPhoneNumbersKey]
                                    let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                                    
                                    do{
                                        try store.enumerateContacts(with: request, usingBlock: {(contact, stopPointerIfYouWantToStopEnumerating) in
                                            
                                            let phoneString = contact.phoneNumbers.first?.value.stringValue ?? ""
                                            
                                            if(phoneString != ""){
                                                let getPhoneNo = (contact.phoneNumbers[0].value ).value(forKey: "digits") as! String
                                                
                                                let phoneNo = String(getPhoneNo.filter { !"()-".contains($0) })
                                                
                                                if (vhortextMobileNo == phoneNo || vhortextNumWithCountryCode == phoneNo || vhortextNumWithoutPlus == phoneNo) {
                                                    
                                                    Log.i("Matched Contact Info ==> \(userData.usrUserName)")
                                                    
                                                    /*
                                                    let usrId:String = userData.usrId
                                                    let isExist = UserContactModel.shared.isUserExist(usrId: usrId)
                                                    
                                                    if(!isExist){
                                                        let isInserted = UserContactModel.shared.insertUser(userData:userData)
                                                        
                                                        if(isInserted){
                                                            print()
                                                        }else{
                                                            
                                                        }
                                                    }*/
                                                    
 
                                                }
                                                
                                                
                                            }
                                            
                                            
                                            
                                        })
                                        
                                    } catch let err {
                                        //print("Failed to enumurate contacts: ",err)
                                        Log.e("Failed to enumurate contacts: \(err)")
                                        
                                    }
                                    
                                    
                                    
                                }else{
                                    //print("Access Denied")
                                    Log.w("Access Denied")
                                }
                                
                            }
                            
                            
                            
                            
                            
                        }
                        
                    }
                    
                    //successCallback?(resendData)
                    
                    
                }else {
                    failureCallback?("An error has occured.")
                    Log.e("An error has occured")
                }
                
        },
            onFailure: {(errorMessage: String) -> Void in
                failureCallback?(errorMessage)
                Log.e(errorMessage)
        }
        )
        
    }
    
    
    
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
