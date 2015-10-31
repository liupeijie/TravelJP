//
//  ListTableViewController.swift
//  TravelJP
//
//  Created by kojpkn on 2015/10/21.
//  Copyright © 2015年 向日葵会下雨. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController,OGActionChooserDelegate,UIApplicationDelegate {
    let saveData = NSUserDefaults.standardUserDefaults()//NSUserDefaultsを使うための宣言
    var spotArray: [AnyObject] = []//ユーザーデフォルトから取る配列
    var spotArray2: [AnyObject] = []
    var spotArray3: [AnyObject] = []
    //Sectionで使用する配列を定義//
    let sectionTitleKanto = ["東京都","千葉県","神奈川県"]
    let sectionTitleHokkaido = ["札幌","旭川","函館"]
    let sectionTitleOkinawa = ["沖縄県"]
    //===========================================================関東=========
    let tokyo = ["東京スカイツリー", "東京タワー", "渋谷","more"]
    let chiba = ["ディズニー", "幕張", "船橋","more"]
    let kanagawa = ["中華街", "赤レンガ倉庫", "江ノ島","more"]
    //===========================================================北海道=========
    let sapporo = ["札幌1", "札幌2", "札幌3","more"]
    let asahikawa = ["旭川1", "旭川2", "旭川3","more"]
    let hakodate = ["函館1", "函館2", "函館3","more"]
    //===========================================================沖縄=========
    let okinawa = ["沖縄1", "沖縄2", "沖縄3","more"]
    //====================================================================
    var fileName: [AnyObject] = []
    var fileCount: Int!
    var spotName: String!
    var prefectureNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //=======================================================値受け取り
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        fileName = appDelegate.ViewVal //fileNameにStringの値を引き渡す
        fileCount = appDelegate.ViewVal2
        prefectureNumber = appDelegate.ViewVal4
        //=======================================================
        
        //ユーザーデフォルトリロード
        if saveData.objectForKey("file1Key") != nil {
            spotArray = saveData.objectForKey("file1Key") as! Array
        }
        if saveData.objectForKey("file2Key") != nil {
            spotArray2 = saveData.objectForKey("file2Key") as! Array
        }
        if saveData.objectForKey("file3Key") != nil {
            spotArray3 = saveData.objectForKey("file3Key") as! Array
        }
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if(prefectureNumber == 1){//--------------------------北海道
            return sectionTitleHokkaido.count
        }else if(prefectureNumber == 2){//--------------------関東
            return sectionTitleKanto.count
        }else if(prefectureNumber == 3){//--------------------沖縄
            return sectionTitleOkinawa.count
        }else{
            return 0//ダミー
        }
    }
    
    
    //===============================================セクションのタイトルを返す
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(prefectureNumber == 1){//--------------------------北海道
            return sectionTitleHokkaido[section]
        }else if(prefectureNumber == 2){//--------------------関東
            return sectionTitleKanto[section]
        }else if(prefectureNumber == 3){//--------------------沖縄
            return sectionTitleOkinawa[section]
        }else{
            return ""//ダミー
        }
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
        
        if(prefectureNumber == 1){//--------------------------北海道
            if(indexPath.section == 0){//==========================indexPath.sectionはセクション番号
                cell.label2.text = sapporo[indexPath.row]
            }else if(indexPath.section == 1){
                cell.label2.text = asahikawa[indexPath.row]
            }else if(indexPath.section == 2){
                cell.label2.text = hakodate[indexPath.row]
            }
        }else if(prefectureNumber == 2){//--------------------関東
            if(indexPath.section == 0){
                cell.label2.text = tokyo[indexPath.row]
            }else if(indexPath.section == 1){
                cell.label2.text = chiba[indexPath.row]
            }else if(indexPath.section == 2){
                cell.label2.text = kanagawa[indexPath.row]
            }
        }else if(prefectureNumber == 3){//--------------------沖縄
            if(indexPath.section == 0){
                cell.label2.text = okinawa[indexPath.row]
            }
        }
        return cell
    }
    
    
    
    //===============================================Cellが選択された際に呼び出される
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row < 3){
            
//==================================================================================
            if(prefectureNumber == 1){//--------------------------北海道
                if(indexPath.section == 0){//==========================indexPath.sectionはセクション番号
                    spotName = sapporo[indexPath.row]//spotNameに観光地名を一時的に保存
                }else if(indexPath.section == 1){
                    spotName = asahikawa[indexPath.row]
                }else if(indexPath.section == 2){
                    spotName = hakodate[indexPath.row]
                }
            }else if(prefectureNumber == 2){//--------------------関東
                if(indexPath.section == 0){
                    spotName = tokyo[indexPath.row]
                }else if(indexPath.section == 1){
                    spotName = chiba[indexPath.row]
                }else if(indexPath.section == 2){
                    spotName = kanagawa[indexPath.row]
                }
            }else if(prefectureNumber == 3){//--------------------沖縄
                if(indexPath.section == 0){
                    spotName = okinawa[indexPath.row]
                }
            }
//            print("観光地名：\(spotName)")
//==================================================================================
            
//==================================================================================
            let acSheet: OGActionChooser = OGActionChooser.actionChooserWithDelegate(self) as! OGActionChooser
            acSheet.title = "ファイルに追加"
            let imgName: String = "actionChooser_Button.png"
            
            //ファイル数と同じ数だけボタンを表示
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
        
        if let indexPath = tableView.indexPathForSelectedRow {//=======セル選択解除==
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
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
            spotArray.append(spotName)//配列にspotNameの文字列を保存
            saveData.setObject(spotArray, forKey: "file1Key")//配列をspotNameKeyで保存
            saveData.synchronize()
            
            let alert = UIAlertController(
                title: "登録完了",
                message: "ファイルに登録が完了しました",
                preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.Default,
                    handler:nil
                )
            )
            self.presentViewController(alert, animated: true, completion:nil)
        case 1:
            NSLog("2")
            print("観光地名：\(spotName)")
            spotArray2.append(spotName)//配列にspotNameの文字列を保存
            saveData.setObject(spotArray2, forKey: "file2Key")//配列をspotNameKeyで保存
            saveData.synchronize()
            
            let alert = UIAlertController(
                title: "登録完了",
                message: "ファイルに登録が完了しました",
                preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.Default,
                    handler:nil
                )
            )
            self.presentViewController(alert, animated: true, completion:nil)
            
        case 2:
            NSLog("3")
            spotArray3.append(spotName)//配列にspotNameの文字列を保存
            saveData.setObject(spotArray3, forKey: "file3Key")//配列をspotNameKeyで保存
            saveData.synchronize()
            
            let alert = UIAlertController(
                title: "登録完了",
                message: "ファイルに登録が完了しました",
                preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.Default,
                    handler:nil
                )
            )
            self.presentViewController(alert, animated: true, completion:nil)
        case 3:
            NSLog("4")
            //削除
            spotArray.removeAll()
            spotArray2.removeAll()
            spotArray3.removeAll()
            saveData.removeObjectForKey("file1Key")
            saveData.removeObjectForKey("file2Key")
            saveData.removeObjectForKey("file3Key")
            let alert = UIAlertController(
                title: "削除完了",
                message: "ファイルの中身を全て削除しました",
                preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.Default,
                    handler:nil
                )
            )
            self.presentViewController(alert, animated: true, completion:nil)
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
