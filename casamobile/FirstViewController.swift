//
//  FirstViewController.swift
//  casamobile
//
//  Created by Alexios Ladikos on 10/28/18.
//  Copyright © 2018 Alexios Ladikos. All rights reserved.
//

import UIKit
import SwiftyJSON

class FirstViewController: UIViewController {
    var UserData: JSON!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

//        self.title = "Journal"
        self.title = "Home"
        let icon1 = UITabBarItem(title: "Home", image: UIImage(named:"home"),tag: 2)
        self.tabBarItem = icon1
        print("item 1 loaded")
        
//        substring(from:7,to:Items.sharedInstance.array[0].count-2)
//       print(Items.sharedInstance.array)
        // Do any additional setup after loading the view, typically from a nib.
    }


}

