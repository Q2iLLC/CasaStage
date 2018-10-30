//
//  MenuViewController.swift
//  casamobile
//
//  Created by Alexios Ladikos on 10/29/18.
//  Copyright © 2018 Alexios Ladikos. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var Email: UILabel!
    @IBOutlet var LastName: UILabel!
    @IBOutlet var Name: UILabel!
    @IBOutlet var ProfileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        MyTableView.contentInset = UIEdgeInsets(top: -28, left: 0, bottom: 0, right: 0);
        ProfileImage.layer.borderWidth = 1
        ProfileImage.layer.masksToBounds = false
        ProfileImage.layer.borderColor = UIColor.white.cgColor
        ProfileImage.layer.cornerRadius = ProfileImage.frame.height/3
        ProfileImage.clipsToBounds = true
        Name.text = Profile.sharedInstance.profileArray[0]["first_name"].stringValue
        Email.text = Items.sharedInstance.array[0]["email"].stringValue
        LastName.text = Profile.sharedInstance.profileArray[0]["last_name"].stringValue
    }
     func stringify(json: Any, prettyPrinted: Bool = false) -> String {
        var options: JSONSerialization.WritingOptions = []
        if prettyPrinted {
            options = JSONSerialization.WritingOptions.prettyPrinted
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: options)
            if let string = String(data: data, encoding: String.Encoding.utf8) {
                return string
            }
        } catch {
            print(error)
        }
        
        return ""
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].count-1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
//        cell.textLabel?.text = list[indexPath.row]
        cell.textLabel?.text = list[indexPath.section][indexPath.row+1]
        if(list[indexPath.section][indexPath.row+1]=="Edit your Profile"){
            cell.imageView?.image = UIImage(named:"icons8-user-25")

    }else{
        cell.imageView?.image = UIImage(named:listImage[indexPath.row+1])
    }
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    
        return cell
    }
    
    @IBOutlet var MyTableView: UITableView!
    let listImage = ["icons8-user-25","Update","contact","rate","About", "TOS", "logOut"]

    let list = [["Account","Edit your Profile"],["More","Check for Updates","Contact Us","Rate our App","About Us", "Terms and Policies", "Log Out"]]
    
  
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return list[section][0]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
