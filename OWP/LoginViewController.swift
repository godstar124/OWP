//
//  LoginViewController.swift
//  OWP
//
//  Created by Andrey Klushenko on 01/05/16.
//  Copyright © 2016 Andrey Klushenko. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController : UIViewController{
    
    @IBOutlet weak var txtUsername : UITextField!
    @IBOutlet weak var txtPassword : UITextField!
    
    override func viewDidLoad() {
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func viewWillAppear(animated: Bool) {
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        UIApplication.sharedApplication().statusBarHidden = true
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func back(){
        self.navigationController?.popViewControllerAnimated(true)
        //self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func login(){
        let parameters = ["email": txtUsername.text!,
                          "password": txtPassword.text!]
        
        Communication.sharedInstance.sendToService(
            PATH_API_LOGIN,
            params: parameters,
            success: { responseObject in
                
                let result = responseObject.objectForKey("success")?.intValue
                
                if result == 1 {
                    
                    let dictData = responseObject["data"] as! NSDictionary
                    if dictData.count == 0{
                        let alert = UIAlertController(title: "Error", message: responseObject["message"] as? String, preferredStyle: UIAlertControllerStyle.Alert)
                        
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                        self.presentViewController(alert, animated: true, completion: nil)
                    }
                    else if dictData.count > 0{
                        let dicUser = dictData.objectForKey("user") as? NSDictionary
                        
                        gCurrentUserInfo = UserInfo(userID: (dicUser?.objectForKey("user_id"))! as! String,
                            email: dicUser?.objectForKey("email") as! String,
                            username: dicUser?.objectForKey("username") as! String,
                            sess_token: dicUser?.objectForKey("sess_token") as! String,
                            profile_photo: (dicUser?.objectForKey("profile_photo"))! as! String,
                            fullname: (dicUser?.objectForKey("fullname"))! as! String,
                            followers_count: (dicUser?.objectForKey("followers_count"))! as! String,
                            followings_count: (dicUser?.objectForKey("followings_count"))! as! String,
                            last_login: (dicUser?.objectForKey("last_login"))! as! String,
                            register_date: dicUser?.objectForKey("register_date") as! String,
                            posts_count: (dicUser?.objectForKey("posts_count"))! as! String,
                            picture_count: dicUser?.objectForKey("picture_count") as! String,
                            video_count: dicUser?.objectForKey("video_count") as! String,
                            location: dicUser?.objectForKey("location") as! String)
                        
                        /*
                        let alert = UIAlertController(title: "Error", message: "Login Success!!!", preferredStyle: UIAlertControllerStyle.Alert)
                        
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                        self.presentViewController(alert, animated: true, completion: nil) */
                        
                        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                        appDelegate.showHomeViewController()
                        
                    }
                }
                else{
                    let alert = UIAlertController(title: "Error", message: responseObject["message"] as? String, preferredStyle: UIAlertControllerStyle.Alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            },
            failure: { error in
                print(error)
        })

    }
}

//MARK: UITextFieldDelegate
extension LoginViewController : UITextFieldDelegate{
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    
}