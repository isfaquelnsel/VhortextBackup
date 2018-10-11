//
//  FavoriteTabVC.swift
//  Vhortext
//
//  Created by LNSEL on 13/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class FavoriteTabVC: UIViewController {

    
    @IBOutlet weak var favoriteTableView: UITableView!
    
    
    var favoriteCell = FavoriteTabCell()
    
    var favNames = ["hari","satish"]
    var favMessage = ["good morning","Hi"]
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
        
        favoriteTableView.tableFooterView = UIView()
        favoriteTableView.alwaysBounceVertical = false
        

    }

    
    @IBAction func btnPeopleSelected(_ sender: Any) {
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}


extension FavoriteTabVC: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let chatObj: ConversationVC? = self.storyboard?.instantiateViewController(withIdentifier: "CommonChatVC") as? ConversationVC
//
//        self.navigationController?.pushViewController(chatObj!, animated: true)
        
    }
    
    
}


extension FavoriteTabVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return favNames.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        favoriteCell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTabCell") as! FavoriteTabCell
        
        favoriteCell.favoriteFriendName.text = favNames[indexPath.row]
        favoriteCell.favoriteMessage.text = favMessage[indexPath.row]
        
        return favoriteCell
        
        
}
}
