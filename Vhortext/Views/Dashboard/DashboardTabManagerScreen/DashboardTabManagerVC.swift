//
//  DashboardTabVC.swift
//  Vhortext
//
//  Created by LNSEL on 13/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class DashboardTabManagerVC: UITabBarController,UINavigationControllerDelegate {

    
    
    @IBOutlet weak var selectionBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().barTintColor = UIColor(red: 29/255, green: 1/255, blue: 0/255, alpha: 1)
        
        // Sets the background color of the selected UITabBarItem (using and plain colored UIImage with the width = 1/5 of the tabBar (if you have 5 items) and the height of the tabBar)
        UITabBar.appearance().selectionIndicatorImage = UIImage().makeImageWithColorAndSize(color: UIColor(red: 58/255, green: 33/255, blue: 32/255, alpha: 1), size: CGSize(width: selectionBar.frame.width/5, height: selectionBar.frame.height))
        //583332
        // Uses the original colors for your images, so they aren't not rendered as grey automatically.
        for item in (self.selectionBar.items)! {
            if let image = item.image {
                item.image = image.withRenderingMode(.alwaysOriginal)
            }
        }
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}

extension UIImage {
    func makeImageWithColorAndSize(color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
