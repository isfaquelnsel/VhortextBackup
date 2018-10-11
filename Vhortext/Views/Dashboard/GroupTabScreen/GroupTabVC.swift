//
//  GroupTabVC.swift
//  Vhortext
//
//  Created by LNSEL on 13/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class GroupTabVC: UIViewController {

    
    
    @IBOutlet weak var tblViewGroupChating: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var groupCell = GroupTabCell()
    
    var groupNames = ["Lnsel","iOS"]
    var category = ["Admin","user"]
    var groupMessage = ["fine","at work"]
    var messageTime = ["9:38AM","2:15PM"]
    
    override func viewDidLoad() {
        super.viewDidLoad()


        tblViewGroupChating.delegate = self
        tblViewGroupChating.dataSource = self
        
        tblViewGroupChating.tableFooterView = UIView()
        tblViewGroupChating.alwaysBounceVertical = false
        
        
    }

    
      @IBAction func btnCreateGroup(_ sender: Any) {
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

  

}

extension GroupTabVC: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let chatObj: GroupConversationVC? = self.storyboard?.instantiateViewController(withIdentifier: "GroupConversationVC") as? GroupConversationVC
//
//        self.navigationController?.pushViewController(chatObj!, animated: true)
        
    }
}


extension GroupTabVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return groupNames.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        groupCell = tableView.dequeueReusableCell(withIdentifier: "GroupTabCell") as! GroupTabCell
        
        groupCell.lblGroupName.text = groupNames[indexPath.row]
        groupCell.lblGroupAdmin.text = category[indexPath.row]
        groupCell.lblGroupMessage.text = groupMessage[indexPath.row]
        groupCell.lblMessageTime.text = messageTime[indexPath.row]
        
        return groupCell
        
    }
}


