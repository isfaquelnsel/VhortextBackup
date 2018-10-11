//
//  ChatListTabCell.swift
//  Vhortext
//
//  Created by LNSEL on 13/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class ChatListTabCell: UITableViewCell {

    @IBOutlet weak var imgFriend: UIImageView!
    @IBOutlet weak var lblFriendName: UILabel!
    
    @IBOutlet weak var imgStatus: UIImageView!
    
    @IBOutlet weak var imgFavorite: UIImageView!
    
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var viewOnlineStatus: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
