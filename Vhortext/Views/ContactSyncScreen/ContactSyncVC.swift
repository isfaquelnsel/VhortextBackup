//
//  WelComeVC.swift
//  Vhortext
//
//  Created by LNSEL on 12/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit
import Contacts
import Toast_Swift

class ContactSyncVC: UIViewController {

    
    @IBOutlet weak var lblSync: UILabel!
    @IBOutlet weak var btnContinue: UIButton!
    
    var style = ToastStyle()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblSync.text = "Please wait while your contacts are \n being synced."
        
        btnContinue.backgroundColor = UIColor(red: 35/255, green: 8/255, blue: 1/255, alpha: 1)
        
        
        let usrAppType = UserDefaults.standard.getUsrAppType()
        let usrAppVersion = UserDefaults.standard.getUsrAppVersion()
        let usrDeviceId = UserDefaults.standard.getUsrDeviceId()
        let usrId = UserDefaults.standard.getUsrId()
        
        let contactSyncPresenter = ContactSyncPresenter(contactSyncService: ContactSyncService())
        contactSyncPresenter.attachView(view: self)
        
        //fetchContacts()
        
        var getAllUsersUrl = String()
        getAllUsersUrl = UrlConstants.apiGetUsers
        
        
        Log.i("getSyncedContacts() called")
        contactSyncPresenter.getSyncedContacts(url: getAllUsersUrl, usrId: usrId, usrDeviceId: usrDeviceId, usrAppType: usrAppType, usrAppVersion: usrAppVersion)
        
      
        
    }

    @IBAction func continueAction(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "InviteContacts", bundle: Bundle.main).instantiateViewController(withIdentifier: "InviteContactsVC") as? InviteContactsVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    
    func fetchContacts(){
        print("ContactSyncVC: Fetch Contacts started...")
        
        let store = CNContactStore()
        
        store.requestAccess(for: .contacts){ (granted, err) in
            if let err = err {
                print("Failed to request Access: ", err)
            }
            
            if(granted){
                print("Access granted")
                
                let keys = [CNContactPhoneNumbersKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                
                do{
                    try store.enumerateContacts(with: request, usingBlock: {(contact, stopPointerIfYouWantToStopEnumerating) in
                        
                        let phone1 = contact.phoneNumbers.first?.value.stringValue ?? ""
                        //print("Phone1: \(phone1)")
                        
                        if(phone1 != ""){
                            let phone2 = (contact.phoneNumbers[0].value as! CNPhoneNumber).value(forKey: "digits") as! String
                            print("Phone2: \(phone2)")
                            
                        }



                    })
                    
                } catch let err {
                    print("Failed to enumurate contacts: ",err)
                    
                }
                
                
                
            }else{
                print("Access Denied")
            }
            
        }
    }
    


}


extension ContactSyncVC: ContactSyncView{
    
    func startLoading(){
        //activityLoader.startAnimating()
    }
    
    func contactSyncSuccess(message: String){
        //activityLoader.stopAnimating()
        self.style.messageColor = .green
        self.view.makeToast(message, duration: 2.0, position: .center, style: self.style)
    }
    
    func contactSyncFailed(message: String) {
        //activityLoader.stopAnimating()
        self.style.messageColor = .white
        self.view.makeToast(message, duration: 2.0, position: .center, style: self.style)
    }
    
}
