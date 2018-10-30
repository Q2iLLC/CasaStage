//
//  SecondViewController.swift
//  casamobile
//
//  Created by Alexios Ladikos on 10/28/18.
//  Copyright © 2018 Alexios Ladikos. All rights reserved.
//

import UIKit
import SwiftyJSON
class SecondViewController: UIViewController {
    var UserData: JSON!

 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        self.title = "Journal"
        let icon1 = UITabBarItem(title: "Journal", image: UIImage(named:"JournalIOS"),tag: 1)
        self.tabBarItem = icon1
        print("item 2 loaded")
//        print(Items.sharedInstance.array)

        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func MenuTapped(_ sender: Any) {
    }
    
 
}

