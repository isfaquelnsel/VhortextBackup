//
//  SyncedContactPresenter.swift
//  Vhortext
//
//  Created by LNSEL on 12/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import Foundation


protocol ContactSyncView: NSObjectProtocol{
    
    func startLoading()
    func contactSyncSuccess(message: String)
    func contactSyncFailed(message: String)
    
}


class ContactSyncPresenter{
    
    private let contactSyncService:ContactSyncService
    weak private var contactSyncView: ContactSyncView?
    
    init(contactSyncService:ContactSyncService){
        self.contactSyncService = contactSyncService
    }
    
    func attachView(view:ContactSyncView){
        contactSyncView = view
    }
    
    func detachView() {
        contactSyncView = nil
    }
    
    
    func getSyncedContacts(url: String, usrId: String, usrDeviceId: String, usrAppType: String, usrAppVersion: String){
        
        self.contactSyncView?.startLoading()
       
        Log.i("callAPIGetAllUsers() called")
        contactSyncService.callAPIGetAllUsers(url: url, usrId: usrId, usrDeviceId: usrDeviceId, usrAppType: usrAppType, usrAppVersion: usrAppVersion, onSuccess: { (message) in
            self.contactSyncView?.contactSyncSuccess(message: message)
        }, onFailure: { (errorMessage) in
            self.contactSyncView?.contactSyncFailed(message: errorMessage)
        })
    }
    
    
    
    
}



