//
//  AddViewController.swift
//  TravelJP
//
//  Created by 向日葵会下雨 on H27/10/16.
//  Copyright © 平成27年 向日葵会下雨. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class AddViewController: UIViewController, CLLocationManagerDelegate, UISearchBarDelegate {
    var locMgr:CLLocationManager!
    
    let saveData = NSUserDefaults.standardUserDefaults()
    var spotArray: [AnyObject] = []
    var spotArray2: [AnyObject] = []
    var spotArray3: [AnyObject] = []
    var fileNumber = 0
    var i = 0
    @IBOutlet var ido: UILabel!
    @IBOutlet var keido: UILabel!
    
    @IBOutlet var spot1lbl: UILabel!
    @IBOutlet var spot1ido: UILabel!
    @IBOutlet var spot1keido: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //=======================================================値受け取り
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        fileNumber = appDelegate.ViewVal3
        print("fileNumber:\(fileNumber)")
        //=======================================================
        if(fileNumber == 1){
            if (saveData.objectForKey("file1Key") != nil ){
                spotArray = saveData.objectForKey("file1Key") as! Array
                for(i=0;i<spotArray.count;i++){
                    print("No.\(i+1):\(spotArray[i])")
                }
            }
        }else if(fileNumber == 2){
            if (saveData.objectForKey("file2Key") != nil ){
                spotArray2 = saveData.objectForKey("file2Key") as! Array
            }
        }else if(fileNumber == 3){
            if (saveData.objectForKey("file3Key") != nil ){
                spotArray3 = saveData.objectForKey("file3Key") as! Array
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 現在地の取得.
        locMgr = CLLocationManager()
        locMgr.delegate = self
        // セキュリティ認証のステータスを取得.
        let status = CLLocationManager.authorizationStatus()
        
        // まだ認証が得られていない場合は、認証ダイアログを表示.
        if(status == CLAuthorizationStatus.NotDetermined) {
            print("didChangeAuthorizationStatus:\(status)");
            // まだ承認が得られていない場合は、認証ダイアログを表示.
            self.locMgr.requestAlwaysAuthorization()
        }
        // 取得精度の設定.
        locMgr.desiredAccuracy = kCLLocationAccuracyBest
        // 取得頻度の設定.
        locMgr.distanceFilter = 100
    }
    
    // 現状のステータス状態を表示
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        print("didChangeAuthorizationStatus");
        // 認証のステータスをログで表示.
        var statusStr = "";
        switch (status) {
        case .NotDetermined:
            statusStr = "NotDetermined"
            locMgr.requestWhenInUseAuthorization()
        case .Restricted:
            statusStr = "Restricted"
        case .Denied:
            statusStr = "Denied"
        case .AuthorizedAlways:
            statusStr = "AuthorizedAlways"
        case .AuthorizedWhenInUse:
            statusStr = "AuthorizedWhenInUse"
        }
        print(" CLAuthorizationStatus: \(statusStr)")
    }
    
    // 位置情報取得に成功したときに呼び出されるデリゲート.
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation){
        // 緯度・経度の表示.
        ido.text = "緯度：\(manager.location!.coordinate.latitude)"
        ido.textAlignment = NSTextAlignment.Center
        
        keido.text = "経度：\(manager.location!.coordinate.longitude)"
        keido.textAlignment = NSTextAlignment.Center
    }
    
    // 位置情報取得に失敗した時に呼び出されるデリゲート.
    func locationManager(manager: CLLocationManager,didFailWithError error: NSError){
        print("error")
    }
    
    @IBAction func get(){
        // 現在位置の取得を開始.
        locMgr.startUpdatingLocation()
        // 目的地の文字列から座標検索
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(spotArray[0] as! String, completionHandler: {(placeMarks: [CLPlacemark]?, error: NSError?) -> Void in
            if let placemark = placeMarks?[0]{
                // 地名を入力して検索リストに有れば緯度経度を取得
                print(placemark.location!.coordinate.latitude, placemark.location!.coordinate.longitude)
                self.spot1lbl.text = self.spotArray[0] as? String
                self.spot1ido.text = "緯度：\(placemark.location!.coordinate.latitude)"
                self.spot1keido.text = "経度：\(placemark.location!.coordinate.longitude)"
            } else {
                // 検索リストに無ければ
                print("存在しません")
                self.spot1lbl.text = "存在しまへん"
            }
        })
    }
    
    
    @IBAction func return3 (segue: UIStoryboardSegue) {//戻るボタン用
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}