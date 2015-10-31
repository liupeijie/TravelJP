//
//  mapViewController.swift
//  TravelJP
//
//  Created by 向日葵会下雨 on H27/10/17.
//  Copyright © 平成27年 向日葵会下雨. All rights reserved.
//

import UIKit

class mapViewController: UIViewController {
    var prefectureNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func hokaido() {
        prefectureNumber = 1
    }
    @IBAction func kanto() {
        prefectureNumber = 2
    }
    @IBAction func okinawa() {
        prefectureNumber = 3
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //==========================================================================値渡しのためのもの
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.ViewVal4 = prefectureNumber //Stringの値を引き渡す(ポインタ)
    }

}
