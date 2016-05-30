//
//  SubscribeViewController.swift
//  OWP
//
//  Created by Andrey Klushenko on 03/05/16.
//  Copyright © 2016 Andrey Klushenko. All rights reserved.
//

import Foundation
import UIKit

class SubscribeViewController : UIViewController{
    
    @IBOutlet weak var tblSubscribeView : UICollectionView!

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
    
    @IBAction func onTouchBack(){
        print ("Touched Back Button")
    }
    
    @IBAction func onTouchSearchUser(){
        print ("Touched Search User Button")
    }
    
    @IBAction func onPostData(){
        print ("Touched Post Data Button")
    }
}

//MARK: - UICollectionViewDataSource
extension SubscribeViewController: UICollectionViewDataSource{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let res = collectionView.dequeueReusableCellWithReuseIdentifier("SubscribeViewCell", forIndexPath: indexPath) as! SubscribeViewCell
        
        return res
    }
}

//MARK: - UICollectionViewDelegate
extension SubscribeViewController: UICollectionViewDelegate{
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("Selected index : ")
        print(indexPath.row)
    }
}