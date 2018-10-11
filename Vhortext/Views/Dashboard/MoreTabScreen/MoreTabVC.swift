//
//  MoreTabVC.swift
//  Vhortext
//
//  Created by LNSEL on 13/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class MoreTabVC: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionCell = MoreTabCell()
    
    var imageArray = ["InviteFriends_icon","EditProfile_icon","ViewBlockUser_icon","UpdateStatus_icon","DeleteAccount_icon","Settings_icon"]
    
    var lblNamesArray = ["Invite Fiends","Edit Profile","View Block User","Update Status","Delete Account","Settings"]
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.isScrollEnabled = false
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}


extension MoreTabVC: UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
}


extension MoreTabVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoreTabCell", for: indexPath) as! MoreTabCell
        
        
        let image = UIImage(named: imageArray[indexPath.row])
        collectionCell.imageView.image = image
        
        collectionCell.lblName.text = lblNamesArray[indexPath.row]
        
        
        return collectionCell
        
    }
 /*
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.item == 0 {
            
//            let inviteObj: ContactsList? = self.storyboard?.instantiateViewController(withIdentifier: "ContactsList") as? ContactsList
//
//
//            self.navigationController?.pushViewController(inviteObj!, animated: true)
            
            
            
        } else if indexPath.item == 1 {
            
            let profileObj: EditProfileVC? = self.storyboard?.instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
            
            self.navigationController?.pushViewController(profileObj!, animated: true)
            
            
        } else if indexPath.item == 2{
            
            let blockObj: ViewBlockUserVC? = self.storyboard?.instantiateViewController(withIdentifier: "ViewBlockUserVC") as? ViewBlockUserVC
            
            self.navigationController?.pushViewController(blockObj!, animated: true)
            
            
        } else if indexPath.item == 3 {
            
            let statusObj: UpdateStatusVC? = self.storyboard?.instantiateViewController(withIdentifier: "UpdateStatusVC") as! UpdateStatusVC
            
            self.navigationController?.pushViewController(statusObj!, animated: true)
            
        } else if indexPath.item == 4 {
            
            
            let alert = UIAlertController(title: "", message: "Do you want to delete this acount? " , preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: nil))
            
            alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) in
                
                
                
                let registrationObj: RegistrationVC? = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationVC") as? RegistrationVC
                defaults.removeObject(forKey: "UserAccessToken")//StatusID
                defaults.removeObject(forKey: "StatusID")
                defaults.removeObject(forKey: "imageSrt")
                ChatOperations.shared.deleteData()
                self.navigationController?.pushViewController(registrationObj!, animated: true)
                
                
            }))
            
            self.present(alert, animated: true, completion: nil)
            
        } else {
            
            let settingObj: SettingsVC? = self.storyboard?.instantiateViewController(withIdentifier: "SettingsVC") as? SettingsVC
            
            self.navigationController?.pushViewController(settingObj!, animated: true)
            
        }
        
        
    }*/
    
    
}


extension MoreTabVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.collectionView.bounds.size.width/2, height: self.collectionView.bounds.size.height/3)
}
}
