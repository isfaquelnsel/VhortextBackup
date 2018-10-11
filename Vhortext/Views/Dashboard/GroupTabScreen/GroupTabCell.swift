//
//  GroupTabCell.swift
//  Vhortext
//
//  Created by LNSEL on 13/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class GroupTabCell: UITableViewCell {

    
    @IBOutlet weak var imgGroup: UIImageView!
    @IBOutlet weak var lblGroupName: UILabel!
    @IBOutlet weak var lblGroupAdmin: UILabel!
    @IBOutlet weak var lblGroupMessage: UILabel!
    @IBOutlet weak var lblMessageTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
