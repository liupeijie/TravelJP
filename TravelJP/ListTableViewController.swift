//
//  ListTableViewController.swift
//  TravelJP
//
//  Created by kojpkn on 2015/10/21.
//  Copyright © 2015年 向日葵会下雨. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController,OGActionChooserDelegate,UIApplicationDelegate {
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    //Sectionで使用する配列を定義
    let sectionTitle: NSMutableArray = ["東京都","千葉県","神奈川県"]
    let tokyo = ["東京スカイツリー", "東京タワー", "渋谷","more"]
    let chiba = ["ディズニー", "幕張", "船橋","more"]
    let kanagawa = ["中華街", "赤レンガ倉庫", "江ノ島","more"]
    var fileName: NSMutableArray!
    var fileCount: Int!
    var spotName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//=======================================================値渡し
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        fileName = appDelegate.ViewVal //fileNameにStringの値を引き渡す
        fileCount = appDelegate.ViewVal2

        
        if saveData.objectForKey("WORD") != nil {
            wordArray = saveData.objectForKey("WORD") as! Array
        }
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    
    //===============================================セクションのタイトルを返す
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section] as? String
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    //===============================================各セルの内容
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ListTableViewCell
        //        let nowIndexPathDictionary: (AnyObject) = wordArray[indexPath.row]
        
        //        cell.label1.text = nowIndexPathDictionary["english"] as? String
        //        cell.label2.text = nowIndexPathDictionary["japanese"] as? String
        
        if(indexPath.section == 0){//==========================indexPath.sectionはセクション番号
            cell.label2.text = tokyo[indexPath.row]
        }else if(indexPath.section == 1){
            cell.label2.text = chiba[indexPath.row]
        }else if(indexPath.section == 2){
            cell.label2.text = kanagawa[indexPath.row]
        }
        
        return cell
    }
    
    
    
    //===============================================Cellが選択された際に呼び出される
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row < 3){
            
//==================================================================================
            if(indexPath.section == 0){//==========================indexPath.sectionはセクション番号
                spotName = tokyo[indexPath.row]
            }else if(indexPath.section == 1){
                spotName = chiba[indexPath.row]
            }else if(indexPath.section == 2){
                spotName = kanagawa[indexPath.row]
            }
//            print("観光地名：\(spotName)")
//==================================================================================
            
//==================================================================================
            let acSheet: OGActionChooser = OGActionChooser.actionChooserWithDelegate(self) as! OGActionChooser
            acSheet.title = "ファイルに追加"
            let imgName: String = "actionChooser_Button.png"
            
            if(fileCount == 0){
                
            }else if(fileCount == 1){
                let b1: OGActionButton = OGActionButton.buttonWithTitle(fileName[0] as! String, imageName: imgName, enabled: true) as! OGActionButton
                acSheet.setButtonsWithArray([b1])
            }else if(fileCount == 2){
                let b1: OGActionButton = OGActionButton.buttonWithTitle(fileName[0] as! String, imageName: imgName, enabled: true) as! OGActionButton
                let b2: OGActionButton = OGActionButton.buttonWithTitle(fileName[1] as! String, imageName: imgName, enabled: true) as! OGActionButton
                acSheet.setButtonsWithArray([b1,b2])
            }else if(fileCount == 3){
                let b1: OGActionButton = OGActionButton.buttonWithTitle(fileName[0] as! String, imageName: imgName, enabled: true) as! OGActionButton
                let b2: OGActionButton = OGActionButton.buttonWithTitle(fileName[1] as! String, imageName: imgName, enabled: true) as! OGActionButton
                let b3: OGActionButton = OGActionButton.buttonWithTitle(fileName[2] as! String, imageName: imgName, enabled: true) as! OGActionButton
                acSheet.setButtonsWithArray([b1,b2,b3])
            }else if(fileCount == 4){
                let b1: OGActionButton = OGActionButton.buttonWithTitle(fileName[0] as! String, imageName: imgName, enabled: true) as! OGActionButton
                let b2: OGActionButton = OGActionButton.buttonWithTitle(fileName[1] as! String, imageName: imgName, enabled: true) as! OGActionButton
                let b3: OGActionButton = OGActionButton.buttonWithTitle(fileName[2] as! String, imageName: imgName, enabled: true) as! OGActionButton
                let b4: OGActionButton = OGActionButton.buttonWithTitle(fileName[3] as! String, imageName: imgName, enabled: true) as! OGActionButton
                acSheet.setButtonsWithArray([b1,b2,b3,b4])
            }
            acSheet.presentInView(tableView.superview)
            //=========================================================
        }
    }
    
    //    override func tableView(tableView: UITableView,canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    //    {
    //        return true
    //    }
    
    //===============================================エディット機能の提供に必要なメソッド
    //    override func tableView(tableView: UITableView,
    //        commitEditingStyle editingStyle: UITableViewCellEditingStyle,
    //        forRowAtIndexPath indexPath: NSIndexPath) {
    //
    //    }
    
    //===============================================こちらのメソッドでindexPathで指定されたCell毎のRowAction配列を設定します
    //    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath)
    //        -> [AnyObject]? {
    //            let editAction =
    //            UITableViewRowAction(style: .Normal, // 削除等の破壊的な操作を示さないスタイル
    //                title: "edit"){(action, indexPath) in print("\(indexPath) edited")}
    //            editAction.backgroundColor = UIColor.greenColor()
    //            let deleteAction =
    //            UITableViewRowAction(style: .Default, // 標準のスタイル
    //                title: "delete"){(action, indexPath) in print("\(indexPath) deleted")}
    //            deleteAction.backgroundColor = UIColor.redColor()
    //            return [editAction, deleteAction]
    //    }
    
    //===============================================セルの並び替えを有効にする
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
    }
    //===============================================戻るボタン
    @IBAction func backBtn(sender: AnyObject) {
        self.dismissViewControllerAnimated(true , completion: nil)
    }
    
    //==================================================================================//ポップアップのボタンを押した時の挙動
    func actionChooser(ac: OGActionChooser, buttonPressedWithIndex index: Int) {
        switch index {
        case 0:
            NSLog("1")
            print("観光地名：\(spotName)")
        case 1:
            NSLog("2")
        case 2:
            NSLog("3")
        case 3:
            NSLog("4")
        case 4:
            NSLog("5")
        case 5:
            NSLog("6")
        case 6:
            NSLog("7")
        default:
            NSLog("clicked button with index: %i", index+1)
        }
    }
    //==================================================================================
    
}
