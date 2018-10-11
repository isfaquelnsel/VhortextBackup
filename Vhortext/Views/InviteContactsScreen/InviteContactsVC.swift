//
//  InviteContactVC.swift
//  Vhortext
//
//  Created by LNSEL on 12/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class InviteContactsVC: UIViewController {

    
    
    @IBOutlet weak var contactsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var btnSkip: UIButton!
    
    //@IBOutlet weak var btnSkipHeightConstraints: NSLayoutConstraint!
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    
    @IBAction func btnBackAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func btnDoneAction(_ sender: Any) {
        
        
    }
   // var tabBarController: UITabBarController? { get }
    
    @IBAction func btnSkipAction(_ sender: Any) {
        
      //  defaults.set("UserAccessToken", forKey: "UserAccessToken")
        
//        let vc = UIStoryboard.init(name: "DashboardTabManager", bundle: Bundle.main).instantiateViewController(withIdentifier: "DashboardTabManagerVC") as? DashboardTabManagerVC
//
//        //self.tabBarController?.present(vc!, animated: true, completion: nil)
//
//        self.tabBarController?.navigationController?.pushViewController(vc!, animated: true)
       
        let vc = UIStoryboard.init(name: "DashboardTabManager", bundle: Bundle.main).instantiateViewController(withIdentifier: "DashboardTabManagerVC") as? DashboardTabManagerVC
        
       self.navigationController?.pushViewController(vc!, animated: true)
     
        //tabBarController?.selectedIndex = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

  
}


extension InviteContactsVC: InviteContactView{
    
    func startLoading(){
        
        
    }
    
}
