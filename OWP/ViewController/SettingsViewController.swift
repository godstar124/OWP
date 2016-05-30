//
//  SettingsViewController.swift
//  OWP
//
//  Created by Andrey Klushenko on 03/05/16.
//  Copyright © 2016 Andrey Klushenko. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController : UIViewController{
    
    @IBOutlet weak var btnCheckFollow : UIButton!
    @IBOutlet weak var btnCheckRephrased : UIButton!
    @IBOutlet weak var btnCheckVouch : UIButton!
    @IBOutlet weak var btnCheckMessage : UIButton!
    
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
    
    @IBAction func onTouchSearchUser(){
        print ("Touched Search User Button")
    }
    
    @IBAction func onPostData(){
        print ("Touched Post Data Button")
    }
    
    @IBAction func onSignout(){
        print ("Touched Signout")
    }
    
    @IBAction func onChangePicture(){
        print ("Touched Change Picture")
    }
    
    @IBAction func onUpdateBio(){
        print ("Touched Change Bio")
    }
    
    @IBAction func onUpdateEmail(){
        print ("Touched Update Email")
    }
    
    @IBAction func onUpdateName(){
        print ("Touched Update Name")
    }
    
    @IBAction func onUpdateUsername(){
        print ("Touched Update Username")
    }
    
    @IBAction func onCheckFollow(){
        
        let image_check = UIImage(named: "check_icon")
        let image_checked = UIImage(named: "checked_icon")
        
        if gCheckedFollow == false{
            btnCheckFollow.setImage(image_checked, forState: UIControlState.Normal)
            gCheckedFollow = true
            print ("Checked Follow")
        }
        else{
            btnCheckFollow.setImage(image_check, forState: UIControlState.Normal)
            gCheckedFollow = false
            print ("UnChecked Follow")
        }
        
    }
    
    @IBAction func onCheckRephrased(){
        
        let image_check = UIImage(named: "check_icon")
        let image_checked = UIImage(named: "checked_icon")
        
        if gCheckedRephrased == false{
            btnCheckRephrased.setImage(image_checked, forState: UIControlState.Normal)
            gCheckedRephrased = true
            print ("Checked Rephrased")
        }
        else{
            btnCheckRephrased.setImage(image_check, forState: UIControlState.Normal)
            gCheckedRephrased = false
            print ("UnChecked Rephrased")
        }
    }
    
    @IBAction func onCheckVouch(){
        
        let image_check = UIImage(named: "check_icon")
        let image_checked = UIImage(named: "checked_icon")
        
        if gCheckedVouch == false{
            btnCheckVouch.setImage(image_checked, forState: UIControlState.Normal)
            gCheckedVouch = true
            print ("Checked Vouch")
        }
        else{
            btnCheckVouch.setImage(image_check, forState: UIControlState.Normal)
            gCheckedVouch = false
            print ("UnChecked Vouch")
        }
    }
    
    @IBAction func onCheckMessage(){
        
        let image_check = UIImage(named: "check_icon")
        let image_checked = UIImage(named: "checked_icon")
        
        if gCheckedMessage == false{
            btnCheckMessage.setImage(image_checked, forState: UIControlState.Normal)
            gCheckedMessage = true
            print ("Checked Message")
        }
        else{
            btnCheckMessage.setImage(image_check, forState: UIControlState.Normal)
            gCheckedMessage = false
            print ("UnChecked Message")
        }

    }
    
}