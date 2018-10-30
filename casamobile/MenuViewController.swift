//
//  MenuViewController.swift
//  casamobile
//
//  Created by Alexios Ladikos on 10/29/18.
//  Copyright © 2018 Alexios Ladikos. All rights reserved.
//

import UIKit
import SafariServices

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,SFSafariViewControllerDelegate {
    
    @IBOutlet var Email: UILabel!
    @IBOutlet var LastName: UILabel!
    @IBOutlet var Name: UILabel!
    @IBOutlet var ProfileImage: UIImageView!
    var myIndex = 0
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
    func rateApp(appId: String, completion: @escaping ((_ success: Bool)->())) {
        guard let url = URL(string : "itms-apps://itunes.apple.com/app/" + appId) else {
            completion(false)
            return
        }
        guard #available(iOS 10, *) else {
            completion(UIApplication.shared.openURL(url))
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: completion)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        if(list[indexPath.section][indexPath.row+1]=="Edit your Profile"){
            performSegue(withIdentifier: "MySegue", sender: self)
        }
        else if(list[indexPath.section][indexPath.row+1]=="Check for Updates"){
            
        }
        else if(list[indexPath.section][indexPath.row+1]=="Rate our App"){
            
        }
        else if(list[indexPath.section][indexPath.row+1]=="Contact Us"){
            
        }
        else if(list[indexPath.section][indexPath.row+1]=="About Us"){
//            UIApplication.shared.openURL(NSURL(string: "https://www.q2i-oars.com/about")! as URL)
            openSafariVC(self,url: "https://www.q2i-oars.com/about")

        }
        else if(list[indexPath.section][indexPath.row+1]=="Terms and Policies"){
//            UIApplication.shared.openURL(NSURL(string: "https://www.q2i-casa.com/privacy")! as URL)
            openSafariVC(self,url: "https://www.q2i-casa.com/privacy")
        }
        else if(list[indexPath.section][indexPath.row+1]=="Log Out"){
            performSegue(withIdentifier: "LogOut", sender: self)


        }
        else{
            
        }
//        performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
    }
    func openSafariVC (_ sender: Any, url: String){
        let safariVc = SFSafariViewController(url: NSURL(string: url ) as! URL)
        self.present(safariVc, animated: true, completion: nil)
        safariVc.delegate = self
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
