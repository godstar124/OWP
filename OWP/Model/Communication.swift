//
//  Communication.swift
//  OWP
//
//  Created by Andrey Klushenko on 03/05/16.
//  Copyright © 2016 Andrey Klushenko. All rights reserved.
//

import Foundation
import AFNetworking

class Communication : NSObject{
    static let sharedInstance = Communication()
    
    func sendToService(url: String, params: NSDictionary,
                       success: (responseObject : AnyObject!) -> Void,
                       failure: (error: NSError!) -> Void){
        
        let manager = AFHTTPSessionManager(baseURL: NSURL(string: PATH_API_HOME))
        
//        manager.responseSerializer = AFHTTPResponseSerializer()
        
        manager.POST(url, parameters: params, success: { task, responseObject in
                print(task.state)
            
//                let data : NSData = (responseObject as? NSData)!
            
                do{
                    let dict = responseObject as? NSDictionary
                
                print(dict)
                success(responseObject: dict)
                
                }
                catch{
                
                }
            
            }) { task, error in
                print(error)
                failure(error: error)
                
        }
    }
}