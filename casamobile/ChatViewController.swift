//
//  ChatViewController.swift
//  casamobile
//
//  Created by Alexios Ladikos on 10/29/18.
//  Copyright © 2018 Alexios Ladikos. All rights reserved.
//

import UIKit
import SwiftyJSON
class ChatViewController: UIViewController {
    var UserData: JSON!

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
            self.hideKeyboardWhenTappedAround()
            self.title = "Chat"
            let icon1 = UITabBarItem(title: "Chat", image: UIImage(named:"chat"),tag: 2)
            self.tabBarItem = icon1
//            print("item 3 loaded")
//            print(Items.sharedInstance.array)

            // Do any additional setup after loading the view, typically from a nib.
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


