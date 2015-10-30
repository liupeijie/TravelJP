//
//  AddViewController.swift
//  TravelJP
//
//  Created by 向日葵会下雨 on H27/10/16.
//  Copyright © 平成27年 向日葵会下雨. All rights reserved.
//

import Foundation
import UIKit

class AddViewController: UIViewController {
    let saveData = NSUserDefaults.standardUserDefaults()
    var spotArray: [AnyObject] = []
    var spotArray2: [AnyObject] = []
    var spotArray3: [AnyObject] = []
    var fileNumber = 0
   
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //=======================================================値受け取り
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        fileNumber = appDelegate.ViewVal3
        print("aaaaaa:\(fileNumber)")
        //=======================================================
        if(fileNumber == 1){
            if (saveData.objectForKey("file1Key") != nil ){
                spotArray = saveData.objectForKey("file1Key") as! Array
                print("No.1:\(spotArray[0])")
            }
        }else if(fileNumber == 2){
            if (saveData.objectForKey("file2Key") != nil ){
                spotArray2 = saveData.objectForKey("file2Key") as! Array
                print("No.2:\(spotArray2[0])")
            }
        }else if(fileNumber == 3){
            if (saveData.objectForKey("file3Key") != nil ){
                spotArray3 = saveData.objectForKey("file3Key") as! Array
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("aaaaaa:")
        print("aaaaaa:\(fileNumber)")
//        print("No.1:\(spotArray[0])")
//        print("No.2:\(spotArray2[0])")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func return3 (segue: UIStoryboardSegue) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}