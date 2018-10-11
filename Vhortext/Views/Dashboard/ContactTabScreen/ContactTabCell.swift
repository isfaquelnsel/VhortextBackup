//
//  ContactTabCell.swift
//  Vhortext
//
//  Created by LNSEL on 13/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class ContactTabCell: UITableViewCell {

    @IBOutlet weak var contactImage: UIImageView!
    
    @IBOutlet weak var contactName: UILabel!
    
    @IBOutlet weak var contactStatus: UILabel!
    @IBOutlet weak var contactBlock: UIButton!
    
    @IBOutlet weak var contactFavorite: UIButton!
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var onlineStatusView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
