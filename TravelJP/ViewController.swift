//
//  ViewController.swift
//  TravelJP
//
//  Created by 向日葵会下雨 on H27/10/11.
//  Copyright © 平成27年 向日葵会下雨. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    let saveData = NSUserDefaults.standardUserDefaults()
    var spotArray: [AnyObject] = []
    var spotArray2: [AnyObject] = []
    var spotArray3: [AnyObject] = []
    var fileNumber = 0
    @IBOutlet var tableView: UITableView!

    //テーブルに表示するセル配列
//    let items: NSMutableArray = ["TEST1", "TEST2", "TEST3"]
    
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
        // Do any additional setup after loading the view, typically from a nib.
        
        //テーブルビュー初期化、関連付け
        tableView.delegate      =   self
        tableView.dataSource    =   self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.estimatedRowHeight = 84
        tableView.rowHeight = UITableViewAutomaticDimension
        print("fileNumber:\(fileNumber)")
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //ファイルナンバーによって表示するセルの数を変える
        if(fileNumber == 1){
            return self.spotArray.count
        }else if(fileNumber == 2){
            return self.spotArray2.count
        }else if(fileNumber == 3){
            return self.spotArray3.count
        }else{
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        // Cellに値を設定. //ファイルナンバーによって表示するセルの内容を変える
        if(fileNumber == 1){
            cell.textLabel?.text = "\(spotArray[indexPath.row])"
            return cell
        }else if(fileNumber == 2){
            cell.textLabel?.text = "\(spotArray2[indexPath.row])"
            return cell
        }else if(fileNumber == 3){
            cell.textLabel?.text = "\(spotArray3[indexPath.row])"
            return cell
        }else{
            cell.textLabel?.text = "aaaa"
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("セルを選択しました！ #\(indexPath.row)!")
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // 削除のとき.
        if editingStyle == UITableViewCellEditingStyle.Delete {
            print("削除")
            
            // 指定されたセルのオブジェクトをmyItemsから削除する.
//            items.removeObjectAtIndex(indexPath.row)
            
            // TableViewを再読み込み.
            tableView.reloadData()
        }
    }
    
    /*
    今はただテスト用に作ったもの、画面や変数など整いたら地図画面に遷移するかも
    */
    @IBAction func addCell() {
        print("追加")
        
        // myItemsに追加.
//        items.addObject("add Cell")
        
        // TableViewを再読み込み.
        tableView.reloadData()
    }
  
    
    @IBAction func makeRoot() {
        //ルート作成ボタンのメソット
    }
    
    @IBAction func returnViewController (segue: UIStoryboardSegue) {
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

