//
//  ContactTabVC.swift
//  Vhortext
//
//  Created by LNSEL on 13/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class ContactTabVC: UIViewController {

    
     @IBOutlet weak var DBConctactTableView: UITableView!
    
    
    var contactCell = ContactTabCell()
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    
    @IBAction func btnPersonSelected(_ sender: Any) {
        
    }
    
    
    @IBAction func btnRefresh(_ sender: Any) {
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}
