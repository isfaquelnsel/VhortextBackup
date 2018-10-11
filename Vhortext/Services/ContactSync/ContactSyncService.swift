//
//  SyncedContactService.swift
//  Vhortext
//
//  Created by LNSEL on 12/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import Foundation


class ContactSyncService {
    
    
    func callAPIGetAllUsers(url: String, usrId: String, usrDeviceId: String, usrAppType: String, usrAppVersion: String, onSuccess successCallback: ((_ message: String) -> Void)?,
                              onFailure failureCallback: ((_ errorMessage: String) -> Void)?){
            Log.i("callAPIGetAllUsers() called")
            ContactSyncServiceManager.instance.callAPIGetAllUsers(url: url, usrId: usrId, usrDeviceId: usrDeviceId, usrAppType: usrAppType, usrAppVersion: usrAppVersion,
                                                                  onSuccess: { (message) in
                                                                    successCallback?(message)},
                                                                  onFailure: { (errorMessage) in
                                                                    failureCallback?(errorMessage)
            })
        }
        
    
    
}
