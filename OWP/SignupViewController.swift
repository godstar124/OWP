//
//  SignupViewController.swift
//  OWP
//
//  Created by Andrey Klushenko on 01/05/16.
//  Copyright © 2016 Andrey Klushenko. All rights reserved.
//

import Foundation
import UIKit

class SignupViewController : UIViewController{
    
    @IBOutlet weak var txtName : UITextField!
    @IBOutlet weak var txtEmail : UITextField!
    @IBOutlet weak var txtUsername : UITextField!
    @IBOutlet weak var txtPassword : UITextField!
    @IBOutlet weak var txtConfirm : UITextField!
    
    override func viewDidLoad() {
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func viewWillAppear(animated: Bool) {
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        UIApplication.sharedApplication().statusBarHidden = true
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func back(){
        self.navigationController?.popViewControllerAnimated(true)
        //self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func register(){

        let parameters = ["email": txtEmail.text!,
                          "username": txtUsername.text!,
                          "fullname": txtName.text!,
                          "password": txtPassword.text!,
                          "lat": "14.19283928492",
                          "lng": "26.32948298384",
                          "location": "United States"]
        
        Communication.sharedInstance.sendToService(
            PATH_API_REGISTER,
            params: parameters,
            success: { responseObject in
                if let dictData = responseObject["data"] as? NSDictionary {
                    
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
                        
                        let result = responseObject.objectForKey("success")?.intValue
                        
                        if result == 1{
                            let alert = UIAlertController(title: "Success", message: "Signup Completed!!!", preferredStyle: UIAlertControllerStyle.Alert)
                            
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                            self.presentViewController(alert, animated: true, completion: nil)
                            
                            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                            appDelegate.showHomeViewController()
                        }
                        else{
                            let alert = UIAlertController(title: "Error", message: responseObject["message"] as? String, preferredStyle: UIAlertControllerStyle.Alert)
                            
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                            self.presentViewController(alert, animated: true, completion: nil)
                        }
                        
                        
                    }
                    
                    
                }
            },
            failure: { error in
                print(error)
        })
    }
    
    @IBAction func signup(){
        
        
        if (txtPassword.text! as NSString).length < 6{
            let alert = UIAlertController(title: "Error", message: "Password should be more than 6 characters", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        if txtPassword.text?.compare(txtConfirm.text!) == NSComparisonResult.OrderedSame{
            print("Same Password")
            register()
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Password and Confirm Password doesn't match", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
            
        }
    }
}

//MARK: UITextFieldDelegate
extension SignupViewController : UITextFieldDelegate{
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