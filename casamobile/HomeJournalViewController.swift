//
//  HomeJournalViewController.swift
//  casamobile
//
//  Created by Alexios Ladikos on 10/28/18.
//  Copyright © 2018 Alexios Ladikos. All rights reserved.
//

import UIKit
import SwiftyJSON
class HomeJournalViewController:UITabBarController, UITabBarControllerDelegate {
    var UserData: JSON!
    var ProfileData: JSON!
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        self.hideKeyboardWhenTappedAround()

//        print(UserData)
        var data:JSON? = nil;
        if(UserData != nil){
        for (key, subJson) in UserData {
            data = subJson
        }
            Items.sharedInstance.array.append(data!)
        }
        let url = URL(string: "https://www.q2i-casa.com/users/"+Items.sharedInstance.array[0]["id"].stringValue+"/profile.json")!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                
                var data2:JSON? = nil;

                self.ProfileData = try JSON(data: data!)
                if(self.ProfileData != nil){
                    for (key, subJson) in self.ProfileData {
                        data2 = subJson
                    }
                    print("HERE LIES@@@@")

                    print(self.ProfileData)
                    Profile.sharedInstance.profileArray.append(self.ProfileData!)
                }
                //                    print("response = \(responseData)")
                
            }
            catch {
                //                    print("Could not convert JSON data into a dictionary.")
            }
         
        }
        
        task.resume()
//        print(data)
        
    }
    override func prepare( for segue: UIStoryboardSegue, sender: Any?) {
        let secondController = segue.destination as! FirstViewController
        secondController.UserData = UserData
    }
    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        let item1 = FirstViewController()
//        let icon1 = UITabBarItem(title: "Journal", image: UIImage(named:"JournalIOS"),tag: 1)
//        item1.tabBarItem = icon1
//        
//        
//        let item2 = SecondViewController()
//        let icon2 = UITabBarItem(title: "Surveys", image: UIImage(named:"survey"),tag: 2)
//        item1.tabBarItem = icon2
//        let controllers = [item1,item2]  //array of the root view controllers displayed by the tab bar interface
//        self.viewControllers = controllers
//        self.selectedIndex = 0
    }
    
    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true;
    }
}
