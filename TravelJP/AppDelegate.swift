//
//  AppDelegate.swift
//  TravelJP
//
//  Created by 向日葵会下雨 on H27/10/11.
//  Copyright © 平成27年 向日葵会下雨. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

//==============================================値渡しのための配列を用意(fileName用)
    private var viewVal: [AnyObject] = []
    private var viewVal2: Int!
    private var viewVal3: Int!
    private var viewVal4: Int!
    var ViewVal: [AnyObject] {//※値が整数型の場合はInt
        get {
            return viewVal //値を受け取る側にviewValを返す。
        }
        set {
            viewVal = newValue //引き渡す値をviewValに入れる。
        }
    }
    
    var ViewVal2: Int {//※値が整数型の場合はInt
        get {
            return viewVal2 //値を受け取る側にviewValを返す。
        }
        set {
            viewVal2 = newValue //引き渡す値をviewValに入れる。
        }
    }
    
    var ViewVal3: Int {//※値が整数型の場合はInt
        get {
            return viewVal3 //値を受け取る側にviewValを返す。
        }
        set {
            viewVal3 = newValue //引き渡す値をviewValに入れる。
        }
    }
    
    var ViewVal4: Int {//地方ごとの番号
        get {
            return viewVal4
        }
        set {
            viewVal4 = newValue
        }
    }


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

