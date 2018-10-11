//
//  ChatListTabVC.swift
//  Vhortext
//
//  Created by LNSEL on 13/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class ChatListTabVC: UIViewController {

    
    @IBOutlet weak var tblChatingList:
    UITableView!
    
    @IBOutlet weak var tblMoreOptions: UITableView!
    
    @IBOutlet weak var viewTransparent: UIView!
    
    var chatListTabCell = ChatListTabCell()
    
    var chatListNames = ["hari","satish"]
    var chatListMessage = ["good morning","Hi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewTransparent.isHidden = true
        tblMoreOptions.isHidden = true
        
        tblChatingList.delegate = self
        tblChatingList.dataSource = self
        
    }

    
     @IBAction func btnPersonSelected(_ sender: Any) {
        
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}


    extension ChatListTabVC: UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
   
    
    
}


extension ChatListTabVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chatListNames.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        chatListTabCell = tableView.dequeueReusableCell(withIdentifier: "ChatListTabCell") as! ChatListTabCell
   
        
        chatListTabCell.lblFriendName.text = chatListNames[indexPath.row]
        chatListTabCell.lblMessage.text = chatListMessage[indexPath.row]
        return chatListTabCell
        
    }
}
