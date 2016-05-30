//
//  Constants.swift
//  OWP
//
//  Created by Andrey Klushenko on 03/05/16.
//  Copyright © 2016 Andrey Klushenko. All rights reserved.
//

import Foundation
import UIKit

let PATH_API_HOME = "http://192.168.0.189/webservice/"

let PATH_API_REGISTER = "user_api/register.php"
let PATH_API_LOGIN = "user_api/login.php"

let PATH_API_SUBMITPOST = "post_api/submit_post.php"
let PATH_API_GETSINGLEPOST = "post_api/get_single_post.php"
let PATH_API_GETFEED = "post_api/get_post.php"

let PATH_API_GETSINGLEUSER = "user_api/get_single_user.php"

let PATH_API_UPDATEPROFILE = "user_api/update_profile.php"

var gCurrentUserInfo : UserInfo!

var gCheckedFollow = false
var gCheckedVouch = false
var gCheckedRephrased = false
var gCheckedMessage = false

class UserInfo : NSObject, NSCoding{
    // MARK: Properties
    var userID : String = ""
    var email : String = ""
    var username : String = ""
    var sess_token : String = ""
    var profile_photo : String = ""
    var fullname : String = ""
    var followers_count : String = ""
    var followings_count : String = ""
    var last_login : String = ""
    var register_date : String = ""
    var posts_count : String = ""
    var picture_count : String = ""
    var video_count : String = ""
    var location : String = ""
    
    init(userID : String, email : String,  username : String,
         sess_token : String, profile_photo : String,
         fullname : String, followers_count : String,
         followings_count : String,
         last_login : String, register_date : String, posts_count : String,
         picture_count : String, video_count : String, location: String) {
        
        self.userID = userID
        self.email = email
        self.username = username
        self.sess_token = sess_token
        self.profile_photo = profile_photo
        self.fullname = fullname
        self.followers_count = followers_count
        self.followings_count = followings_count
        self.last_login = last_login
        self.register_date = register_date
        self.posts_count = posts_count
        self.picture_count = picture_count
        self.video_count = video_count
        self.location = location
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(userID, forKey: "userID")
        aCoder.encodeObject(email, forKey: "email")
        aCoder.encodeObject(username, forKey: "username")
        aCoder.encodeObject(sess_token, forKey: "sess_token")
        aCoder.encodeObject(profile_photo, forKey: "profile_photo")
        aCoder.encodeObject(fullname, forKey: "fullname")
        aCoder.encodeObject(followers_count, forKey: "followers_count")
        aCoder.encodeObject(followings_count, forKey: "followings_count")
        aCoder.encodeObject(last_login, forKey: "last_login")
        aCoder.encodeObject(register_date, forKey: "register_date")
        aCoder.encodeObject(posts_count, forKey: "posts_count")
        aCoder.encodeObject(picture_count, forKey: "picture_count")
        aCoder.encodeObject(video_count, forKey: "video_count")
        aCoder.encodeObject(location, forKey: "location")
    }
    
    internal required init?(coder aDecoder: NSCoder){
        self.userID = aDecoder.decodeObjectForKey("userID") as! String
        self.email = aDecoder.decodeObjectForKey("email") as! String
        self.username = aDecoder.decodeObjectForKey("username") as! String
        self.sess_token = aDecoder.decodeObjectForKey("sess_token") as! String
        self.profile_photo = aDecoder.decodeObjectForKey("profile_photo") as! String
        self.fullname = aDecoder.decodeObjectForKey("fullname") as! String
        self.followers_count = aDecoder.decodeObjectForKey("followers_count") as! String
        self.followings_count = aDecoder.decodeObjectForKey("followings_count") as! String
        self.last_login = aDecoder.decodeObjectForKey("last_login") as! String
        self.register_date = aDecoder.decodeObjectForKey("register_date") as! String
        self.posts_count = aDecoder.decodeObjectForKey("posts_count") as! String
        self.picture_count = aDecoder.decodeObjectForKey("picture_count") as! String
        self.video_count = aDecoder.decodeObjectForKey("video_count") as! String
        self.location = aDecoder.decodeObjectForKey("location") as! String
    }
}


