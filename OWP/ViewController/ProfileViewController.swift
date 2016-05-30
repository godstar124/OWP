//
//  SettingsViewController.swift
//  OWP
//
//  Created by Andrey Klushenko on 03/05/16.
//  Copyright © 2016 Andrey Klushenko. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController : UIViewController{
    
    @IBOutlet weak var lblTrackersCnt : UILabel!
    @IBOutlet weak var lblTrackingCnt : UILabel!
    @IBOutlet weak var lblPostsCnt : UILabel!
    @IBOutlet weak var lblRephrasedCnt : UILabel!
    
    @IBOutlet weak var lblUserName : UILabel!
    @IBOutlet weak var lblFullName : UILabel!
    @IBOutlet weak var lblUserBio : UILabel!
    
    @IBOutlet weak var tblPostData : UITableView!
    
    @IBAction func onTouchSetting(){
        print ("Touched Settings Button")
        
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("OWPSettingsViewController") as? SettingsViewController
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func onTouchSearchUser(){
        print ("Touched Search User Button")
    }
    
    @IBAction func onPostData(){
        print ("Touched Post Data Button")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        UIApplication.sharedApplication().statusBarHidden = false
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
}

//MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let res = tableView.dequeueReusableCellWithIdentifier("ProfileViewCell", forIndexPath: indexPath) as! ProfileViewCell
        
        return res
    }
}

//MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Seleted index : ")
        print(indexPath.row)
    }
}